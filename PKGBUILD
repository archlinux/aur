# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Frank Seifferth <frankseifferth@posteo.net>
pkgname=bower-mail
pkgver=1.0
pkgrel=1
pkgdesc="A curses terminal client for the Notmuch email system"
arch=('any')
url="https://github.com/wangp/bower"
depends=('notmuch' 'ncurses' 'coreutils' 'file' 'mercury>=14.04')
makedepends=('gpgme' 'pandoc')
options=(!lto)
optdepends=('msmtp: send messages' 'lynx: dump HTML emails' 'w3m: dump HTML emails')
conflicts=('bower')
license=('GPL3')
source=("bower-$pkgver.tar.gz::https://github.com/wangp/bower/archive/$pkgver.tar.gz" arch.patch)
b2sums=('344533608ce33ce3dc011916045297d36f17b6c51e22261e831e2063bebf0cc73d5d464cc65edc92528384e97a3a8d338212f2371d84a08bb76d3aaa3f5a9a35'
        '20f10c1d6e7516f91ca4baee45f833da7844870a94ec4f7b4f3a0f8b31ba43e143fd9589de9b12cd02e420ea50a1407b2e5ec796de253108ab7e8cd38dbbf103')

prepare () {
    patch "$srcdir/bower-$pkgver/src/Mercury.options" < "$srcdir/arch.patch"
}

build() {
    cd "$srcdir/bower-$pkgver"
    make PARALLEL=$MAKEFLAGS
    make man
    gzip -f bower.1
}

package() {
    install -Dm 755 "$srcdir/bower-$pkgver/bower" "$pkgdir/usr/bin/bower"
    install -Dm 644 "$srcdir/bower-$pkgver/bower.1.gz" \
        "$pkgdir/usr/share/man/man1/bower.1.gz"
}
