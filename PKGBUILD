# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_name=iris
pkgname=${_name}-autocomplete
pkgver=0.4.9
pkgrel=1
pkgdesc='Shell auto-completion tool that works like code editor''s IntelliSense.'
url="https://github.com/versenilvis/${_name}"
license=('0BSD')
depends=('glibc')
makedepends=('go')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b082d345895c6b6ab9275cc550fdbf0d1a114a9612a0b52f4f43922f71b91cba')

_srcdir="IRIS-${pkgver}"

build() {
	cd "${_srcdir}"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"

	go build -v \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\" \
		-X github.com/elves/elvish/pkg/buildinfo.Reproducible=true \
		-X github.com/elves/elvish/pkg/buildinfo.Version=$pkgver" \
		-o "${srcdir}/${_name}" \
		"./cmd/${_name}"
}

#check() {
#	cd "${_srcdir}"
#
#	go test -v './...'
#}

package() {
	optdepends+=('zsh' 'bash' 'fish')

	install -Dm755 "${_name}" "${pkgdir}/usr/bin/${pkgname}"
}
