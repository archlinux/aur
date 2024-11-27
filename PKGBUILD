# Maintainer: Talon <diablodev@googlegroups.com>
pkgname=astralrinth-bin
pkgver=0.8.9
pkgrel=3
pkgdesc="A fork of the Modrinth Launcher."
arch=('x86_64')
url="https://github.com/DIDIRUS4/AstralRinth"
license=('GPL-3.0-only')
depends=('openssl-1.1' 'dbus' 'freetype2' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libsoup3' 'webkit2gtk-4.1' 'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm')
optdepends=('xorg-xrandr: for older minecraft versions')
options=('!strip' '!emptydirs' '!debug')
conflicts=('modrinth-app-bin' 'modrinth-app-git' 'modrinth-app-ammipamge' 'modrinth-app')
install=${pkgname}.install
source=("$url/releases/download/ARF-v${pkgver}/AstralRinth.App_${pkgver}_amd64.deb"
        "astralrinth-app"
        "astralrinth-file-extensions.xml")
sha512sums=('fb5095d3b48532f662a4c481f234b0b338e04f8b829987d10aec4472e143194a9f6680fd374fe96c579d2583f673e29577e2c631828dd9a5f4d33480ca62bfcb'
            '9bd0a35204fb4bae20b0bec5382410556ce4eb3649c95b44fb6b4f852ac71526bace6a457d5f3e7c84e7959d24f9dc2a0c746af783d79c5d635b834991cec35a'
            '38fedb2532850677ff638d5c7e20fbc78efc18b5deb26f77dfcc079b42f48f16473f0a27d7af183ef02ad3cd94729c86249bdac60b2bc1b25b47a1ebd2ba0c0d')

prepare() {
    cd "$srcdir/"
    tar xf data.tar.gz
}

_binname="ModrinthApp"
package(){
    cd "$srcdir"
    find "./usr/share" -type f -print0 | while read -d $'\0' f; do
        filename=$(basename -- "$f")
        target="astralrinth-app.${filename##*.}"
        dir=$(dirname -- "$f")
        install -Dm644 "$f" "$pkgdir/$dir/$target"
    done
    sed -i \
      -e "s/Exec=${_binname}/Exec=astralrinth-app %u/" \
      -e "s/Icon=${_binname}/Icon=astralrinth-app/" \
      -e "s/mrpack/x-modrinth-mrpack/" \
      "${pkgdir}/usr/share/applications/astralrinth-app.desktop"
    install -Dm755 "${srcdir}/usr/bin/${_binname}" "${pkgdir}/opt/astralrinth-app/astralrinth-app"
    install -Dm755 "${srcdir}/astralrinth-app" "${pkgdir}/usr/bin/astralrinth-app"
    install -Dm644 "${srcdir}/astralrinth-file-extensions.xml" "${pkgdir}/usr/share/mime/packages/astralrinth-file-extensios.xml"
}
