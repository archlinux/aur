# Maintainer: Kimiblock Moe

_pkgname=draupnir
pkgname="${_pkgname}"
pkgver=2.2.0
pkgrel=1
pkgdesc="A Matrix moderation bot"
arch=('x86_64')
url="https://github.com/the-draupnir-project/Draupnir"
license=('AFL-3.0' 'Apache-2.0' 'CC-BY-SA-4.0' 'CC0-1.0')
makedepends=('git' 'go' 'gcc' 'yarn' 'python' 'nodejs-lts-jod')
depends=("python" "gcc" "nodejs-lts-jod" "node-gyp")
conflicts=("${_pkgname}")
source=(
	"${_pkgname}::git+https://github.com/the-draupnir-project/Draupnir.git#tag=v${pkgver}"
)
sha256sums=('ec3f4cfa3a767c5c25994f50e5e69baf26ae0305519e5efa22da33f64487d283')

function prepare() {
	cd "${_pkgname}"
	yarn
}
#function pkgver() {
#	cd "${srcdir}/${_pkgname}"
#	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#}

function build() {
	cd "${_pkgname}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	yarn build
}

function package() {
	cd "${srcdir}/${_pkgname}"
	install -d "${pkgdir}/usr/lib/${_pkgname}"
	cp -a "${srcdir}/${_pkgname}/lib" "${pkgdir}/usr/lib/${_pkgname}"
	install -Dm600 "${srcdir}/${_pkgname}/config/default.yaml" "${pkgdir}/etc/draupnir/config.yaml"
	echo '''#!/usr/bin/bash
	node /usr/lib/draupnir/lib/index.js --draupnir-config /etc/draupnir/config.yaml''' >start.sh
	install -Dm755 start.sh "${pkgdir}/usr/bin/draupnir"
}

