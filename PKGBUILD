_name=arkenfox
_repo=user.js
pkgname=${_name}-${_repo}
pkgver=115.0
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
    '69b3eb1cd66b64d51a00b99a6cb164f140d2c8bb7c5032032538c940eb5c407c'
    'aec6852c49f697a9f00229a028df73fdc98a3841f066d56280b5f7992d796e78'
    'a5d3a8a43c6e78585220cbf0731d5da525c0b7d9d397f78d68364331eb33e219'
)

prepare() {
    cd "${_snapshot}"
    patch -i "${srcdir}/${source[1]}"
    patch -i "${srcdir}/${source[2]}"
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
