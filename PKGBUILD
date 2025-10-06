pkgname=mihomo-party
pkgver=1.8.8
pkgrel=1
pkgdesc="Another Mihomo GUI."
arch=('x86_64' 'aarch64')
url="https://github.com/mihomo-party-org/mihomo-party"
license=('GPL3')
conflicts=("$pkgname-git" "$pkgname-bin" "$pkgname-electron" "$pkgname-electron-bin")
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: Allow mihomo-party to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
makedepends=('nodejs' 'pnpm' 'libxcrypt-compat')
install=$pkgname.install
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=("2e1a0a09724cfde6425f497c561cce2eb3dd7494b732fe41c7d42a98bed6c56b"
"242609b1259e999e944b7187f4c03aacba8134a7671ff3a50e2e246b4c4eff48")
options=('!lto')

prepare(){
    cd $srcdir/clash-party-${pkgver}
    sed -i "s/productName: Clash Party/productName: clash-party/" electron-builder.yml
    pnpm install
}

build(){
    cd $srcdir/clash-party-${pkgver}
    pnpm build:linux deb
}

package() {
	cd $srcdir/clash-party-${pkgver}/dist
    bsdtar -xf clash-party-linux-${pkgver}*.deb
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    chmod +x ${pkgdir}/opt/clash-party/mihomo-party
    chmod +sx ${pkgdir}/opt/clash-party/resources/sidecar/mihomo
    chmod +sx ${pkgdir}/opt/clash-party/resources/sidecar/mihomo-alpha
    chmod +sx ${pkgdir}/opt/clash-party/resources/sidecar/mihomo-smart
    install -Dm755 "${srcdir}/../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    sed -i '3s!/opt/clash-party/mihomo-party!mihomo-party!' "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    chown -R root:root ${pkgdir}
}
