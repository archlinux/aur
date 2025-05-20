# Maintainer: joelvaz0x01 <joelvaz dot whitehat at gmail dot com>

_pkgbase=chordpro
pkgname=${_pkgbase}-cli
pkgver=6.070
pkgrel=7
_pkgdowmload=App-Music-ChordPro-${pkgver}.${pkgrel}
_wxver=3.005
pkgdesc="A lyrics and chords formatting program (CLI)"
arch=('any')
url="https://chordpro.org/"
_ghurl="https://github.com/ChordPro/chordpro"
license=('Artistic-2.0')
depends=('perl')
makedepends=('perl-local-lib' 'cpanminus')
provides=(chordpro)
conflicts=(chordpro)
source=(
    "${_ghurl}/releases/download/R${pkgver}/${_pkgdowmload}.tar.gz"
    "chordpro.sh"
)
sha256sums=(
    '47f3f202e6afc0f524d0e29ca4776b5eb6b7f3660aeb4b18e499cda7a0f40312'
    '259db24404125459b563f049f746c6844cf8eab46728d0c9935cc36765cb722d'
)

build() {
    cd "${srcdir}/${_pkgdowmload}"
    export PERL_MM_USE_DEFAULT=1
    eval "$(perl -I "${srcdir}" -Mlocal::lib="${srcdir}")"
    cpanm --notest --local-lib="${srcdir}" --verbose --installdeps .
    perl Makefile.PL
    make install
}

check() {
    cd "${srcdir}/${_pkgdowmload}"
    export PERL_MM_USE_DEFAULT=1
    eval "$(perl -I "${srcdir}" -Mlocal::lib="${srcdir}")"
    make test
}

package() {
    install -d "${pkgdir}/opt/${_pkgbase}/lib"
    cp -a "${srcdir}/${_pkgdowmload}/lib"/* "${pkgdir}/opt/${_pkgbase}/lib"
    cp -a "${srcdir}/lib/perl5"/* "${pkgdir}/opt/${_pkgbase}/lib"

    # install binary
    install -Dm755 "${srcdir}/${_pkgdowmload}/script/chordpro.pl" "${pkgdir}/opt/${_pkgbase}/bin/chordpro"

    # install wrapper script
    install -Dm755 "${srcdir}/chordpro.sh" "${pkgdir}/usr/bin/chordpro"
    sed -i "s|/bin/true|/opt/${_pkgbase}/bin/chordpro|" "${pkgdir}/usr/bin/chordpro"

    # install man page
    gzip -n -f "${srcdir}/man/man1/chordpro.1p"
    install -Dm644 "${srcdir}/man/man1/chordpro.1p.gz" "${pkgdir}/usr/share/man/man1p/chordpro.1p.gz"

    # install license
    install -Dm644 "${srcdir}/${_pkgdowmload}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}
