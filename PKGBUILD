pkgname=arkenfox-user.js
pkgver=99.0
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
    '9313af70e29847bf90a69ac6b2b85937ce255390d58ea966a2348db286d8c00e'
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
