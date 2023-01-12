# Maintainer: David Sugar <tychosoft@gmail.com>
pkgname=storehouse
pkgver=0.0.4
pkgrel=3
epoch=
pkgdesc="Storehouse for release tarballs"
url="https://codeberg.org/dyfet/$pkgname"
arch=(x86_64 aarch64)
license=('GPL')
source=($pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz $pkgname.service)
makedepends=(make go)
sha256sums=('aeda82dd2dd062d9045f81bb728fa4ac7f9e4acfd24bcf45e5d897300481e6d5' '43225a04618ee6df1cfb6953b4ea9d84e3b781da3dcf0ec17fb9f53b1ed83359') 

build() {
    cd "$pkgname"
    if test ! -d vendor ; then make vendor ; fi
}

check() {
    cd "$pkgname"
    make package-test
}

package() {
    cd "$pkgname"
    bldarch=`uname -m`
    make DESTDIR="$pkgdir" PREFIX=/usr SBINDIR=/usr/sbin SYSCONFDIR=/etc LOCALSTATEDIR=/var package
    strip "$pkgdir"/usr/sbin/*
    install -d -m 700 "$pkgdir"/var/lib/$pkgname
    install -dm755 ${pkgdir}/usr/lib/systemd/system
    install -m744 $srcdir/$pkgname.service ${pkgdir}/usr/lib/systemd/system/
}

