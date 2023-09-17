_name=arkenfox
_repo=user.js
pkgname=${_name}-${_repo}
pkgver=117.0
pkgrel=1
pkgdesc="Firefox privacy, security and anti-tracking: a comprehensive user.js template for configuration and hardening."
arch=('any')
url="https://github.com/${_name}/${_repo}"
license=('MIT')
options=('!strip')

_snapshot="${_repo}-${pkgver}"

source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
    "01-updater.patch"
    "02-cleaner.patch"
)

sha256sums=(
    '38c14451911901f2733f2456edbd39e468652fe1ef7e9e43aa22ac7aeb9ce328'
    'aec6852c49f697a9f00229a028df73fdc98a3841f066d56280b5f7992d796e78'
    'a5d3a8a43c6e78585220cbf0731d5da525c0b7d9d397f78d68364331eb33e219'
)

prepare() {
    for p in *.patch; do
        patch -p0 -d "${_snapshot}" < "${p}"
    done
}

package() {
    local lib="/usr/lib/${pkgname}"
    local bin="/usr/bin"
    install -dm755 "${pkgdir}"{"${lib}","${bin}"}

    cd "${_snapshot}"
    local updater="updater.sh"
    local cleaner="prefsCleaner.sh"
    install -Dm755 -t "${pkgdir}${lib}" "${updater}" "${cleaner}"
    install -Dm644 -t "${pkgdir}${lib}" "user.js"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.txt"

    ln -s "${lib}/${updater}" "${pkgdir}${bin}/${_name}-updater"
    ln -s "${lib}/${cleaner}" "${pkgdir}${bin}/${_name}-cleaner"
}
