pkgname=arkenfox-user.js-git
pkgver=100.0.r1.gea139e3
pkgrel=1
pkgdesc="Firefox privacy, security and anti-tracking: a comprehensive user.js template for configuration and hardening."
arch=('any')
_repo='user.js'
url="https://github.com/arkenfox/${_repo}"
license=('MIT')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
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
    patch -i "${srcdir}/${source[1]}"
}

package() {
    local lib="${pkgdir}/usr/lib/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin" &&
        ln -s "${lib#${pkgdir}}/updater.sh" "$_/arkenfox-updater"

    cd "${srcdir}/${_repo}"
    install -Dm755 -t "${lib}" "updater.sh"
    install -Dm644 -t "${lib}" "user.js"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.txt"
}
