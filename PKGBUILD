# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=varnish-modules
pkgver=9.1.0
pkgrel=2
_srcver=0.29.0
pkgdesc="A bundle of commonly useful Varnish vmods"
depends=("varnish=$pkgver-$pkgrel")
makedepends=('autoconf' 'automake' 'gcc' 'libtool' 'make' 'python' 'python-docutils')
arch=('x86_64')
url="https://github.com/varnish/varnish-modules"
source=("$pkgname-$pkgver.tar.gz::https://github.com/varnish/varnish-modules/releases/download/$_srcver/$pkgname-$_srcver.tar.gz")
license=('BSD')

build() {
    cd "$pkgname-$_srcver"
    ./configure \
        --build="$CBUILD" \
        --host="$CHOST" \
        --prefix=/usr \
        --sysconfdir=/etc \
        --mandir=/usr/share/man \
        --infodir=/usr/share/info \
        --localstatedir=/var/lib
    # build system is racy
    make -j1
}

check() {
    cd "$pkgname-$_srcver"
    make check -k VERBOSE=1 -j
}

package() {
    cd "$pkgname-$_srcver"
    make DESTDIR="$pkgdir" install
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=('36b9369932b0238be1b7158675dd2b7a0a3c50d337b466a94ca330425c11a873af5bd982565f94541b8654fcdc7f6d5b54619d251eb74fadbdeb10e7e84feab0')
