pkgname=mihomo-party
pkgver=1.0.9
pkgrel=1
pkgdesc="Another Mihomo GUI."
arch=('x86_64' 'aarch64')
url="https://github.com/pompurin404/mihomo-party"
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
sha256sums=("126f8f6b5c681cf07214ab1785a754a4d01aaa904b7a91311abcb71b99b3b182"
"f8049c1f26d5a92fbcebd7bebbdedbb3eab53422b21cf6127418251ccd061282")
options=('!lto')

prepare(){
    cd $srcdir/${pkgname}-${pkgver}
    pnpm install
}

build(){
    cd $srcdir/${pkgname}-${pkgver}
    pnpm build:linux deb
}

package() {
	cd $srcdir/${pkgname}-${pkgver}/dist
    bsdtar -xf mihomo-party-linux-${pkgver}*.deb
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    chmod +x ${pkgdir}/opt/mihomo-party/mihomo-party
    chmod +x ${pkgdir}/opt/mihomo-party/resources/sidecar/mihomo
    chmod +x ${pkgdir}/opt/mihomo-party/resources/sidecar/mihomo-alpha
    cd ${pkgdir}/../..
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	sed -i '3s!/opt/mihomo-party/mihomo-party!mihomo-party!' "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    chown -R root:root ${pkgdir}
}