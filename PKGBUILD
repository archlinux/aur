# Maintainer: Guru <anjanaya@gmail.com>
pkgname=codeburn-desktop-bin
pkgver=0.9.20
pkgrel=1
pkgdesc="CodeBurn Desktop — Electron app fed by the codeburn CLI, for AI coding token/cost observability"
arch=('x86_64')
url="https://github.com/getagentseal/codeburn"
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'libnotify' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'xdg-utils' 'hicolor-icon-theme')
# The desktop bundles its own codeburn CLI; the standalone `codeburn` (AUR)
# package is an optional companion for terminal/token-dashboard use.
optdepends=('libappindicator-gtk3: system tray indicator'
            'codeburn: standalone CLI for terminal token/cost dashboard')
provides=('codeburn-desktop')
conflicts=('codeburn-desktop')
options=('!strip')
source=("codeburn-desktop-${pkgver}.deb::https://github.com/getagentseal/codeburn/releases/download/desktop-v${pkgver}/codeburn-desktop_${pkgver}_amd64.deb"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/getagentseal/codeburn/desktop-v${pkgver}/LICENSE")
sha256sums=('bf875a11aef90853bee3891ece965b98a7ddcc5331d98dfd113b72c80e8598ca'
            '25dd3389bfc55f463f9745c6fa3f4193bb31b58157a6861836b62bf91f6b76e5')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.xz -C "${pkgdir}"

    # /usr/bin/codeburn belongs to the codeburn CLI package (AUR: codeburn);
    # expose the desktop binary under a distinct name to avoid the clash.
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf /opt/CodeBurn/codeburn "${pkgdir}/usr/bin/codeburn-desktop"

    # Deb ships Electron's own licenses in /opt/CodeBurn; add codeburn's MIT license.
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # npm/deb ownership is wonky; normalize.
    chown -R root:root "${pkgdir}"
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
