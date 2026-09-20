# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>

pkgname=sho-metrics-source-linux
_forkver=0.3.0-linux.7
pkgver=0.3.0.linux.7
pkgrel=1
pkgdesc="Linux hardware sensor helper daemon for the Sho Metrics OpenDeck plugin"
arch=('any')
url="https://github.com/emaspa/sho-metrics-linux"
license=('GPL-3.0-only')
depends=('nodejs>=20')
makedepends=('npm')
optdepends=(
    'lact: NVIDIA GPU sensors (hotspot, VRAM junction, fan, power, clocks)'
    'mangohud: in-game FPS, 1% lows and frametime'
)
install="${pkgname}.install"
source=("${pkgname}-${_forkver}.tar.gz::${url}/releases/download/v${_forkver}/${pkgname}-${_forkver}.tar.gz")
# The checksum of the published release asset. After bumping _forkver, run
# updpkgsums once the asset is uploaded, then regenerate .SRCINFO with
# `makepkg --printsrcinfo > .SRCINFO`.
sha256sums=('cae904078afdef82b6e6ab7035452d180b48964d036e72b2c5ee9068a161654c')

_libdir="/usr/lib/${pkgname}"

build() {
    cd "${pkgname}-${_forkver}"

    # Vendors the dependencies from package-lock.json. Needs network, like every
    # other AUR node package; the user never runs npm afterwards.
    export npm_config_cache="${srcdir}/npm-cache"
    npm ci --omit=dev --ignore-scripts --no-fund --no-audit

    sed -e "s|@NODE@|/usr/bin/node|" \
        -e "s|@SERVER_PATH@|${_libdir}/server.mjs|" \
        -e "s|@PROTO_DIR@|${_libdir}/proto|" \
        systemd/shometrics-linux-helper.service > shometrics-linux-helper.service
}

check() {
    cd "${pkgname}-${_forkver}"
    SHOMETRICS_PROTO_DIR="${PWD}/proto" node server.mjs --check
}

package() {
    cd "${pkgname}-${_forkver}"

    install -dm755 "${pkgdir}${_libdir}"
    cp -a server.mjs package.json proto node_modules "${pkgdir}${_libdir}/"

    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 shometrics-linux-helper.service \
        "${pkgdir}/usr/lib/systemd/user/shometrics-linux-helper.service"
    install -Dm644 udev/60-sho-metrics-rapl.rules \
        "${pkgdir}/usr/lib/udev/rules.d/60-sho-metrics-rapl.rules"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
