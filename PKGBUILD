# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sddm
pkgver=0.14.0
pkgrel=2
pkgdesc='QML based X11 display manager'
arch=('i686' 'x86_64')
url='http://github.com/sddm/sddm'
license=('GPL')
depends=('qt5-declarative' 'xorg-xauth')
makedepends=('extra-cmake-modules' 'python-docutils' 'qt5-tools')
install="${pkgname}.install"
backup=('usr/share/sddm/scripts/Xsetup'
        'etc/pam.d/sddm'
        'etc/sddm.conf')
provides=('display-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz"
        sddm-fix-avatars.patch::"https://github.com/sddm/sddm/commit/ecb903e4.patch")
sha256sums=('a551551a6ba324e9c384c89bc63e871de65fea3740eadbea2d63df86045f8205'
            'a2bcdc20bb8915ed4eae810832266ff3bd22a523813ef1674eb25a28800e4368')

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
