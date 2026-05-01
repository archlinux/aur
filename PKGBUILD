# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=opencode-desktop-electron
pkgver=1.14.31
pkgrel=1
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
  'opencode: matching CLI for terminal use'
)
conflicts=("$pkgname-bin")
options=('!strip' '!debug')
# Use git source (not the GitHub tag tarball): Tailwind v4's @tailwindcss/oxide
# scanner enumerates source files via the git index when .git is present, and
# falls back to a traversal that misses ~28% of the renderer's utility classes
# when it isn't. Cloning the tag preserves .git so we get the same CSS as CI.
source=(
  "$pkgname::git+https://github.com/anomalyco/opencode.git#tag=v$pkgver"
  "$pkgname.desktop"
  "$pkgname.sh"
  'relax-bun-version.patch'
)
sha256sums=('SKIP'
            'edc055d5450c54f94b47000ed4cc7a26bf3a625307054b5a2328134945d565db'
            '7d021d37b0d305967babfe189320911db281d2fdc49ace2b4b25061f0c31d606'
            '82b5dcd7c56955af41982d8df7828b11907e58ef0199bb9d2e1edac0a9fbbe21')

prepare() {
  cd "$srcdir/$pkgname"

  patch -Np1 -i "$srcdir/relax-bun-version.patch"
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

  # asar=false → ship the unpacked app/ directory instead of an asar bundle
  # (Arch Wiki accepts either). The directory form is easier to inspect and
  # patch, and merges what would otherwise be split across app.asar +
  # app.asar.unpacked into a single tree.
  ( cd packages/desktop-electron && bun run package -- \
      --linux dir \
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

  install -Dm755 "$srcdir/$pkgname.sh"      "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  local png size
  for png in "$_bld"/resources/icons/*.png; do
    [[ -f $png ]] || continue
    size=$(basename "$png" .png)
    [[ $size =~ ^[0-9]+x[0-9]+$ ]] || continue
    install -Dm644 "$png" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/$pkgname.png"
  done

  install -Dm644 "$srcdir/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
