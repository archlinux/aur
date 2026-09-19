# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>

pkgname=sho-metrics-source-linux
_forkver=0.3.0-linux.4
pkgver=0.3.0.linux.4
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
# Placeholder: run updpkgsums once the release asset is uploaded, then regenerate
# .SRCINFO with `makepkg --printsrcinfo > .SRCINFO`.
sha256sums=('48b91653dc46490a7cbded1701f2fea7b8a9b804865e1adfc9ca4df40f46af96')

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
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
