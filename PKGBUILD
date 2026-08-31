# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Frank Seifferth <frankseifferth@posteo.net>

_static_build=false
# _static_build=true
_mercury_dependency='mercury>=22.01.8-2'

pkgname=bower-mail
pkgver=1.2
pkgrel=1
pkgdesc="A curses terminal client for the Notmuch email system"
arch=(x86_64)
url="https://github.com/wangp/bower"
depends=('notmuch' 'ncurses' 'coreutils' 'file')
makedepends=('gpgme' 'pandoc')
options=(!lto)
optdepends=('msmtp: send messages' 'lynx: dump HTML emails' 'w3m: dump HTML emails')
conflicts=('bower')
license=(GPL-3.0-or-later)
source=("bower-$pkgver.tar.gz::https://github.com/wangp/bower/archive/$pkgver.tar.gz"
		arch.patch)
b2sums=('8624309984131541bda342fe8f25ae218ccd7a908b0e724381ebc7e7f070e6e56ae5b31d3fc2d38dab0bed109d4aebc1e7dd9728f14837038587204d2554bc1a'
        '20f10c1d6e7516f91ca4baee45f833da7844870a94ec4f7b4f3a0f8b31ba43e143fd9589de9b12cd02e420ea50a1407b2e5ec796de253108ab7e8cd38dbbf103')

if $_static_build ; then
	makedepends+=("$_mercury_dependency")
else
	depends+=("$_mercury_dependency")
fi

prepare () {
    cd "$srcdir/bower-$pkgver"
	if ! $_static_build ; then
		patch -i "$srcdir/arch.patch" src/Mercury.options
	fi
}

build() {
    cd "$srcdir/bower-$pkgver"
    make GRADE=asm_fast.gc PARALLEL="$MAKEFLAGS"
    make man
    gzip -f bower.1
}

package() {
    install -Dm 755 "$srcdir/bower-$pkgver/bower" "$pkgdir/usr/bin/bower"
    install -Dm 644 "$srcdir/bower-$pkgver/bower.1.gz" \
        "$pkgdir/usr/share/man/man1/bower.1.gz"
}
