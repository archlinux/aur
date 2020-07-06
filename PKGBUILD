# Maintainer: Stephan Hilb <stephan@ecshi.net>
pkgname=open-jtalk-cvs
pkgver=1.10.r201612250236
pkgrel=1
pkgdesc="Japanese text-to-speech system"
arch=('i686' 'x86_64')
url="http://open-jtalk.sourceforge.net/"
license=('custom')
depends=('gcc-libs' 'open-jtalk-voice')
provides=("${pkgname%-cvs}=${pkgver%.*}")
conflicts=("${pkgname%-cvs}")
makedepends=('cvs' 'hts-engine>=1.10')
source=()
sha256sums=()

_cvsroot=":pserver:anonymous@open-jtalk.cvs.sourceforge.net:/cvsroot/open-jtalk"
_cvsmod="open_jtalk"

_cvsfetch() {
    cd "$SRCDEST"

    cvs -qz3 -d "$_cvsroot" co -d $pkgname $_cvsmod
    cp -ua "$SRCDEST/$pkgname" "$srcdir/$pkgname"
}

pkgver() {
    cd "$srcdir/$pkgname"

    printf "%s.r%s" \
        "$(grep -Po 'AC_INIT\(.*, \K[0-9.]+' "$srcdir/$pkgname/src/configure.ac")" \
        "$(cvs history -a -c | cut -c 3-18 | sort | tail -1 | sed 's/[-: ]//g')"
}

prepare() {
    _cvsfetch 2&> /dev/null

    cd "$srcdir/$pkgname/src"

    [[ -f ChangeLog ]] || ln -s NEWS ChangeLog
    sed -Ei "s/(@prefix@\/)dic/\1share\/${pkgname%-cvs}\/dic/" mecab-naist-jdic/Makefile.am
}

build() {
    cd "$pkgname/src"

    aclocal
    autoconf
    automake --add-missing
    ./configure --prefix=/usr \
        --with-hts-engine-header-path=/usr/include \
        --with-hts-engine-library-path=/usr/lib
    make
}

package() {
    cd "$srcdir/$pkgname/src"

    make DESTDIR="$pkgdir" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
