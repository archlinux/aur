# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=opencode-desktop
pkgver=1.17.6
pkgrel=1
pkgdesc='OpenCode desktop app (built from source, runs on system electron42)'
arch=('x86_64' 'aarch64')
url='https://github.com/anomalyco/opencode'
license=('MIT')
depends=(
  'electron42'
  'hicolor-icon-theme'
)
makedepends=(
  'bun'
  'git'
  # electron-builder downloads a Ruby-based fpm tool that links against
  # libcrypt.so.1, which is provided by libxcrypt-compat on Arch.
  'libxcrypt-compat'
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
  'relax-bun-version.patch'
  'set-desktop-name.patch'
)
sha256sums=('SKIP'
            '84924177801958340d9d06c4f433e8818f1a7119babcfa56384133c7ce59e65f'
            '82b5dcd7c56955af41982d8df7828b11907e58ef0199bb9d2e1edac0a9fbbe21'
            '32640e478f139cf1658f6948627b14b3e386acf5c589e116a5745ef7c1f0b986')

prepare() {
  cd "$srcdir/$pkgname"

  patch -Np1 -i "$srcdir/relax-bun-version.patch"
  patch -Np1 -i "$srcdir/set-desktop-name.patch"
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
  # 12-size hicolor icon set that electron-builder generates from the linux
  # config (Categories, MimeType=x-scheme-handler/opencode, Square*Logo.png
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

  # Drop musl prebuilds (Arch is glibc): both file-level (*.musl.node, e.g.
  # @msgpackr-extract) and directory-level (e.g. @parcel/watcher-linux-x64-musl).
  # Strip world-writable bits that some npm packages ship with mode 777.
  find "$pkgdir/usr/lib/$pkgname" -name '*.musl.node' -delete
  find "$pkgdir/usr/lib/$pkgname" -depth -type d -name '*-musl*' -exec rm -rf {} +
  chmod -R go-w "$pkgdir/usr/lib/$pkgname"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  # Pull the .desktop entry and full hicolor icon set out of the .pacman
  # archive electron-builder produced. Rewrite it to our pkgname and
  # repoint Exec/Icon/StartupWMClass to our wrapper basename, which is also
  # the Wayland app_id Electron sets via desktopName (set-desktop-name.patch).
  local _eb="$srcdir/.eb-pacman"
  rm -rf "$_eb" && mkdir -p "$_eb"
  bsdtar -xf "$_bld"/dist/*.pacman -C "$_eb"

  local _ebname='@opencode-aidesktop'
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
