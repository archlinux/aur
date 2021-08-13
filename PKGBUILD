# Maintainer: Guillaume Quintard <guillaume.quintard@gmail.com>

pkgname=varnish-modules
pkgver=0.18.0
pkgrel=1
pkgdesc="A bundle of commonly useful Varnish vmods"
depends=('varnish=6.6.1')
makedepends=('autoconf' 'automake' 'gcc' 'libtool' 'make' 'python' 'python-docutils')
arch=('x86_64')
url="https://github.com/varnish/varnish-modules"
source=("$pkgname-$pkgver.tar.gz::https://github.com/varnish/varnish-modules/archive/refs/tags/$pkgver.tar.gz"
    '01-test-fix.patch')
license=('BSD')

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/01-test-fix.patch"
}

build() {
    cd "$pkgname-$pkgver"
    ./bootstrap
    ./configure \
        --build="$CBUILD" \
        --host="$CHOST" \
        --prefix=/usr \
        --sysconfdir=/etc \
        --mandir=/usr/share/man \
        --infodir=/usr/share/info \
        --localstatedir=/var/lib
    make
}

check() {
    cd "$pkgname-$pkgver"
    make check || {
        find . -name 'test-suite.log' -print -exec cat '{}' \;
        return 1
    }
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=('a6a56ea371ebe8183926e5411f8b4ee7bb47cc45464cfffb2f4a8d17b04b156889bcbe254845058ded2e712ed21ee73e6e98eb29f72d922f1fbbfc1cc506d9f1'
    '5ff8a13dac01d190dacb3b393211d233d0092571a5b73e1101263b9084002c8ad19d7b41b782673d313aee7708bc44f6baf81a2997808367c1b6753b054e62a7')
