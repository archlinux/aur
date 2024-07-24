# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=kl2tpd
pkgver=0.1.8
pkgrel=1
pkgdesc="Client/LAC-mode daemon for creating L2TPv2 sessions. Alternative to xl2tpd"
arch=('x86_64')  # Might work on additional architectures
url="https://github.com/katalix/go-l2tp"
license=('MIT')
depends=('glibc' 'ppp')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}")
sha256sums=('21d64ae7fb629a86aa3f340aa08c96300457ae5162418926f55ceda2bf3bdb38')
options=(!debug)

_pkgbase="go-l2tp"
_srcname="${pkgname}-${pkgver}"

prepare() {
	cd "${_srcname}"
	mkdir -p build/
}

build() {
	cd "${_srcname}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFGLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="\
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags=-linkmode=external \
		-mod=readonly \
		-modcacherw"
	go build -o build "./cmd/${pkgname}"
}

check() {
	cd "${_srcname}"
	go test "./cmd/${pkgname}"
}

package() {
	cd "${_srcname}"
	install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
