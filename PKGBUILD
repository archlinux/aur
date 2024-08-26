_name=arkenfox
_repo=user.js
_base=${_name}-${_repo}
pkgname=${_base}-git
pkgver=128.0.r0.gf906f7f
pkgrel=1
pkgdesc='Firefox privacy, security and anti-tracking: a comprehensive user.js template for configuration and hardening'
arch=('any')
url="https://github.com/${_name}/${_repo}"
license=('MIT')
provides=("${_base}")
conflicts=("${_base}")
options=('!strip')

depends=('bash')
makedepends=('git')

source=(
    "${_repo}::git+${url}"
    '01-updater.patch'
    '02-cleaner.patch'
)

sha256sums=(
    'SKIP'
    '7781ec7b33b7a7ca6770dc04442dad529f188f58112408bf4c36815b0bf36f05'
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
    local pkg_bin="${pkgdir}/usr/bin"
    local shr="/usr/share/${pkgname}"

    cd "${_repo}"

    sed -e "s|@@USERJSDIR@@|${shr}|" 'updater.sh' |
        install -Dm755 '/dev/stdin' "${pkg_bin}/${_name}-updater"
    install -Dm755 'prefsCleaner.sh' "${pkg_bin}/${_name}-cleaner"

    install -Dm644 -t "${pkgdir}${shr}" 'user.js'
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE.txt'
}
