# Maintainer: czyt <czytcn@gmail.com>
pkgname=universal-android-debloater-ng-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Cross-platform GUI written in Rust using ADB to debloat non-rooted Android devices"
arch=('x86_64')
url="https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation"
license=('GPL-3.0-or-later')
depends=('android-tools' 'gcc-libs' 'glibc')
# The program is called uad-ng, the same name the other packages of this
# upstream install, so only one of them can be present at a time.
provides=('uad-ng' 'universal-android-debloater-ng')
conflicts=('uad-ng' 'universal-android-debloater-ng' 'universal-android-debloater' 'universal-android-debloater-bin')
# A finished Rust build: stripping it would rewrite upstream's binary for no
# gain, and a debug package would be just as large.
options=('!strip' '!debug')

_archive="uad-ng-linux.tar.gz"
_releases="https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation"
_source="https://raw.githubusercontent.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation"

source=("${_archive}::${_releases}/releases/download/v${pkgver}/${_archive}"
        "${_archive}-checksum::${_releases}/releases/download/v${pkgver}/${_archive}-checksum"
        "LICENSE::${_source}/v${pkgver}/LICENSE"
        "logo-dark.png::${_source}/v${pkgver}/resources/assets/logo-dark.png")
noextract=("${_archive}")
sha256sums=('9933b705380fe5679600e4f04943d5d1b7fb4e04ade5901e49d24be31cf33fe1'
            '38d5e53bd3239302fed1ea028ecbaa7435528f4166d77634f7e0461e4b50c9d1'
            '5434217a8ec1b97c3f421a5b291bb5b1ef3afd23d63c044bed9f6ac4b9f66df8'
            '019c4df893dca5b54557c381881d7946b7a53ebf5b610cc04d61c2980c1a22ec')

package() {
    # The archive holds one file: the program itself.
    tar -xzOf "${srcdir}/${_archive}" uad-ng-linux > "${srcdir}/uad-ng-linux"
    install -Dm755 "${srcdir}/uad-ng-linux" "${pkgdir}/usr/bin/uad-ng"

    install -Dm644 "${srcdir}/logo-dark.png" "${pkgdir}/usr/share/pixmaps/uad-ng.png"
    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/uad-ng.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Universal Android Debloater Next Generation
Comment=Debloat non-rooted Android devices over ADB
Exec=uad-ng
Icon=uad-ng
Terminal=false
StartupWMClass=uad-ng
Categories=System;
EOF

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
