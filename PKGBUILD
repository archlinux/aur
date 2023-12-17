_name=arkenfox
_repo=user.js
_base=${_name}-${_repo}
pkgname=${_base}-git
pkgver=119.0.r2.g4a510a4
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
    '1daf6eb8f0bd1cb4437f66ff27e856c553ca6532795da79e20551ef10ee0b6b9'
)

pkgver() {
    cd "${_repo}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    for p in *.patch; do
        patch -p0 -d "${_repo}" < "${p}"
    done
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
