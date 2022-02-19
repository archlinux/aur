pkgname=arkenfox-user.js
pkgver=97.0
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
    'de5db34ee7d5a5d2ec63da8cf4059e0713245664c0f1da964d09e3535a3e5c7a'
    '4456b746d4aa45254ddad0122c9657b760d0bf0b32551fe781f995532c6d8377'
)

prepare() {
    cd "${srcdir}/${_snapshot}"
    patch -p0 -N -i "${srcdir}/${source[1]}"
}

package() {
    cd "${srcdir}"

    local lib="/usr/lib/${pkgname}"
    local bin="arkenfox-updater"
    echo "#!/bin/sh" >"${bin}"
    echo "cd \"${lib}\"" >>"${bin}"
    echo ". ./updater.sh" >>"${bin}"
    install -Dm755 -t "${pkgdir}/usr/bin" "${bin}"

    cd "${_snapshot}"

    install -Dm755 -t "${pkgdir}${lib}" "updater.sh"
    install -Dm644 -t "${pkgdir}${lib}" "user.js"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.txt"
}
