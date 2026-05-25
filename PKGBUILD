# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=varnish-modules
pkgver=0.28.0
pkgrel=1
pkgdesc="A bundle of commonly useful Varnish vmods"
depends=('varnish=9.0.3-1')
makedepends=('autoconf' 'automake' 'gcc' 'libtool' 'make' 'python' 'python-docutils')
arch=('x86_64')
url="https://github.com/varnish/varnish-modules"
source=("$pkgname-$pkgver.tar.gz::https://github.com/varnish/varnish-modules/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
license=('BSD')

build() {
    cd "$pkgname-$pkgver"
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
    cd "$pkgname-$pkgver"
    make check -k VERBOSE=1 -j
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=('796f95ea6f8b69f6e4fb3daf327c4a6cccc9b6c927d8daace753aad7e443c1f937020465924e472ad65bb0a10e2e5bf85b6228afe3257dbfba0091750fbf300a')
