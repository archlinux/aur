# Maintainer: Alad Wenter <alad@mailbox.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: peter feigl <peter.feigl@gmail.com>

pkgname=mit-scheme
pkgver=12.1
pkgrel=1
pkgdesc='MIT/GNU Scheme'
url='https://www.gnu.org/software/mit-scheme/'
arch=('x86_64')
license=('GPL')
depends=('ncurses' 'zlib' 'libx11')
makedepends=('ghostscript' 'texlive-core')
optdepends=('openssl: support for openssl')
provides=('x11-shim.so')
source=("https://ftp.gnu.org/gnu/mit-scheme/stable.pkg/$pkgver/$pkgname-$pkgver-x86-64.tar.gz"
        "https://ftp.gnu.org/gnu/mit-scheme/stable.pkg/$pkgver/$pkgname-$pkgver-x86-64.tar.gz.sig")
sha256sums=('8cfbb21b0e753ab8874084522e4acfec7cadf83e516098e4ab788368b748ae0c'
            'SKIP')
validpgpkeys=('8F664EF430167B808170D35AC9E40BAAFD0CB132') # Chris Hanson <cph@chris-hanson.org>

build() {
    cd "$pkgname-$pkgver"/src
    ./configure CFLAGS="-Wno-array-parameter -Wno-error=use-after-free" --prefix=/usr \
        --with-x \
        --enable-x11 \
        --enable-native-code
    make -j1
    cd ../doc
    ./configure --prefix=/usr \
        --enable-pdf \
        --disable-html
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 "etc/xscheme.el" "$pkgdir/usr/share/emacs/site-lisp/xscheme.el"
    cd src
    make DESTDIR="$pkgdir" install
    cd ../doc
    make DESTDIR="$pkgdir" install
}
