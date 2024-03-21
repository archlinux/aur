# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Frank Seifferth <frankseifferth@posteo.net>

_static_build=false
# _static_build=true
_mercury_dependency='mercury>=14.04'

pkgname=bower-mail
pkgver=1.0
pkgrel=4
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
		workaround-mercury-bug567.patch
		arch.patch)
b2sums=('344533608ce33ce3dc011916045297d36f17b6c51e22261e831e2063bebf0cc73d5d464cc65edc92528384e97a3a8d338212f2371d84a08bb76d3aaa3f5a9a35'
        '138644267275f297fc26c97254d3cbb90c153f8783584afab63ff012d19cca06dd3160f08647b2a65aca810a42fc6282391c6047bedb99e344cf8a585ce5d66e'
        '20f10c1d6e7516f91ca4baee45f833da7844870a94ec4f7b4f3a0f8b31ba43e143fd9589de9b12cd02e420ea50a1407b2e5ec796de253108ab7e8cd38dbbf103')

if $_static_build ; then
	makedepends+=("$_mercury_dependency")
else
	depends+=("$_mercury_dependency")
fi

prepare () {
    cd "$srcdir/bower-$pkgver"
	patch -p1 -i "$srcdir/workaround-mercury-bug567.patch"

	if ! $_static_build ; then
		patch -i "$srcdir/arch.patch" src/Mercury.options
	fi
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
