# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=opencode-desktop-electron
pkgver=1.14.31
pkgrel=2
pkgdesc='OpenCode Electron desktop app (built from source, runs on system electron41)'
arch=('x86_64' 'aarch64')
url='https://github.com/anomalyco/opencode'
license=('MIT')
depends=(
  'electron41'
  'hicolor-icon-theme'
)
makedepends=(
  'bun'
  'git'
)
optdepends=(
  'opencode: standalone terminal CLI (independent of the desktop app, which embeds its own server)'
)
conflicts=("$pkgname-bin")
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
            '7d021d37b0d305967babfe189320911db281d2fdc49ace2b4b25061f0c31d606'
            '82b5dcd7c56955af41982d8df7828b11907e58ef0199bb9d2e1edac0a9fbbe21'
            '63914eda480b3e0b64f7875c0c326bdc0c1982140c183f4859b840e7b6c1ec20')

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

  bun run --cwd packages/desktop-electron build

  # Strip $srcdir absolute paths leaked into Vite-bundled chunks (CommonJS
  # interop inlines __dirname/__filename). Not dereferenced at runtime, but
  # both namcap and basic hygiene reject packages that contain build-host paths.
  find packages/desktop-electron/out -type f \
    \( -name '*.js' -o -name '*.cjs' -o -name '*.mjs' \) \
    -exec sed -i "s|$srcdir/$pkgname|/usr/lib/$pkgname|g" {} +

  # Force app.isPackaged → true. System electron treats an externally-passed
  # main as a "default app" and sets isPackaged=false, which makes the app
  # pick its dev appId / userData / resourcesPath instead of prod ones.
  sed -i 's/app\.isPackaged/true/g' packages/desktop-electron/out/main/index.js

  local sysver
  sysver=$(< /usr/lib/electron41/version)

  # Build with --linux pacman: this produces both the unpacked app/ directory
  # (we ship that) AND a .pacman archive which embeds the .desktop file and
  # 12-size hicolor icon set that electron-builder generates from the linux
  # config (Categories, MimeType=x-scheme-handler/opencode, Square*Logo.png
  # → hicolor/<size>/apps/...). Re-extracting them into our package keeps us
  # in sync with whatever upstream defines without us hand-maintaining a
  # parallel copy.
  ( cd packages/desktop-electron && bun run package -- \
      --linux pacman \
      -c.asar=false \
      -c.electronDist=/usr/lib/electron41 \
      -c.electronVersion="$sysver" \
      --publish=never )
}

package() {
  local _bld="$srcdir/$pkgname/packages/desktop-electron"

  # Install the unpacked app/ directory to /usr/lib/$pkgname/.
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -a "$_bld/dist/linux-unpacked/resources/app/." "$pkgdir/usr/lib/$pkgname/"

  # Drop musl prebuilds (Arch is glibc) and strip world-writable bits that
  # some npm packages ship with mode 777 (security + namcap).
  find "$pkgdir/usr/lib/$pkgname" -name '*.musl.node' -delete
  chmod -R go-w "$pkgdir/usr/lib/$pkgname"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  # Pull the .desktop entry and full hicolor icon set out of the .pacman
  # archive electron-builder produced. Rewrite it to our pkgname and
  # repoint Exec/Icon/StartupWMClass to our wrapper basename, which is also
  # the Wayland app_id Electron sets via desktopName (set-desktop-name.patch).
  local _eb="$srcdir/.eb-pacman"
  rm -rf "$_eb" && mkdir -p "$_eb"
  bsdtar -xf "$_bld"/dist/*.pacman -C "$_eb"

  local _ebname='@opencode-aidesktop-electron'
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
