pkgname=arkenfox-user.js-git
pkgver=105.0.r0.gdb04bc4
pkgrel=1
pkgdesc="Firefox privacy, security and anti-tracking: a comprehensive user.js template for configuration and hardening."
arch=('any')
_base="${pkgname%-git}"
_name="${_base%-*}"
_repo="${_base#*-}"
url="https://github.com/${_name}/${_repo}"
license=('MIT')
makedepends=('git')
provides=("${_base}")
conflicts=("${_base}")
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
    local updater="updater.sh"
    local cleaner="prefsCleaner.sh"

    install -dm755 "${bin}"
    ln -s "${lib#"${pkgdir}"}/${updater}" "${bin}/${_name}-updater"
    ln -s "${lib#"${pkgdir}"}/${cleaner}" "${bin}/${_name}-cleaner"

    cd "${srcdir}/${_repo}"
    install -Dm755 -t "${lib}" "${updater}" "${cleaner}"
    install -Dm644 -t "${lib}" "user.js"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.txt"
}
