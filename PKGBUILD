# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=mattermost-push-proxy
pkgver=5.4
pkgrel=1
pkgdesc='Mattermost Push Notifications Service'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mattermost/mattermost-push-proxy.git"
license=("Apache")

makedepends=('go-pie')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=('etc/mattermost-push-proxy/config.json')

source=(
    "https://github.com/mattermost/${pkgname}/archive/v${pkgver}.tar.gz"
    "${pkgname}.service"
    'mattermost-ldflags.patch'
)
sha512sums=(
    '498cd563538cff338e63e160828eb9b15a3b7e33ea7ae153f96de77cb72db3256c48607ebe7793a5f565009364259a306fecfb022f960b61a26682cd19c597c0'
    '6d646673f10d2e291d37bbfa53c0314f076922bf76ceadcecad8febb7ac377fedc1bbbc82d118e161ad662e1f363fb5ca0b3750a0601eedf56bdb9c5e084ede4'
    'SKIP'
)
install="${pkgname}.install"

prepare() {
    cd "${srcdir}"
    mkdir -p src/github.com/mattermost
    cd src/github.com/mattermost
    ln -s "${srcdir}/mattermost-push-proxy-${pkgver}" "${pkgname}"
    cd "${pkgname}"

    # Pass Arch Linux's Go compilation flags to Mattermost in order to take
    # into account advanced features like PIE.
    patch < "${srcdir}"/mattermost-ldflags.patch
}

build() {
    cd "${srcdir}/src/github.com/mattermost/${pkgname}"
    GOPATH="${srcdir}" make build-server
}

package() {
    install -Dm755 "${srcdir}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/src/github.com/mattermost/${pkgname}/config/${pkgname}.json" \
        "${pkgdir}/etc/${pkgname}/config.json"
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
