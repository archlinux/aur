# Maintainer: Kimiblock Moe

_pkgname=draupnir
pkgname="${_pkgname}"
pkgver=2.3.0_beta.2
pkgrel=1
pkgdesc="A Matrix moderation bot"
arch=('x86_64')
url="https://github.com/the-draupnir-project/Draupnir"
license=('AFL-3.0' 'Apache-2.0' 'CC-BY-SA-4.0' 'CC0-1.0')
makedepends=('git' 'go' 'gcc' 'yarn' 'python' 'nodejs-lts-jod')
depends=("python" "gcc" "nodejs-lts-jod" "node-gyp" "nodejs-matrix-bot-sdk" "nodejs-js-yaml" "nodejs-config" "nodejs-matrix-protection-suite" "nodejs-matrix-protection-suite-for-matrix-bot-sdk")
conflicts=("${_pkgname}")
source=(
	"${_pkgname}::git+https://github.com/the-draupnir-project/Draupnir.git#tag=v$(echo ${pkgver} | sed 's|_|-|g')"
)
sha256sums=('1aeb814f40ed950e77c71d63687edc6559bd4091299203795a1d963eb361f0eb')

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
	install -d "${pkgdir}/usr/lib/"
	cp -a "${srcdir}/${_pkgname}/lib" "${pkgdir}/usr/lib/${_pkgname}"
	install -Dm600 "${srcdir}/${_pkgname}/config/default.yaml" "${pkgdir}/etc/draupnir/config.yaml"
	echo '''#!/usr/bin/bash
	node /usr/lib/draupnir/index.js --draupnir-config /etc/draupnir/config.yaml''' >start.sh
	install -Dm755 start.sh "${pkgdir}/usr/bin/draupnir"
}

