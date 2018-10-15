# Maintainer: perqin <perqinxie at gmail dot com>

pkgname=sublime-text-3-imfix
pkgver=3.3176
pkgrel=1
pkgdesc='Sophisticated text editor for code, markup and prose - Stable build with input method support for CJK users'
arch=('x86_64')
url='https://www.sublimetext.com/3'
license=('custom')
depends=('libpng' 'gtk2')
conflicts=('sublime-text' 'sublime-text-dev' 'sublime-text-nightly' 'sublime-text-dev-imfix' 'sublime-text-dev-imfix2')
provides=('sublime-text' 'sublime-text-dev' 'sublime-text-nightly' 'sublime-text-dev-imfix' 'sublime-text-dev-imfix2')
source=(
    "https://download.sublimetext.com/sublime_text_3_build_${pkgver:2}_x64.tar.bz2"
    'sublime-imfix.c'
    'subl'
    'LICENSE'
)
sha256sums=(
    '74f17c1aec4ddec9d4d4c39f5aec0414a4755d407a05efa571e8892e0b9cf732'
    '05c08fc144151713e25ebb528c2a86ef5aaf3afa3e20b79302faefdbb7158f12'
    '00ab76aff168a0dcccec861610985e3695da10e6f95ce1fa399f5747b4d5af5b'
    '8e4c48469bf3f35d0c0904e770c4e307d4965a8931e839c01c5765498a19cf01'
)

build() {
    # Build imfix library
    gcc -shared -o libsublime-imfix.so sublime-imfix.c `pkg-config --libs --cflags gtk+-2.0` -fPIC
}

package() {
    cd "${srcdir}"
    # Install sublime text 3
    install -dm755 "${pkgdir}/opt"
    cp --preserve=mode -r "sublime_text_3" "${pkgdir}/opt/sublime_text_3"
    # Install imfix library
    install -Dm755 libsublime-imfix.so ${pkgdir}/opt/sublime_text_3/libsublime-imfix.so
    # Install icons
    for res in 128x128 16x16 256x256 32x32 48x48; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
        ln -s "/opt/sublime_text_3/Icon/${res}/sublime-text.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/sublime-text.png"
    done
    # Install desktop entry and executable
    install -dm755 "${pkgdir}/usr/share/applications"
    install -Dm644 "sublime_text_3/sublime_text.desktop" "${pkgdir}/usr/share/applications/sublime_text.desktop"
    sed -i 's#/opt/sublime_text/sublime_text#subl#g' "${pkgdir}/usr/share/applications/sublime_text.desktop"
    install -Dm755 subl "${pkgdir}/usr/bin/subl"
    # Install license file
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
