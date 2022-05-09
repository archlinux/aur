pkgname=arkenfox-user.js
pkgver=100.0
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
    '45f8a3fc6d6ea30b07d09649db8db61d4a139dcb74a684c3aebb469a0cf2fac0'
    '61d9058c971e732dfe7626851b4b2380622b931578fe009b7c5f143fb3135362'
)

prepare() {
    cd "${srcdir}/${_snapshot}"
    patch -i "${srcdir}/${source[1]}"
}

package() {
    local lib="${pkgdir}/usr/lib/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin" &&
        ln -s "${lib#${pkgdir}}/updater.sh" "$_/arkenfox-updater"

    cd "${srcdir}/${_snapshot}"
    install -Dm755 -t "${lib}" "updater.sh"
    install -Dm644 -t "${lib}" "user.js"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.txt"
}
