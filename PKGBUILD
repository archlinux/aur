# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

_pkgbase=oauth2l
pkgname=${_pkgbase}-git
pkgver=v1.3.0.r4.g55ad5ab
pkgrel=1
pkgdesc='Simple CLI for interacting with Google API authentication - git version'
arch=('x86_64')
url="https://github.com/google/${_pkgbase}"
license=('Apache')
makedepends=('go' 'git')
source=("${_pkgbase}"::"git+${url}")
b2sums=('SKIP')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")

prepare() {
	cd "${_pkgbase}"
	mkdir --parents 'build'
}

pkgver() {
  cd "${_pkgbase}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgbase}"
	export \
		CGO_CPPFLAGS="${CPPFLAGS}" \
		CGO_CFLAGS="${CFLAGS}" \
		CGO_CXXFLAGS="${CXXFLAGS}" \
		CGO_LDFLAGS="${LDFLAGS}"
	go build \
		-buildmode=pie \
		-ldflags "
			-extldflags ${LDFLAGS}
			-linkmode=external
			-X main.version=$pkgver
		" \
		-mod=readonly \
		-modcacherw \
		-o build \
		-trimpath \
			./...
}

#check() {
#	cd "${_pkgbase}-${pkgver}"
#	go test \
#		-mod=readonly \
#		-v \
#			./...
#}

package() {
	install -D --mode 755 "${_pkgbase}/build/${_pkgbase}" "${pkgdir}/usr/bin/${_pkgbase}"
}
