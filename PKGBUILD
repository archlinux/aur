_name=arkenfox
_repo=user.js
pkgname=${_name}-${_repo}
pkgver=135.0
pkgrel=1
pkgdesc='Firefox privacy, security and anti-tracking: a comprehensive user.js template for configuration and hardening'
arch=('any')
url="https://github.com/${_name}/${_repo}"
license=('MIT')
options=('!strip')

depends=('bash')

_snapshot="${_repo}-${pkgver}"

source=(
    "${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
    '01-updater.patch'
    '02-cleaner.patch'
)

sha256sums=(
    '301798573b1c0a60889f7ae8f9c36f8f4265ace0966887d5bf6505c1990244c5'
    '7781ec7b33b7a7ca6770dc04442dad529f188f58112408bf4c36815b0bf36f05'
    '1daf6eb8f0bd1cb4437f66ff27e856c553ca6532795da79e20551ef10ee0b6b9'
)

prepare() {
    for p in *.patch; do
        patch -p0 -d "${_snapshot}" < "${p}"
    done
}

package() {
    local pkg_bin="${pkgdir}/usr/bin"
    local shr="/usr/share/${pkgname}"

    cd "${_snapshot}"

    sed -e "s|@@USERJSDIR@@|${shr}|" 'updater.sh' |
        install -Dm755 '/dev/stdin' "${pkg_bin}/${_name}-updater"
    install -Dm755 'prefsCleaner.sh' "${pkg_bin}/${_name}-cleaner"

    install -Dm644 -t "${pkgdir}${shr}" 'user.js'
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE.txt'
}
