# Maintainer: Vladislav Minakov <v@minakov.pro>
# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=mattermost-push-proxy
pkgver=6.4.6
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
sha512sums=('3b6dea160c39c9838cb9024bdfddd5a6cad5aa9fc30b5a04c4a45b2e60c6627775a8bbd324d07b3185da0aabe88310b638cd9414d21222007f09cbf98ea6538c'
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
