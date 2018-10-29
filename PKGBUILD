# Maintainer: languiar <languitar at semipol dot de>
# Contributor: Brian Bidulock <bidulock@openss7.org>
pkgname=spread-daemon
pkgver=5.0.1
pkgrel=1
pkgdesc="An open source high performance messaging service - Daemon and C API"
url="http://www.spread.org"
license=('custom')
depends=(glibc)
makedepends=()
options=(!makeflags)
arch=('x86_64' 'i686' 'armv6h')
install=$pkgname.install
source=("http://www.spread.org/download/spread-src-$pkgver.tar.gz?FILE=spread-src-$pkgver.tar.gz&name=aur&company=archlinux&email=foo@example.org" $pkgname.install spread.service)
md5sums=('ca2e9da39bdaddb93178d33a52a6b00b'
         '05e01e6f5e775be72608854e6f0d7695'
         '93a08034a2a55644b8c57cd821e3a353')

build() {
    cd $srcdir/spread-src-$pkgver

    export CFLAGS="$CFLAGS -fPIC"
    ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc \
        --sbindir=/usr/bin
    make || return 1
}

package() {
    cd $srcdir/spread-src-$pkgver
    make DESTDIR=$pkgdir install
    install -D license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE || return 1
    install -Dm644 "${srcdir}/spread.service" "${pkgdir}/usr/lib/systemd/system/spread.service"
}
