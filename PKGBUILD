# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TDY <tdy@gmx.com>

pkgname=oleo
pkgver=1.99.16
pkgrel=3
pkgdesc="GNU's lightweight spreadsheet program with a curses-based interface"
arch=('i686' 'x86_64')
url=http://www.gnu.org/software/oleo/
license=(GPL2)
depends=(libcups)
makedepends=(texi2html)
conflicts=(oleo-motif)
install=oleo.install
source=(http://ftp.gnu.org/pub/gnu/$pkgname/$pkgname-$pkgver.tar.gz
    https://answers.launchpad.net/debian/+archive/primary/+files/${pkgname}_$pkgver-11.diff.gz)
sha256sums=('6598df85d06ff2534ec08ed0657508f17dbbc58dd02d419160989de7c487bc86'
    'c3f54bc193a4b60255196f6f1e4edc6659e85587b857f0f3519fb5db390525ec')
sha512sums=('9a3faf00f36f551780d352d3bb13c2305744ca52179d7006a13196803f57b0bfb50266516ffa3be8e6358f0524ef8cf04a6194566afc9b4fa4a0c84993b61597'
    'c9c3e27b075d80668a16477198de5109c3c2381eb4cd5227ed8362477ebf540c1cd5cbb1bd695798347115187198b1e483f39c903b4e4758414857ac56aa7786')

prepare() {
    cd $pkgname-$pkgver/
    patch -p1 -i ../${pkgname}_$pkgver-11.diff
    sed -i '/MAKE/ s/install-data-am//' Makefile.in
    sed -i 's|$(top_builddir)/doc/texi2html|/usr/bin/texi2html|' doc/Makefile.in
}

build() {
    cd $pkgname-$pkgver/
    ./configure \
        --prefix=/usr \
        --infodir=/usr/share/info \
        --without-x \
        --without-motif \
        --without-xbae
    make || true
    make
}

package() {
    cd $pkgname-$pkgver/
    make DESTDIR="$pkgdir" install
    install -Dm644 doc/$pkgname.html "$pkgdir"/usr/share/doc/$pkgname/$pkgname.html
}
