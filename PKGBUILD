_name=arkenfox
_repo=user.js
_base=${_name}-${_repo}
pkgname=${_base}-git
pkgver=112.0.r0.gbc5add9
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
    '00d7de0a389414393d349b60200dde5f95e0435a468a5f439256f4de32997009'
    'a5d3a8a43c6e78585220cbf0731d5da525c0b7d9d397f78d68364331eb33e219'
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
