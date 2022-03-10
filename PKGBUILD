pkgname=arkenfox-user.js-git
pkgver=98.0.r0.gd9af90d
pkgrel=1
pkgdesc="Firefox privacy, security and anti-tracking: a comprehensive user.js template for configuration and hardening."
arch=('any')
_repo='user.js'
url="https://github.com/arkenfox/${_repo}"
license=('MIT')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')

source=(
    "${_repo}::git+${url}"
    "updater.patch"
)

sha256sums=(
    'SKIP'
    '61d9058c971e732dfe7626851b4b2380622b931578fe009b7c5f143fb3135362'
)

pkgver() {
    cd "${srcdir}/${_repo}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_repo}"
    patch -p0 -N -i "${srcdir}/${source[1]}"
}

package() {
    local lib="/usr/lib/${pkgname}"
    local bin="updater.sh"
    install -dm755 "${pkgdir}/usr/bin" && ln -s "${lib}/${bin}" "$_/arkenfox-updater"

    cd "${srcdir}/${_repo}"
    install -Dm755 -t "${pkgdir}${lib}" "${bin}"
    install -Dm644 -t "${pkgdir}${lib}" "user.js"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.txt"
}
