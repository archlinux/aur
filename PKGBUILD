# Maintainer: skydrome <skydrome@tormail.org>

pkgname=tlsdate
pkgver=0.0.13
pkgrel=1
pkgdesc="A secure rdate replacement to update local time over HTTPS"
arch=('i686' 'x86_64' 'armv7h' 'armv6l' 'armv6h')
url="https://github.com/ioerror/tlsdate"
license=('BSD')
depends=('openssl' 'ca-certificates' 'libevent' 'dbus' 'zlib')
options=('emptydirs')
install='tlsdate.install'
backup=('etc/conf.d/tlsdate'
        'etc/tlsdate/tlsdated.conf')
source=("https://github.com/ioerror/tlsdate/archive/tlsdate-${pkgver}.tar.gz"
        #"tlsdate-$pkgver.zip::https://github.com/ioerror/tlsdate/archive/master.zip"
        'tlsdate.conf.d'
        'tlsdate.service')

sha256sums=('90efdff87504b5159cb6a3eefa9ddd43723c073d49c4b3febba9e48fc1292bf9'
            '1498a74913feb66c6e2e7d982f43b07fc48881947543969668a75ef4323503aa'
            'deaac31649fa6dc6fc54ca3dec231cbdb2a58c6d4aa08cf5498599f42a100472')

prepare() {
    cd "$srcdir/$pkgname-$pkgname-$pkgver"
    #cd "$srcdir/tlsdate-master"
    ./autogen.sh
}

build() {
    cd "$srcdir/$pkgname-$pkgname-$pkgver"
    #cd "$srcdir/tlsdate-master"

    #--disable-seccomp-filter \
    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --with-dbus-group=tlsdate \
        --with-unpriv-group=tlsdate \
        --with-unpriv-user=tlsdate
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgname-$pkgver"
    #cd "$srcdir/tlsdate-master"

    make DESTDIR="$pkgdir" install
    rm -rf "$pkgdir/usr/lib/libtlsdate_compat.a"
    install -dm750 "$pkgdir/var/cache/tlsdated"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/tlsdate/LICENSE"
    install -Dm644 "$srcdir/tlsdate.conf.d"  "$pkgdir/etc/conf.d/tlsdate"
    install -Dm644 "$srcdir/tlsdate.service" "$pkgdir/usr/lib/systemd/system/tlsdate.service"
}
