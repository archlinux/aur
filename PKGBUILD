# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=mattermost-push-proxy
pkgver=4.10.1
pkgrel=1
pkgdesc='Mattermost Push Notifications Service'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mattermost/mattermost-push-proxy.git"
license=("Apache")

makedepends=('go')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=('etc/mattermost-push-proxy/config.json')

source=(
    "https://github.com/mattermost/${pkgname}/archive/v${pkgver}.tar.gz"
    "${pkgname}.service"
)
sha512sums=(
    'f97a75f45cd145a2261107b853accbd7c60821e96866e3b69518b7b37f5c41956d03320156d3e2fc065609736506c26c842ec016fc23ed5a028c76a88430cb5f'
    '6d646673f10d2e291d37bbfa53c0314f076922bf76ceadcecad8febb7ac377fedc1bbbc82d118e161ad662e1f363fb5ca0b3750a0601eedf56bdb9c5e084ede4'
)
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
