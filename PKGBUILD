# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=opencode-desktop
pkgver=2.1.0
pkgrel=1
pkgdesc='OpenCode desktop app (built from source, runs on system electron44)'
arch=('x86_64' 'aarch64')
url='https://github.com/anomalyco/opencode'
license=('MIT')
depends=(
  'electron44'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'icu'
)
makedepends=(
  'bun>=1.4.2'
  'git'
  # electron-builder downloads a Ruby-based fpm tool that links against
  # libcrypt.so.1, which is provided by libxcrypt-compat on Arch.
  'libxcrypt-compat'
  'node-gyp'
)
optdepends=(
  'opencode: standalone terminal CLI (independent of the desktop app, which embeds its own server)'
  'nodejs: needed only when invoking npm CLI helpers shipped inside bundled node_modules (marked, js-yaml, semver, ...) — the desktop app itself runs entirely under electron'
)
# Renamed from opencode-desktop-electron after upstream renamed
# packages/desktop-electron → packages/desktop in v1.14.39.
replaces=('opencode-desktop-electron')
conflicts=(
  "$pkgname-bin"
  'opencode-desktop-electron'
  'opencode-desktop-electron-bin'
)
options=('!strip' '!debug')
# Use git source (not the GitHub tag tarball): Tailwind v4's @tailwindcss/oxide
# scanner enumerates source files via the git index when .git is present, and
# falls back to a traversal that misses ~28% of the renderer's utility classes
# when it isn't. Cloning the pinned commit preserves .git for the same CSS as CI.
_commit=60c68d145a14127ce633e26aa5fdfb882a7baa6d
source=(
  "$pkgname-$pkgver-$_commit::git+https://github.com/anomalyco/opencode.git#commit=$_commit"
  "$pkgname.sh"
  'enable-pacman-target.patch'
)
sha256sums=('SKIP'
            '5474a17cc16bd58bc52117f8cc49c319e7c6861863873fbb8a86953794ba9ef1'
            '75ded1e76c4de6f00e116910b46b103199da5bbb2679b8b08d77999544c77b77')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-$_commit"

  patch -Np1 -i "$srcdir/enable-pacman-target.patch"
}

build() {
  local _src="$srcdir/$pkgname-$pkgver-$_commit"
  cd "$_src"

  export OPENCODE_CHANNEL=prod
  export ELECTRON_BUILDER_CACHE="$srcdir/.cache/electron-builder"

  bun install --frozen-lockfile

  OPENCODE_CHANNEL=latest OPENCODE_VERSION="$pkgver" \
    bun packages/cli/script/build.ts --single --baseline
  OPENCODE_CLI_DIST="$_src/packages/cli/dist" bun run --cwd packages/desktop build

  # Strip $srcdir absolute paths leaked into Vite-bundled chunks (CommonJS
  # interop inlines __dirname/__filename). Not dereferenced at runtime, but
  # both namcap and basic hygiene reject packages that contain build-host paths.
  find packages/desktop/out -type f \
    \( -name '*.js' -o -name '*.cjs' -o -name '*.mjs' \) \
    -exec sed -i "s|$_src|/usr/lib/$pkgname|g" {} +

  # External system Electron uses development mode and its own resources path.
  # Point packaged main-process chunks at this app's installed CLI/resources.
  find packages/desktop/out/main -type f -name '*.js' \
    -exec sed -i -e 's/app\.isPackaged/true/g' \
      -e "s|process\.resourcesPath|\"/usr/lib/$pkgname/resources\"|g" {} +

  local sysver
  sysver=$(< /usr/lib/electron44/version)

  # Build with --linux pacman: this produces both the unpacked app/ directory
  # (we ship that) AND a .pacman archive which embeds the .desktop file and
  # generated hicolor icon set from the linux config (Categories,
  # MimeType=x-scheme-handler/opencode, Square*Logo.png
  # → hicolor/<size>/apps/...). Re-extracting them into our package keeps us
  # in sync with whatever upstream defines without us hand-maintaining a
  # parallel copy.
  ( cd packages/desktop && bun run package -- \
      --linux pacman \
      -c.asar=false \
      -c.electronDist=/usr/lib/electron44 \
      -c.electronVersion="$sysver" \
      --publish=never )
}

