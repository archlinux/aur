# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Manifest0
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: liberodark

pkgname=frostwire
pkgver=7.1.4
_build=337
pkgrel=1
pkgdesc='An easy to use cloud downloader, BitTorrent client'
arch=('any')
url='https://www.frostwire.com'
license=('GPL-3.0-or-later')
depends=('bash' 'java-runtime')
makedepends=('gendesk' 'git' 'gradle' 'java-environment')
source=("git+https://github.com/frostwire/frostwire.git#tag=${pkgname}-desktop-${pkgver}-build-${_build}"
        "${pkgname}.sh")
sha256sums=('61d58f0d5a20226ac240f10167190c3141749886c2131205f88f6be1e8dac9a1'
            '40b5ba9e018022270c57b7cc7e11124b7829d2a50035dc07382e60409e2e0152')

prepare() {
    cd "${pkgname}/desktop"
    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "FrostWire" \
        --genericname "P2P BitTorrent and cloud downloader" \
        --categories "Network;FileTransfer;P2P" \
        --mimetypes "application/x-bittorrent;x-scheme-handler/magnet" \
        --custom "StartupWMClass=com-limegroup-gnutella-gui-Main"
}

build() {
    cd "${pkgname}/desktop"
    gradle build
}

package() {
    cd "${pkgname}/desktop"
    install -Dm644 build/libs/{"${pkgname}.jar",icebridge.jar} -t "${pkgdir}/usr/share/java/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "lib/icons/${pkgname}.svg" -t "${pkgdir}/usr/share/pixmaps"
}
