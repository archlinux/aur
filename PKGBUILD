# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=nooga
_gitname=let-go
_appname=lg
pkgname=${_gitname}
pkgdesc="Almost Clojure written in Go"

pkgver=1.11.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")

makedepends=('git' 'go')
depends=('glibc' 'bash')

options=(!strip)

source=("git+${url}.git#tag=${_gitversion}")
# source=("${pkgname}-${pkgver}.tgz::${url}/archive/${_gitversion}.tar.gz")
sha256sums=('5dffbf0166fefd98bf06e6ca21b9ecc5215d6dfeacee676ae54706e3ae401f89')


prepare() {
	cd ${srcdir}/${pkgname}/ || exit 1

	git submodule update --init
}

build() {
	cd ${srcdir}/${pkgname}/ || exit 1

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	VERSION="${pkgver}"
	DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
	COMMIT="$(git rev-parse HEAD 2>/dev/null || echo 'unknown')"

	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X main.version=${VERSION} -X main.commit=${COMMIT} -X main.date=${DATE}" \
		-o "${_appname}" .
}

check() {
	cd ${srcdir}/${pkgname}/ || exit 1

	go test -count=1 -v ./test/...
}

package() {
	cd ${srcdir}/${pkgname}/ || exit 1

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -dm755 "${pkgdir}/usr/share/${pkgname}/examples"
	cp -rf "examples/"* "${pkgdir}/usr/share/${pkgname}/examples/"

	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/docs"
	cp -rf "docs/"* "${pkgdir}/usr/share/doc/${pkgname}/docs/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
