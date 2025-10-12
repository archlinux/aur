# Maintainer: Vladislav Minakov <v@minakov.pro>
# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=mattermost-push-proxy
pkgver=6.4.3
pkgrel=1
pkgdesc='Mattermost Push Notifications Service'
arch=('x86_64')
url="https://github.com/mattermost/mattermost-push-proxy"
license=("Apache")
makedepends=('go' 'git')
backup=('etc/mattermost-push-proxy/config.json')
source=("https://github.com/mattermost/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers")
sha512sums=('d5c4db8e13ad4a04b6bb1151d0c588780f7eaa034b5bb0be266a367ae9e394ed36b7d97c878cdec7cd44a9df46b9e0fff283432f1b0eb1c5a13daa79a704e8bc'
            '6d646673f10d2e291d37bbfa53c0314f076922bf76ceadcecad8febb7ac377fedc1bbbc82d118e161ad662e1f363fb5ca0b3750a0601eedf56bdb9c5e084ede4'
            '8f92e38eb6918850af6a84402a13f56977d5a8c767c258c2efc8b5fe22bfb266a4f1e5bfbf440324cbb2228df0cf2feb9d4bb77c8b04d9b6731e7a654de90f84')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    GOPATH="${srcdir}" make go-build APP_NAME=$pkgname APP_VERSION=$pkgver
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/dist/${pkgname}-linux-amd64" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/config/${pkgname}.sample.json" "${pkgdir}/etc/${pkgname}/config.json"
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
