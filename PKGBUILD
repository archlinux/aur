# Maintainer: Martin Rys <rys.pw/contact>
# Previous maintainers: Luiz Ribeiro <luizribeiro@gmail.com>, Tom Wambold <tom5760@gmail.com>

pkgname=oauth2_proxy
pkgver=7.5.1
pkgrel=1
pkgdesc="A reverse proxy that provides authentication with Google, Github or other providers."
arch=('i686' 'x86_64')
url="https://github.com/oauth2-proxy/oauth2-proxy"
license=('MIT')
makedepends=(go)
backup=('etc/oauth2_proxy.cfg')
install=oauth2_proxy.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/oauth2-proxy/oauth2-proxy/archive/v${pkgver}.tar.gz"
        'oauth2_proxy.service')
sha256sums=('97de086ba98ce884da77d4031537f72496a059d14c60977c46824c24010096c8'
            'b8de9626474527b75cec9d23a621af4ef2d35ff13aff1a0b8a1a22fef262c970')

build() {
	mkdir -p github.com/oauth2-proxy

	mv "oauth2-proxy-${pkgver}" github.com/oauth2-proxy/oauth2-proxy
	mkdir -p deps dist

	export GOPATH="$(pwd)/deps:$(realpath $(pwd)/..)"
	cd github.com/oauth2-proxy/oauth2-proxy

	# Default version variable to $pkgver instead of "undefined" as the buildtime version detection in the Makefile fails
	sed -i "s,VERSION = \"undefined\",VERSION = \"${pkgver}\"," version.go

	go build -o ../../../dist/oauth2-proxy -trimpath
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/etc"
	mkdir -p "${pkgdir}/usr/lib/systemd/system"

	install dist/oauth2-proxy "${pkgdir}/usr/bin/oauth2-proxy"
	install github.com/oauth2-proxy/oauth2-proxy/contrib/oauth2-proxy.cfg.example "${pkgdir}/etc/oauth2_proxy.cfg"
	install oauth2_proxy.service "${pkgdir}/usr/lib/systemd/system/oauth2_proxy.service"
}
