pkgname=statsdaemon
pkgdesc='Port of StatsD to Go, with built-in Graphite support'
license=(custom)
pkgver=0.7.3
pkgrel=1
makedepends=(go)
depends=(glibc)
arch=(x86_64 arm i686)
url=https://github.com/bitly/statsdaemon
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('09c3c68be74afe2d2a04b35b404c0cd3582d42e33e61a101891dc49cd71d08fbdd17829d7b25f30f8833fc0429929097f7dc1c936d242a93a8861352a1441844')

build () {
	cd "${pkgname}-${pkgver}"
	export GOPATH="${srcdir}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS//-flto/}"
	export CGO_CXXFLAGS="${CXXFLAGS//-flto/}"
	go build -v -modcacherw -trimpath -buildmode pie -mod vendor \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS//-flto/}\"" \
		-o statsdaemon
}

package () {
	cd "${pkgname}-${pkgver}"
	install -Dm644 UNLICENSE \
	               "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
	install -Dm644 README.md \
	               "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm755 statsdaemon \
	               "${pkgdir}/usr/bin/statsdaemon"
}
