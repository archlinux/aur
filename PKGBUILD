pkgname=arkenfox-user.js-git
pkgver=101.0.r1.gc21b9fa
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
    "cleaner.patch"
)

sha256sums=(
    'SKIP'
    '61d9058c971e732dfe7626851b4b2380622b931578fe009b7c5f143fb3135362'
    '4d54a6c1787be81201e735cdd905181dc57d7906cb9b21419b236f3b8b6db983'
)

pkgver() {
    cd "${srcdir}/${_repo}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_repo}"
    patch -i "${srcdir}/${source[1]}"
    patch -i "${srcdir}/${source[2]}"
}

package() {
    local lib="${pkgdir}/usr/lib/${pkgname}"
    local bin="${pkgdir}/usr/bin"
    install -dm755 "${bin}"
    ln -s "${lib#${pkgdir}}/updater.sh" "${bin}/arkenfox-updater"
    ln -s "${lib#${pkgdir}}/prefsCleaner.sh" "${bin}/arkenfox-cleaner"

    cd "${srcdir}/${_repo}"
    install -Dm755 -t "${lib}" "updater.sh" "prefsCleaner.sh"
    install -Dm644 -t "${lib}" "user.js"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.txt"
}
