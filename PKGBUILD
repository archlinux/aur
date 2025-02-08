pkgname=mihomo-purity
pkgver=1.7.0
pkgrel=1
pkgdesc="A purer mihomo party fork"
arch=('x86_64' 'aarch64')
url="https://github.com/mihomo-purity/mihomo-purity"
license=('GPL3')
conflicts=("$pkgname-git" "$pkgname-bin" "$pkgname-electron" "$pkgname-electron-bin")
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs')
optdepends=('libappindicator-gtk3: Allow mihomo-purity to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
makedepends=('nodejs' 'pnpm' 'libxcrypt-compat')
install=$pkgname.install
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=("f725f34cb4a919095563954ba8b21cd879f858202eb37c41a7bdfcb94abbb5b3"
"e390f9bbce3ae680ab9413f83c69e22c193b43a506439253bdf1e71a0050c938")
options=('!lto')

prepare(){
    cd $srcdir/${pkgname}-${pkgver}
    sed -i "s/productName: Mihomo Purity/productName: mihomo-purity/" electron-builder.yml
    pnpm install
}

build(){
    cd $srcdir/${pkgname}-${pkgver}
    pnpm build:linux deb
}

package() {
	cd $srcdir/${pkgname}-${pkgver}/dist
    bsdtar -xf mihomo-purity-linux-${pkgver}*.deb
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    chmod +x ${pkgdir}/opt/mihomo-purity/mihomo-purity
    chmod +sx ${pkgdir}/opt/mihomo-purity/resources/sidecar/mihomo
    chmod +sx ${pkgdir}/opt/mihomo-purity/resources/sidecar/mihomo-alpha
    install -Dm755 "${srcdir}/../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    sed -i '3s!/opt/mihomo-purity/mihomo-purity!mihomo-purity!' "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    chown -R root:root ${pkgdir}
}
