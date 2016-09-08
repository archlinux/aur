# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=mattermost-push-proxy
pkgver=3.4
pkgrel=1
pkgdesc='Mattermost Push Notifications Service'
url="https://github.com/mattermost/push-proxy.git"
license=("Apache")
backup=('etc/mattermost-push-proxy/config.json')
makedepends=('go')
conflicts=("${pkgname}-git")
source=("https://github.com/mattermost/push-proxy/archive/v${pkgver}.tar.gz"
        "${pkgname}.service")
sha512sums=('f0011b9c05dfad304ecb93a1a9030156e5340c0773b655d17ab7a749bbeb1de48da88cf74302e11d63db29fa3ba09a4422937197b626409380e627dd142d5d8a'
            '6d646673f10d2e291d37bbfa53c0314f076922bf76ceadcecad8febb7ac377fedc1bbbc82d118e161ad662e1f363fb5ca0b3750a0601eedf56bdb9c5e084ede4')
arch=("i686" "x86_64")
install="${pkgname}.install"

build() {
	cd "${srcdir}"
	mkdir -p gopath/src/github.com/mattermost
	mv -Tn "push-proxy-${pkgver}" gopath/src/github.com/mattermost/push-proxy

	cd $_
	GOPATH="${srcdir}/gopath" make build-server
}

package() {
	install -Dm755 "${srcdir}/gopath/bin/push-proxy" "${pkgdir}/usr/bin/mattermost-push-proxy"
	install -Dm644 "${srcdir}/gopath/src/github.com/mattermost/push-proxy/config/config-push-proxy.json" \
		"${pkgdir}/etc/mattermost-push-proxy/config.json"
	install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
