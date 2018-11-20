# Maintainer: chenjiageng <chenjiagen88@gmail.com>

_pkgname=dogcom
pkgname=${_pkgname}-git
pkgver=1.6.2.r2.g6f5f550
pkgrel=1
pkgdesc="Drcom-generic implementation in C."
arch=('i686' 'x86_64')
url="https://github.com/mchome/dogcom"
license=('GPL3')
depends=('glibc')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname"::"git+${url}.git"
        "dogcom-d.service"
        "dogcom-p.service"
        )
md5sums=('SKIP'
         '4c0445b9e9bea563f95de7201d366a36'
         '41cf29926b27c72c8cdead133e396900')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  sed -i "s/ -Werror//g" Makefile # ignore warnings
  sed -i "/INSTALL_DIR =.*/d" Makefile # ignore INSTALL_DIR
  make
}


package() {
    	install -D -m644 "${srcdir}/${pkgname}/sample-d.conf" "${pkgdir}/etc/dogcom.d/dhcp.conf"
        install -D -m644 "${srcdir}/${pkgname}/sample-p.conf" "${pkgdir}/etc/dogcom.d/pppoe.conf"
        install -D -m644 "${srcdir}/dogcom-d.service" "${pkgdir}/usr/lib/systemd/system/dogcom-d.service"
        install -D -m644 "${srcdir}/dogcom-p.service" "${pkgdir}/usr/lib/systemd/system/dogcom-p.service"
        install -D -m555 "${srcdir}/${pkgname}/dogcom" "${pkgdir}/usr/bin/dogcom"
}

