pkgname=mihomo-purity-electron
_pkgname=mihomo-purity
pkgver=1.7.0
pkgrel=1
pkgdesc="A purer mihomo party fork"
arch=('x86_64' 'aarch64')
url="https://github.com/mihomo-purity/mihomo-purity"
license=('GPL3')
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-bin" "$_pkgname-electron-bin")
depends=('electron' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs')
optdepends=('libappindicator-gtk3: Allow mihomo-purity to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
makedepends=('nodejs' 'pnpm' 'libxcrypt-compat' 'asar')
install=$_pkgname.install
source=(
    "${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${_pkgname}.desktop"
    "${_pkgname}.sh"
)
sha256sums=("f725f34cb4a919095563954ba8b21cd879f858202eb37c41a7bdfcb94abbb5b3"
"9fb03735d230efe35f79fdb94aea5ff1002c1dcb78ab38209b4b2764d17f3f4b"
"973c19f294dea534035c299ffb46a45efe6def53f8f28510e7427628e821ac13"
)
options=('!lto')

prepare(){
    cd $srcdir/${_pkgname}-${pkgver}
    sed -i "s/productName: Mihomo Purity/productName: mihomo-purity/" electron-builder.yml
    pnpm install
}

build(){
    cd $srcdir/${_pkgname}-${pkgver}
    pnpm build:linux deb
}

package() {
    asar extract $srcdir/${_pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar ${pkgdir}/opt/mihomo-purity
    cp -r $srcdir/${_pkgname}-${pkgver}/extra/sidecar ${pkgdir}/opt/mihomo-purity/resources/
    cp -r $srcdir/${_pkgname}-${pkgver}/extra/files ${pkgdir}/opt/mihomo-purity/resources/
    chmod +sx ${pkgdir}/opt/mihomo-purity/resources/sidecar/mihomo
    chmod +sx ${pkgdir}/opt/mihomo-purity/resources/sidecar/mihomo-alpha
    install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/mihomo-purity/resources/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    chown -R root:root ${pkgdir}
}