package() {
  local _src="$srcdir/$pkgname-$pkgver-$_commit"
  local _bld="$_src/packages/desktop"
  local _out
  case "$CARCH" in
    x86_64) _out='linux-unpacked' ;;
    aarch64) _out='linux-arm64-unpacked' ;;
    *) echo "ERROR: unsupported architecture: $CARCH" >&2; return 1 ;;
  esac

  # Install the unpacked app/ directory to /usr/lib/$pkgname/.
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -a "$_bld/dist/$_out/resources/app/." "$pkgdir/usr/lib/$pkgname/"
  install -Dm755 "$_bld/dist/$_out/resources/opencode-cli" \
    "$pkgdir/usr/lib/$pkgname/resources/opencode-cli"
  install -Dm644 "$_bld/dist/$_out/resources/opencode-cli.version" \
    "$pkgdir/usr/lib/$pkgname/resources/opencode-cli.version"

  # Pin the Wayland app_id to our wrapper basename. electron-builder injects
  # "desktopName": "<appId>.desktop" (currently "ai.opencode.desktop.desktop")
  # into the unpacked app's package.json based on its linux config; Electron's
  # ozone-wayland (since electron/electron#51426) reads that key and uses it
  # (with the .desktop suffix stripped) as the Wayland app_id. Without this
  # override the running window's app_id is "ai.opencode.desktop" while our
  # .desktop launcher is "$pkgname.desktop" (StartupWMClass=$pkgname), so KDE
  # Plasma can't match the window to its launcher and falls back to a generic
  # icon. Insert the key if upstream/electron-builder ever stops emitting it.
  local _pj="$pkgdir/usr/lib/$pkgname/package.json"
  if grep -q '"desktopName"' "$_pj"; then
    sed -i "s|\"desktopName\":[[:space:]]*\"[^\"]*\"|\"desktopName\": \"$pkgname\"|" "$_pj"
  else
    sed -i "/\"name\":/a\\  \"desktopName\": \"$pkgname\"," "$_pj"
  fi
  grep -q "\"desktopName\": \"$pkgname\"" "$_pj" || {
    echo "ERROR: failed to set desktopName in $_pj" >&2
    return 1
  }

  # Drop musl prebuilds (Arch is glibc): both file-level (*.musl.node, e.g.
  # @msgpackr-extract) and directory-level (e.g. @parcel/watcher-linux-x64-musl).
  # Strip world-writable bits that some npm packages ship with mode 777.
  find "$pkgdir/usr/lib/$pkgname" -name '*.musl.node' -delete
  find "$pkgdir/usr/lib/$pkgname" -depth -type d -name '*-musl*' -exec rm -rf {} +
  chmod -R go-w "$pkgdir/usr/lib/$pkgname"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  # Pull the .desktop entry and generated hicolor icon set out of the .pacman
  # archive electron-builder produced (enable-pacman-target.patch makes
  # eb include "pacman" in its linux target list). Rewrite the launcher
  # paths to our wrapper basename, which is also the Wayland app_id we
  # pinned via desktopName in the package.json override above.
  local _eb="$srcdir/.eb-pacman"
  rm -rf "$_eb" && mkdir -p "$_eb"
  bsdtar -xf "$_bld"/dist/*.pacman -C "$_eb"

  local _ebname='ai.opencode.desktop'
  sed -e "s|^Exec=.*|Exec=$pkgname %U|" \
      -e "s|^Icon=.*|Icon=$pkgname|" \
      -e "s|^StartupWMClass=.*|StartupWMClass=$pkgname|" \
      "$_eb/usr/share/applications/$_ebname.desktop" |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop"

  local png size
  for png in "$_eb"/usr/share/icons/hicolor/*/apps/"$_ebname.png"; do
    size=$(basename "$(dirname "$(dirname "$png")")")
    install -Dm644 "$png" "$pkgdir/usr/share/icons/hicolor/$size/apps/$pkgname.png"
  done

  install -Dm644 "$_src/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
