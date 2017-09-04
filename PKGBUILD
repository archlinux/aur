# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sddm
pkgver=0.15.0
pkgrel=2
pkgdesc='QML based X11 and Wayland display manager'
arch=('i686' 'x86_64')
url='http://github.com/sddm/sddm'
license=('GPL')
depends=('qt5-declarative' 'xorg-xauth' 'xorg-server')
makedepends=('extra-cmake-modules' 'python-docutils' 'qt5-tools')
backup=('usr/share/sddm/scripts/Xsetup'
        'etc/pam.d/sddm'
        'etc/sddm.conf')
provides=('display-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz"
        sddm.sysusers sddm.tmpfiles)
sha256sums=('7a84089b2e424097664bf7cfb24bdc5896ba0eebf8d54eb77bcac6d16db1e358'
            '421d6d137a32b7a749427f4ab770e5adeef7dac66b138ab6e216ddc0cf4e2cb6'
            'db625f2a3649d6d203e1e1b187a054d5c6263cadf7edd824774d8ace52219677')

prepare() {
  mkdir -p build
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

  install -Dm644 "$srcdir"/sddm.sysusers "$pkgdir"/usr/lib/sysusers.d/sddm.conf
  install -Dm644 "$srcdir"/sddm.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/sddm.conf
}
