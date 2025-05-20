# Maintainer: joelvaz0x01 <joelvaz dot whitehat at gmail dot com>

_pkgbase=chordpro
pkgname=${_pkgbase}-gui
pkgver=6.070.7
pkgrel=2
_pkgdowmload=App-Music-ChordPro-${pkgver}
_wxver=3.005
pkgdesc="A lyrics and chords formatting program (CLI and GUI)"
arch=('any')
url="https://chordpro.org/"
_ghurl="https://github.com/ChordPro/chordpro"
license=('Artistic-2.0')
depends=('perl' 'wxwidgets-gtk3' 'webkit2gtk-4.1')
makedepends=('perl-local-lib' 'cpanminus')
provides=(chordpro)
conflicts=(chordpro)
install=chordpro.install
source=(
    "${_ghurl}/releases/download/R${pkgver}/${_pkgdowmload}.tar.gz"
    "chordpro.install"
    "chordpro.sh"
)
sha256sums=(
    '47f3f202e6afc0f524d0e29ca4776b5eb6b7f3660aeb4b18e499cda7a0f40312'
    'b7e60a00ea16e5f49702591c9e2f4146763ade0d312cd2ab6422219700fab311'
    '259db24404125459b563f049f746c6844cf8eab46728d0c9935cc36765cb722d'
)

build() {
    cd "${srcdir}/${_pkgdowmload}"
    export PERL_MM_USE_DEFAULT=1
    export WX_CONFIG=/usr/lib/wx/config/gtk3-unicode-3.2  # temporary fix
    eval "$(perl -I "${srcdir}" -Mlocal::lib="${srcdir}")"
    cpanm --notest --local-lib="${srcdir}" --verbose --installdeps .
    cpanm --notest --local-lib="${srcdir}" --verbose ${_ghurl}/releases/download/R${pkgver}/Wx-${_wxver}.tar.gz
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

    for cmd in chordpro wxchordpro; do
        # install binary
        install -Dm755 "${srcdir}/${_pkgdowmload}/script/${cmd}.pl" "${pkgdir}/opt/${_pkgbase}/bin/${cmd}"

        # install wrapper script
        install -Dm755 "${srcdir}/chordpro.sh" "${pkgdir}/usr/bin/${cmd}"
        sed -i "s|/bin/true|/opt/${_pkgbase}/bin/${cmd}|" "${pkgdir}/usr/bin/${cmd}"

        # install man page
        gzip -n -f "${srcdir}/man/man1/${cmd}.1p"
        install -Dm644 "${srcdir}/man/man1/${cmd}.1p.gz" "${pkgdir}/usr/share/man/man1p/${cmd}.1p.gz"
    done

    # install desktop file
    install -Dm644 "${srcdir}/${_pkgdowmload}/lib/ChordPro/res/linux/org.chordpro.desktop" "${pkgdir}/usr/share/applications/org.chordpro.desktop"
    desktop-file-validate "${pkgdir}/usr/share/applications/org.chordpro.desktop"

    # install icon
    install -Dm644 "${srcdir}/${_pkgdowmload}/lib/ChordPro/res/icons/chordpro.png" "${pkgdir}/usr/share/pixmaps/chordpro.png"

    # install MIME type XML
    install -Dm644 "${srcdir}/${_pkgdowmload}/lib/ChordPro/res/linux/chordpro.xml" "${pkgdir}/usr/share/mime/packages/chordpro.xml"

    # install license
    install -Dm644 "${srcdir}/${_pkgdowmload}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}
