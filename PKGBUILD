pkgname='cockroachdb-git'
pkgdesc='A Scalable, Geo-Replicated, Transactional Datastore'
pkgver=r9542.234e580
pkgrel=1
license=('Apache')
url='https://github.com/cockroachdb/cockroach'
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('go')


pkgver () {
	cd "${GOPATH}/src/github.com/cockroachdb/cockroach"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	) | sed 's/alpha\.//'
}

prepare () {
	export GOPATH="$(pwd)/go"
	rm -rf "${GOPATH}/src/github.com/cockroachdb/cockroach"
	mkdir -p "${GOPATH}/src/github.com/cockroachdb"
	mv "${pkgname}" "${GOPATH}/src/github.com/cockroachdb/cockroach"
}

build () {
	export GOPATH="$(pwd)/go"
	cd "${GOPATH}/src/github.com/cockroachdb/cockroach"

	# Do not use "make release", is the LDFLAGS added by the Makefile
	# result in linkage errors.
	make .bootstrap
	go build -v -i -o cockroach
}

package () {
	export GOPATH="$(pwd)/go"
	cd "${GOPATH}/src/github.com/cockroachdb/cockroach"
	install -Dm755 cockroach "${pkgdir}/usr/bin/cockroach"
}
