# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor Amolith <amolith@secluded.site>

_pkgauthor=bmf-san
_pkgname=gohan
pkgname=${_pkgname}
pkgdesc="A simple, fast static site generator written in Go with differential builds"

pkgver=1.4.0
pkgrel=1
_ghversion=v${pkgver}

arch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_ghversion}"

license=('MIT')

depends=('glibc')
makedepends=('go')
provides=("${_pkgname}")
conflicts=("${_pkgname}"{-bin,-git})

source=("${_pkgname}-${pkgver}.tgz::${url}/archive/${_ghversion}.tar.gz")
sha256sums=('f46e5af14166adb498576a93718eca7e4aaacf934d4c9e38a5f46a35ff02fede')


prepare() {
	cd "${pkgname}-${pkgver}" || exit

	export GOPATH="${srcdir}"
	go mod download -modcacherw
}

build() {
	cd "${pkgname}-${pkgver}" || exit

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	VERSION="${_ghversion}"
	DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
	COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')"

	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X main.version=${VERSION} -X main.commit=${COMMIT} -X main.date=${DATE}" \
		-o "${_pkgname}" \
		./cmd/${_pkgname}
}

check() {
	cd "${pkgname}-${pkgver}" || exit

	go test ./...
}

package() {
	cd "${pkgname}-${pkgver}" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
