# Maintainer: David Sugar <tychosoft@gmail.com>
pkgname=storehouse
pkgver=0.0.5
pkgrel=1
epoch=
pkgdesc="Storehouse for release tarballs"
url="https://codeberg.org/dyfet/$pkgname"
arch=(x86_64 aarch64)
license=('GPL')
source=($pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz $pkgname.service)
makedepends=(make go)
sha256sums=('01875e31863e27da9898bdaf84e64fcd1904102d2fed2938e5892a9f733abd42' 'af2aaefa14f2e1e53be25ec81d8255db0108f283831c3fcc0a64dc4cdb803296') 

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
    make DESTDIR="$pkgdir" PREFIX=/usr SBINDIR=/usr/bin SYSCONFDIR=/etc LOCALSTATEDIR=/var package
    strip "$pkgdir"/usr/bin/*
    gzip "$pkgdir"/usr/share/man/man*/*
    install -d -m 700 "$pkgdir"/var/lib/$pkgname
    install -dm755 ${pkgdir}/usr/lib/systemd/system
    install -m744 $srcdir/$pkgname.service ${pkgdir}/usr/lib/systemd/system/
}

