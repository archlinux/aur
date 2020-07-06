# Maintainer: Stephan Hilb <stephan@ecshi.net>
pkgname=hts-engine-cvs
pkgver=1.10.r201707251428
pkgrel=1
pkgdesc="Engine to synthesize speech waveform from HMMs trained by hts."
arch=('i686' 'x86_64')
url="http://hts-engine.sourceforge.net/"
license=('custom')
depends=('glibc')
provides=("${pkgname%-cvs}=${pkgver%.*}")
conflicts=("${pkgname%-cvs}")
makedepends=('cvs')
options=('staticlibs')
source=()
sha256sums=()

_cvsroot=":pserver:anonymous@hts-engine.cvs.sourceforge.net:/cvsroot/hts-engine"
_cvsmod="hts_engine_API"

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
}

build() {
    cd "$pkgname/src"

    aclocal
    autoconf
    automake --add-missing
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname/src"

    make DESTDIR="$pkgdir" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
