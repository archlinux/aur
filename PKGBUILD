# Maintainer: David Sugar <tychosoft@gmail.com>
pkgname=storehouse
pkgver=0.0.7
pkgrel=1
epoch=
pkgdesc="Storehouse for release tarballs"
url="https://codeberg.org/dyfet/$pkgname"
arch=(x86_64 aarch64)
license=('GPL')
source=($pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz $pkgname.service)
makedepends=(make go)
sha256sums=('e0b56f389864d719ba6b8872c2d8d06d02f6d822f1df1a397d666f4cc343c5e5' '5dadefb0087e72740da262520a9c6bc7f202911c1ce30125d4a80f958d13336c') 

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

