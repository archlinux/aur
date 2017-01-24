# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=mattermost-push-proxy
pkgver=3.5
pkgrel=1
pkgdesc='Mattermost Push Notifications Service'
url="https://github.com/mattermost/push-proxy.git"
license=("Apache")
backup=('etc/mattermost-push-proxy/config.json')
makedepends=('go')
conflicts=("${pkgname}-git")
source=("https://github.com/mattermost/push-proxy/archive/v${pkgver}.tar.gz"
        "${pkgname}.service")
sha512sums=('785561cf41a5a423eb53256a7c18330dbbe62ef5a22e4fa5bad7c38d1592ea2d48ef78cd957a727da2fcdc794acdb19561b63fdc73f9d8b81dc34af57b5ade7a'
            '6d646673f10d2e291d37bbfa53c0314f076922bf76ceadcecad8febb7ac377fedc1bbbc82d118e161ad662e1f363fb5ca0b3750a0601eedf56bdb9c5e084ede4')
arch=("i686" "x86_64")
install="${pkgname}.install"

build() {
	cd "${srcdir}"
	mkdir -p gopath/src/github.com/mattermost
	mv -Tn "mattermost-push-proxy-${pkgver}" gopath/src/github.com/mattermost/mattermost-push-proxy

	cd $_
	GOPATH="${srcdir}/gopath" make build-server
}

package() {
	install -Dm755 "${srcdir}/gopath/bin/mattermost-push-proxy" "${pkgdir}/usr/bin/mattermost-push-proxy"
	install -Dm644 "${srcdir}/gopath/src/github.com/mattermost/mattermost-push-proxy/config/mattermost-push-proxy.json" \
		"${pkgdir}/etc/mattermost-push-proxy/config.json"
	install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
