# Maintainer: Mihai-Drosi Câju at cajum dot bugs at yandex dot com
pkgname=juju
pkgver=2.7.5
pkgrel=1
pkgdesc="Simple, secure devops tooling built to manage today's complex applications wherever you run your software."
arch=('x86_64')
url="https://github.com/juju/juju"
license=('AGPL3')
_pkgpath="github.com/juju/juju"

makedepends=(
	"git"
	"go-pie>=1.11"
)
depends=(
	"lxd"
)
source=(
	"${pkgname}-${pkgver}::git+https://${_pkgpath}#tag=${pkgname}-${pkgver}"
	"build.patch"
)
sha512sums=(
	"SKIP"
	"0fdd06f3265cf71c30bcd8b6f6cc58ec481fbfda024d73d8b93a90be39b15f46a66d0ed1671ba7fd86ff6b8350795188ab09473635dbcf633b7f0eb42c31d89b"
)

prepare () {
	export GOPATH="${srcdir}/go"
	cd "${pkgname}-${pkgver}"
	patch --forward --strip=1 --input="${srcdir}/build.patch"
	mkdir -p "$GOPATH/src/${_pkgpath}"
	cp -r . "$GOPATH/src/${_pkgpath}"
}
build () {
	export GOPATH="${srcdir}/go"
	cd "$GOPATH/src/${_pkgpath}"
	make release-install
}
check () {
	echo "No tests are run because juju's integration tests require a running lxd server without IPv6"
}
package() {
	export GOPATH="${srcdir}/go"
	install -D -m755 "${GOPATH}/bin/juju" "${pkgdir}/usr/bin/juju"
	install -D -m755 "${GOPATH}/bin/jujud" "${pkgdir}/usr/bin/jujud"
	install -D -m755 "${GOPATH}/bin/juju-metadata" "${pkgdir}/usr/bin/juju-metadata"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}/etc/bash_completion.d/juju" "${pkgdir}/usr/share/bash-completion/completions/juju"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}/etc/bash_completion.d/juju-version" "${pkgdir}/usr/share/bash-completion/completions/juju-version"
}
