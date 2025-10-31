# Maintainer: joelvaz0x01 <joelvaz dot whitehat at gmail dot com>

_pkgbase=chordpro
pkgname=${_pkgbase}-gui
pkgver=6.090.0
pkgrel=1
_pkgdownload=App-Music-ChordPro-${pkgver}
_wxlastpkgver=6.070
_wxver=3.005
pkgdesc="A lyrics and chords formatting program (CLI and GUI)"
arch=('x86_64')
url="https://chordpro.org/"
_ghurl="https://github.com/ChordPro/chordpro"
license=('Artistic-2.0')
depends=(
    'perl>=5.26.0'                   # JSON::PP, Storable, Pod::Usage, File::Copy, ExtUtils::MakeMaker, Unicode::Collate, Unicode::Normalize
    'perl-pdf-api2>=2.047'           # PDF::API2
    'perl-json-xs>=4.03'             # JSON::XS
    'perl-lwp-protocol-https>=6.14'  # LWP::Protocol::https
    'perl-mozilla-ca>=20230801'      # Mozilla::CA
    'perl-file-homedir>=1.004'       # File::HomeDir
    'perl-image-info>=1.41'          # Image::Info
    'perl-scalar-list-utils>=1.63'   # Scalar::Util and List::Util
    'perl-ref-util>=0.204'           # Ref::Util
    'perl-ipc-run3>=0.049'           # IPC::Run3
    'wxwidgets-gtk3'
    'webkit2gtk-4.1'

    'perl-text-layout>=0.045'               # Text::Layout (AUR)
    #'perl-string-interpolate-named>=1.060' # String::Interpolate::Named (incompatible version on AUR)
    'perl-file-loadlines>=1.047'            # File::LoadLines (AUR)
    'perl-data-printer>=0.001001'           # Data::Printer (AUR)
    'perl-object-pad>=0.818'                # Object::Pad (AUR)
    'perl-javascript-quickjs>=0.18'         # JavaScript::QuickJS (AUR)
    #'perl-harfbuzz-shaper>=0.026'          # HarfBuzz::Shaper (not found on AUR)
)
makedepends=('cpanminus')
optdepends=(
    'perl-template-toolkit>=3.010: Only used by the LaTeX backend'
    'perl-latex-encode>=0.092.0: Only used by the LaTeX backend'
    'lilypond: Embed LilyPond music writing format'
)
provides=(chordpro)
conflicts=(chordpro)
install=chordpro.install
source=(
    "${_ghurl}/releases/download/R${pkgver}/${_pkgdownload}.tar.gz"
    "${_ghurl}/releases/download/R${_wxlastpkgver}/Wx-${_wxver}.tar.gz"
    "chordpro.install"
    "chordpro.sh"
)
sha256sums=('57c5e656f523bbb8250faedf3e5a138f2c5ada9daffa518e0bf05587c592140f'
            '3f0d7cdfc4997d485ab941b133c849f5dab17a62fb242bee133ce040fead3898'
            'b7e60a00ea16e5f49702591c9e2f4146763ade0d312cd2ab6422219700fab311'
            '259db24404125459b563f049f746c6844cf8eab46728d0c9935cc36765cb722d')

build() {
    cd "${srcdir}/${_pkgdownload}"
    export PERL_MM_USE_DEFAULT=1
    export PERL5LIB="${srcdir}/lib/perl5"
    export PERL_LOCAL_LIB_ROOT="${srcdir}"
    export PERL_MB_OPT="--install_base ${srcdir}"
    export PERL_MM_OPT="INSTALL_BASE=${srcdir}"
    cpanm --notest --skip-satisfied --local-lib="${srcdir}" --verbose --installdeps .
    cpanm --notest --local-lib="${srcdir}" --verbose "${srcdir}/Wx-${_wxver}.tar.gz"
    perl Makefile.PL INSTALL_BASE="${srcdir}"
    make install
}

check() {
    cd "${srcdir}/${_pkgdownload}"
    export PERL_MM_USE_DEFAULT=1
    export PERL5LIB="${srcdir}/lib/perl5"
    export PERL_LOCAL_LIB_ROOT="${srcdir}"
    export PERL_MB_OPT="--install_base ${srcdir}"
    export PERL_MM_OPT="INSTALL_BASE=${srcdir}"
    make test
}

package() {
    install -d "${pkgdir}/opt/${_pkgbase}/lib"
    cp -a "${srcdir}/${_pkgdownload}/lib"/* "${pkgdir}/opt/${_pkgbase}/lib"
    cp -a "${srcdir}/lib/perl5"/* "${pkgdir}/opt/${_pkgbase}/lib"

    for cmd in chordpro wxchordpro; do
        # install binary
        install -Dm755 "${srcdir}/${_pkgdownload}/script/${cmd}.pl" "${pkgdir}/opt/${_pkgbase}/bin/${cmd}"

        # install wrapper script
        install -Dm755 "${srcdir}/chordpro.sh" "${pkgdir}/usr/bin/${cmd}"
        sed -i "s|/bin/true|/opt/${_pkgbase}/bin/${cmd}|" "${pkgdir}/usr/bin/${cmd}"

        # install man page
        gzip -n -f "${srcdir}/man/man1/${cmd}.1p"
        install -Dm644 "${srcdir}/man/man1/${cmd}.1p.gz" "${pkgdir}/usr/share/man/man1p/${cmd}.1p.gz"
    done

    # install desktop file
    install -Dm644 "${srcdir}/${_pkgdownload}/lib/ChordPro/res/linux/org.chordpro.desktop" "${pkgdir}/usr/share/applications/org.chordpro.desktop"
    desktop-file-validate "${pkgdir}/usr/share/applications/org.chordpro.desktop"

    # install icons
    install -Dm644 "${srcdir}/${_pkgdownload}/lib/ChordPro/res/icons/chordpro.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/chordpro.png"
    install -Dm644 "${srcdir}/${_pkgdownload}/lib/ChordPro/res/icons/chordpro.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/chordpro.svg"

    # install MIME type XML
    install -Dm644 "${srcdir}/${_pkgdownload}/lib/ChordPro/res/linux/chordpro.xml" "${pkgdir}/usr/share/mime/packages/chordpro.xml"

    # install license
    install -Dm644 "${srcdir}/${_pkgdownload}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}
