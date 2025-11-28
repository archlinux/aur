# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app-bin
pkgver=0.10.21
pkgrel=1
pkgdesc='An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
url='https://modrinth.com/app'
arch=('x86_64')
license=('GPL-3.0-only')
depends=(
    # tauri deps
    'openssl-1.1' 'dbus' 'freetype2' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libsoup' 'webkit2gtk-4.1' 'gst-plugins-good'
    # minecraft deps
    'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm'
)
optdepends=(
    'xorg-xrandr: for older minecraft versions'
)
provides=('modrinth-app')
conflicts=('modrinth-app')
source=(
    "https://launcher-files.modrinth.com/versions/${pkgver}/linux/Modrinth%20App_${pkgver}_amd64.deb"
    "modrinth-app"
    "modrinth-file-extensions.xml"
)
sha256sums=('0af87f141b235fbccabfcffb4e6478288b0ee5df0ccaca163922f9d92f721ca8'
            'da70f89aae82e69625bfe920fa52961550c8f9d4825a0d11e620ac55db84e091'
            'e0b3eab49465709ed5053dc1fa4206071ab32657d25bd1f9c01850d696715cff')

build() {
    cd "$srcdir/"
    tar xf data.tar.gz
}

_binname="ModrinthApp"
package() {
    cd "$srcdir"
    find "./usr/share" -type f -print0 | while read -d $'\0' f; do
        filename=$(basename -- "$f")
        target="modrinth-app.${filename##*.}"
        dir=$(dirname -- "$f")
        install -Dm644 "$f" "$pkgdir/$dir/$target"
    done
    sed -i \
      -e "s/Exec=${_binname}/Exec=modrinth-app %u/" \
      -e "s/Icon=${_binname}/Icon=modrinth-app/" \
      -e "s/mrpack/x-modrinth-mrpack/" \
      "${pkgdir}/usr/share/applications/modrinth-app.desktop"
    install -Dm755 "${srcdir}/usr/bin/${_binname}" "${pkgdir}/opt/modrinth-app/modrinth-app"
    install -Dm755 "${srcdir}/modrinth-app" "${pkgdir}/usr/bin/modrinth-app"
    install -Dm644 "${srcdir}/modrinth-file-extensions.xml" "${pkgdir}/usr/share/mime/packages/modrinth-file-extensios.xml"
}
