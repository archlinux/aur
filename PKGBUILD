pkgname=arkenfox-user.js
pkgver=98.0
pkgrel=1
pkgdesc="Firefox privacy, security and anti-tracking: a comprehensive user.js template for configuration and hardening."
arch=('any')
_repo='user.js'
url="https://github.com/arkenfox/${_repo}"
license=('MIT')
options=('!strip')

_snapshot="${_repo}-${pkgver}"

source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
    "updater.patch"
)

sha256sums=(
    '50a44837d4c78f19e8f32b62130d114b9af0d667c36475c3df7338fc381f3f82'
    '61d9058c971e732dfe7626851b4b2380622b931578fe009b7c5f143fb3135362'
)

prepare() {
    cd "${srcdir}/${_snapshot}"
    patch -p0 -N -i "${srcdir}/${source[1]}"
}

package() {
    local lib="/usr/lib/${pkgname}"
    local bin="updater.sh"
    install -dm755 "${pkgdir}/usr/bin" && ln -s "${lib}/${bin}" "$_/arkenfox-updater"

    cd "${srcdir}/${_snapshot}"
    install -Dm755 -t "${pkgdir}${lib}" "${bin}"
    install -Dm644 -t "${pkgdir}${lib}" "user.js"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.txt"
}
