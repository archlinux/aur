# Maintainer: Joseph R. Quinn <quinn.josephr@proton.me>

pkgname=claude-crab
pkgver=1.1.1
pkgrel=1
pkgdesc="Clawd walks above your KDE Plasma panel and animates to what Claude Code is doing"
arch=('x86_64')
url="https://github.com/quinnjr/claude-crab"
license=('MIT')
# qt6-wayland is not pulled in by layer-shell-qt, which depends only on
# qt6-base and wayland -- but without the Qt Wayland platform plugin the app
# cannot start on the only session it properly supports.
# hicolor-icon-theme owns the directories the icons install into.
# namcap reports qt6-wayland as possibly unneeded; it cannot see that the
# dependency is on the QPA plugin, loaded at runtime rather than linked.
depends=(
  'qt6-base'
  'qt6-declarative'
  'qt6-wayland'
  'layer-shell-qt'
  'hicolor-icon-theme'
  # claude-crab-hooks is a stdlib-only Python script installed to /usr/bin, so
  # this is a runtime dependency and not merely a build one.
  'python'
)
# Pillow renders the sprite sheets and icons at build time; they are generated
# rather than shipped, so the art and its manifest cannot drift apart.
makedepends=('cmake' 'ninja' 'python-pillow')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e368fb48f07e5bdd2f2b0dcd0088b9a10a701d2b64c5fd67e39febb29d3148aa')

build() {
  cmake -B build -S "$pkgname-$pkgver" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname-$pkgver/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
