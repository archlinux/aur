# Maintainer: Pieter Joost van de Sande <pj@born2code.net>
pkgname=colorgo-git
_pkgname=colorgo
pkgver=20161027.1e1a5b5
pkgrel=1
pkgdesc='Colorize (highlight) `go build` command output'
url='https://github.com/songgao/colorgo'
arch=('i686' 'x86_64' 'armv7h')
makedepends=('git' 'go')
source=('git://github.com/songgao/colorgo.git')
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "${srcdir}/${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  GO111MODULE=off go get github.com/songgao/go.pipeline
  GO111MODULE=off go build -o ${_pkgname} -ldflags "-extldflags ${LDFLAGS} -s -w -X main.version=${pkgver}"
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" ${pkgdir}/usr/bin/${_pkgname}
}

# vim: ft=sh ts=2 sw=2 et
