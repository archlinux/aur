# Maintainer:
# Contributor: Manifest0
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: liberodark

pkgname=frostwire
pkgver=7.0.4
_build=331
pkgrel=1
pkgdesc='An easy to use Cloud Downloader, BitTorrent Client'
arch=('any')
url='https://www.frostwire.com'
license=('GPL-3.0-or-later')
depends=('bash' 'java-runtime')
makedepends=('gendesk' 'gradle' 'java-environment')
source=("https://github.com/frostwire/frostwire/archive/${pkgname}-desktop-${pkgver}-build-${_build}.tar.gz")
sha256sums=('5373652374c0b8b71ab9656d4fe7211c5b65dbf041333daa5744a2a856ca09f1')

prepare() {
    ln -sf "${pkgname}-${pkgname}-desktop-${pkgver}-build-${_build}/desktop" "${pkgname}-${pkgver}"

    cd "${pkgname}-${pkgver}"
    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "FrostWire" \
        --genericname "P2P Bittorrent and cloud downloader" \
        --categories "Network;FileTransfer;P2P;" \
        --mimetypes "application/x-bittorrent;x-scheme-handler/magnet;" \
        --custom "StartupWMClass=com-limegroup-gnutella-gui-Main"

    cat >"${pkgname}.sh" <<EOF
#!/usr/bin/bash
exec java -jar /usr/share/java/${pkgname}/${pkgname}.jar "\$@"
EOF
}

build() {
    cd "${pkgname}-${pkgver}"
    gradle clean build
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 "build/libs/${pkgname}.jar" -t "${pkgdir}/usr/share/java/${pkgname}"
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 lib/icons/frostwire.svg -t "${pkgdir}/usr/share/pixmaps"
}
