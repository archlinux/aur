# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Joel Grunbaum <joel@joelg.net>

_pkgname=pappl
pkgname="$_pkgname"-git
pkgver=1.4.0.r422.g64537bb
pkgrel=1
pkgdesc="A simple C-based framework/library for developing CUPS Printer Applications"
arch=('x86_64' 'aarch64')
url="https://www.msweet.org/pappl/"
license=('Apache-2.0' 'custom')
depends=('libcups-git' 'libjpeg-turbo' 'libusb')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/michaelrsweet/pappl.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --always | sed 's|^v||;s|-|.r|;s|-|.|'
}

build() {
    cd "$_pkgname"
    export DSOFLAGS=${LDFLAGS}
    ./configure --prefix=/usr
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install

    install -Dm755 testsuite/testpappl -t "$pkgdir/usr/bin"
    install -Dm644 doc/* -t "$pkgdir/usr/share/doc/$pkgname"
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" {LICENSE,NOTICE}
}
