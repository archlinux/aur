# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sddm
pkgver=0.14.0
pkgrel=2
pkgdesc='QML based X11 display manager'
arch=('i686' 'x86_64')
url='http://github.com/sddm/sddm'
license=('GPL')
depends=('qt5-declarative')
makedepends=('extra-cmake-modules' 'python-docutils' 'qt5-tools')
install="${pkgname}.install"
backup=('usr/share/sddm/scripts/Xsetup'
        'etc/pam.d/sddm'
        'etc/sddm.conf')
provides=('display-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz"
        sddm-fix-avatars.patch::"https://github.com/sddm/sddm/commit/ecb903e4.patch")
md5sums=('393fbed2f2e9d030e1717949867e96c8'
         'f929c400807144f3bc53d8ed6ed74f21')

prepare() {
  mkdir -p build

# Fix displaying avatars
  cd $pkgname-$pkgver
  patch -p1 -i ../sddm-fix-avatars.patch
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/sddm \
        -DDBUS_CONFIG_FILENAME=sddm_org.freedesktop.DisplayManager.conf \
        -DBUILD_MAN_PAGES=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
