# Maintainer: 0xjac <aur at 0xjac dot com>

pkgname=alephium-desktop-wallet-bin
pkgdesc="The official Alephium wallet for desktop."
pkgver=2.1.6
pkgrel=1
arch=('x86_64')
url="https://github.com/alephium/desktop-wallet"
license=('LGPL3')
conflicts=("alephium-wallet-bin")
replaces=("alephium-wallet-bin")
source_x86_64=("${url}/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_x86_64=('62ea35ce3eef12319389dcb2ce3a43cecdd2f43ef0beae191ff1f703f109b1a0')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gtk3'
    'hicolor-icon-theme' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext'
    'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango'
    'libasound.so=2-64' 'libatk-1.0.so=0-64' 'libatk-bridge-2.0.so=0-64'
    'libatspi.so=0-64' 'libcairo.so=2-64' 'libcups' 'libdbus-1.so=3-64' 'libdrm' 'libexpat.so=1-64'
    'libgio-2.0.so=0-64' 'libglib-2.0.so=0-64' 'libgobject-2.0.so=0-64' 'libgtk-3.so=0-64'
    'libpango-1.0.so=0-64' 'libxkbcommon.so=0-64')
optdepends=('libappindicator-gtk3')

package() {
    # Extract deb.
    tar -xf data.tar.xz -C "${pkgdir}"

    # Rename "Alephium" directory in "/opt" to "/opt/<pkgname>".
    mv "${pkgdir}/opt/Alephium" "${pkgdir}/opt/${pkgname}"

    # Remove changelog (since it isn't the actual changelog).
    rm -r "${pkgdir}"/usr/share/doc/

    # Link binary in "/usr/bin".
    install -dm755 "${pkgdir}"/usr/bin/
    ln -s "/opt/${pkgname}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"

    # Use correct binary in ".desktop" file.
    sed -i "s/^Exec=.*/Exec=${pkgname%-bin} %U/" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
