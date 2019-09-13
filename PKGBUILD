# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=mattermost-push-proxy
pkgver=5.9.0
pkgrel=1
pkgdesc='Mattermost Push Notifications Service'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mattermost/mattermost-push-proxy.git"
license=("Apache")

makedepends=('go-pie' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=('etc/mattermost-push-proxy/config.json')

source=(
    "https://github.com/mattermost/${pkgname}/archive/v${pkgver}.tar.gz"
    "${pkgname}.service"
    'mattermost-ldflags.patch'
)
sha512sums=(
    '0ed61fc1aef2a7ccc2d0df78cb0fedf6367834bf4ab05619d51c47803936a83cab6ca2c1cb0b1458aa768780cbb36d2377e31715a169f77acf32a531c7a3a79a'
    '6d646673f10d2e291d37bbfa53c0314f076922bf76ceadcecad8febb7ac377fedc1bbbc82d118e161ad662e1f363fb5ca0b3750a0601eedf56bdb9c5e084ede4'
    '0a6311b07df33cb5bed1d9e9a442e62fa75136e36a8a6100388151f39017c6457bbc62cb80a36ceb284c4ef8916efe230f81ea0a81d21001ad212469d3f77f22'
)
install="${pkgname}.install"

prepare() {
    cd "${srcdir}"
    mkdir -p src/github.com/mattermost
    cd src/github.com/mattermost
    ln -s "${srcdir}/mattermost-push-proxy-${pkgver}" "${pkgname}"
    cd "${pkgname}"

    # Testing the code with shadow breaks with Go 1.13, remove the test for now.
    # src.: https://github.com/mattermost/mattermost-server/issues/12202
    sed -r -iV Makefile \
        -e "/[$]\(GOPATH\)\/bin\/shadow/d"

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
