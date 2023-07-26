_name=arkenfox
_repo=user.js
_base=${_name}-${_repo}
pkgname=${_base}-git
pkgver=115.0.r0.g4d78abf
pkgrel=1
pkgdesc="Firefox privacy, security and anti-tracking: a comprehensive user.js template for configuration and hardening."
arch=('any')
url="https://github.com/${_name}/${_repo}"
license=('MIT')
makedepends=('git')
provides=("${_base}")
conflicts=("${_base}")
options=('!strip')

source=(
    "${_repo}::git+${url}"
    "01-updater.patch"
    "02-cleaner.patch"
)

sha256sums=(
    'SKIP'
    'aec6852c49f697a9f00229a028df73fdc98a3841f066d56280b5f7992d796e78'
    '6cb83edb60a8affdab79b361c3ad52f1f70d3c4d123e8be0b409441e6a752691'
)

pkgver() {
    cd "${_repo}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_repo}"
    patch -i "${srcdir}/${source[1]}"
    patch -i "${srcdir}/${source[2]}"
}

package() {
    local lib="/usr/lib/${pkgname}"
    local bin="/usr/bin"
    install -dm755 "${pkgdir}"{"${lib}","${bin}"}

    cd "${_repo}"
    local updater="updater.sh"
    local cleaner="prefsCleaner.sh"
    install -Dm755 -t "${pkgdir}${lib}" "${updater}" "${cleaner}"
    install -Dm644 -t "${pkgdir}${lib}" "user.js"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.txt"

    ln -s "${lib}/${updater}" "${pkgdir}${bin}/${_name}-updater"
    ln -s "${lib}/${cleaner}" "${pkgdir}${bin}/${_name}-cleaner"
}
