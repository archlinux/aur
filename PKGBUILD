pkgname=mihomo-party
pkgver=0.5.5
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("7d0477a06767ba87c7b6ca44b89c27b390cd97658bbfe116c48116deb0c1913f")
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