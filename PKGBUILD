# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=opencode-desktop
pkgver=1.18.26
pkgrel=1
pkgdesc='OpenCode desktop app (built from source, runs on system electron42)'
arch=('x86_64' 'aarch64')
url='https://github.com/anomalyco/opencode'
license=('MIT')
depends=(
  'electron42'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
)
makedepends=(
  'bun'
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
# when it isn't. Cloning the tag preserves .git so we get the same CSS as CI.
source=(
  "$pkgname::git+https://github.com/anomalyco/opencode.git#tag=v$pkgver"
  "$pkgname.sh"
  'enable-pacman-target.patch'
)
sha256sums=('SKIP'
            '9d4ea3c1ce242edef248cae1cfaca971ef05c7225e52b49f8dd851395d0bbbbe'
            'c3a544a2b7ffc252a55da303c2327de4ee075e0b72bf4167d7691fba1cb92ed6')

prepare() {
  cd "$srcdir/$pkgname"

  patch -Np1 -i "$srcdir/enable-pacman-target.patch"
}

build() {
  cd "$srcdir/$pkgname"

  export OPENCODE_CHANNEL=prod
  export ELECTRON_BUILDER_CACHE="$srcdir/.cache/electron-builder"

  bun install

  bun run --cwd packages/desktop build

  # Strip $srcdir absolute paths leaked into Vite-bundled chunks (CommonJS
  # interop inlines __dirname/__filename). Not dereferenced at runtime, but
  # both namcap and basic hygiene reject packages that contain build-host paths.
  find packages/desktop/out -type f \
    \( -name '*.js' -o -name '*.cjs' -o -name '*.mjs' \) \
    -exec sed -i "s|$srcdir/$pkgname|/usr/lib/$pkgname|g" {} +

  # Force app.isPackaged → true. System electron treats an externally-passed
  # main as a "default app" and sets isPackaged=false, which makes the app
  # pick its dev appId / userData / resourcesPath instead of prod ones.
  sed -i 's/app\.isPackaged/true/g' packages/desktop/out/main/index.js

  local sysver
  sysver=$(< /usr/lib/electron42/version)

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
      -c.electronDist=/usr/lib/electron42 \
      -c.electronVersion="$sysver" \
      --publish=never )
}

package() {
  local _bld="$srcdir/$pkgname/packages/desktop"

  # Install the unpacked app/ directory to /usr/lib/$pkgname/.
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -a "$_bld/dist/linux-unpacked/resources/app/." "$pkgdir/usr/lib/$pkgname/"

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

  install -Dm644 "$srcdir/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
