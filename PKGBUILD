pkgname=mihomo-party-electron
_pkgname=mihomo-party
pkgver=0.5.7
pkgrel=1
pkgdesc="Another Mihomo GUI."
arch=('x86_64' 'aarch64')
url="https://github.com/pompurin404/mihomo-party"
license=('GPL3')
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-bin" "$_pkgname-electron-bin")
depends=('electron' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: Allow mihomo-party to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
makedepends=('nodejs' 'pnpm' 'libxcrypt-compat' 'asar')
install=$_pkgname.install
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${_pkgname}.sh"
)
sha256sums=("a4dc4b87fb9604c93295b2f3f1bd2917f83dc0bf200dea669f591044448da38d"
"f8049c1f26d5a92fbcebd7bebbdedbb3eab53422b21cf6127418251ccd061282"
)
options=('!lto')

prepare(){
    cd $srcdir/${_pkgname}-${pkgver}
    pnpm install
}

build(){
    cd $srcdir/${_pkgname}-${pkgver}
    pnpm build:linux deb
}

package() {
    asar extract $srcdir/${_pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar ${pkgdir}/opt/mihomo-party
    chmod +x ${pkgdir}/opt/mihomo-party/resources/sidecar/mihomo
    chmod +x ${pkgdir}/opt/mihomo-party/resources/sidecar/mihomo-alpha
    cd ${pkgdir}/../..
	install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "$srcdir/${_pkgname}-${pkgver}/dist/linux-unpacked/resources/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    chown -R root:root ${pkgdir}
}