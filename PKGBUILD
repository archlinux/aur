# Maintainer: Que Quotion <quequotion@bugmenot.com>

pkgname=('pt1-drv-stz-git')
pkgver=23.00df64e
pkgrel=1
pkgdesc="pt1_drv modified by stz2012."
arch=('i686' 'x86_64')
url='https://github.com/stz2012/recpt1/'
license=('unknown')
provides=('pt1_drv')
source=("git+https://github.com/stz2012/recpt1.git"
        'vmalloc.patch'
        'Makefile.patch')
sha512sums=('SKIP'
            'c0e99016e7cc28fde3c65842669686b0c20f0f885e6b4d53ecd0229a0f8e4a85b49957346fdea71a5bea100d9fd6ce62e3cffec407583445a4c01492bb96d3bf'
            '05990ca712cfbbad9a8f910972f4ac33395f040cd8950ce3692ddce555ca43cda7d2793cdea543a518290d43e8d3ac2282c85160af48e2c0826d43788084c21e')
makedepends=('git')
optdepends=('recpt1-stz-git: Earthsoft PT-series controller')

pkgver() {
  cd "recpt1"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "recpt1"
  patch -Np2 < ../vmalloc.patch
  patch -Np2 < ../Makefile.patch
}

build() {
  cd "recpt1/driver"
  make
}

package() {
  cd "recpt1/driver"

  mkdir -m755 -p "${pkgdir}/etc/udev/rules.d/"
  make DESTDIR="${pkgdir}" install_compress

  mkdir -m755 -p "${pkgdir}/etc/modprobe.d/"
  echo "blacklist earth-pt1" >> pt1-blacklist.conf
  install -m644 pt1-blacklist.conf "${pkgdir}/etc/modprobe.d/pt1-blacklist.conf"
  install -m644 etc/99-pt1.rules "${pkgdir}/etc/udev/rules.d/"

}
