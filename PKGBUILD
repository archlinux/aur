# Maintainer: Ludovic Fauvet <etix@l0cal.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-wayland-nvidia-gbm-fix
pkgver=5.15.2+kde+r36
pkgrel=1
_commit=0c8eccb28758707ce681fde8878eacb61ca01d78
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Provides APIs for Wayland (including the Qt fix for Nvidia GBM support)'
depends=('qt5-declarative' 'libxcomposite')
makedepends=('vulkan-headers' 'git')
groups=('qt' 'qt5')
_pkgfqn=qtwayland
source=(git+https://invent.kde.org/adrienfaveraux/$_pkgfqn#commit=$_commit)
sha256sums=('SKIP')
provides=('qt5-wayland')
conflicts=('qt5-wayland')

pkgver() {
  cd $_pkgfqn
  echo "5.15.2+kde+r36"
}

prepare() {
  mkdir -p build

  cd $_pkgfqn
  git revert -n 30cb2a87fcc6265232cb5a3ffce9836da6e531d6 # Revert version bump
}

build() {
  cd build

  qmake ../${_pkgfqn}
  make
}

package() {
  cd build

  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${pkgname}
}
