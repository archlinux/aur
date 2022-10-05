pkgname=arkenfox-user.js
pkgver=105.0
pkgrel=1
pkgdesc="Firefox privacy, security and anti-tracking: a comprehensive user.js template for configuration and hardening."
arch=('any')
_name="${pkgname%-*}"
_repo="${pkgname#*-}"
url="https://github.com/${_name}/${_repo}"
license=('MIT')
options=('!strip')

_snapshot="${_repo}-${pkgver}"

source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
    "updater.patch"
    "cleaner.patch"
)

sha256sums=(
    '392c7955ca055f6090b9949a7977976974da2fcc20ab2a2c9806269a9fee7a38'
    '61d9058c971e732dfe7626851b4b2380622b931578fe009b7c5f143fb3135362'
    '4d54a6c1787be81201e735cdd905181dc57d7906cb9b21419b236f3b8b6db983'
)

prepare() {
    cd "${srcdir}/${_snapshot}"
    patch -i "${srcdir}/${source[1]}"
    patch -i "${srcdir}/${source[2]}"
}

package() {
    local lib="${pkgdir}/usr/lib/${pkgname}"
    local bin="${pkgdir}/usr/bin"
    local updater="updater.sh"
    local cleaner="prefsCleaner.sh"

    install -dm755 "${bin}"
    ln -s "${lib#"${pkgdir}"}/${updater}" "${bin}/${_name}-updater"
    ln -s "${lib#"${pkgdir}"}/${cleaner}" "${bin}/${_name}-cleaner"

    cd "${srcdir}/${_snapshot}"
    install -Dm755 -t "${lib}" "${updater}" "${cleaner}"
    install -Dm644 -t "${lib}" "user.js"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.txt"
}
