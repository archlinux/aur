# Maintainer: Pieter Joost van de Sande <pj@born2code.net>
pkgname=whatscli-git
_pkgname=whatscli
pkgver=20201120.ab03aeb
pkgrel=1
pkgdesc='A command line interface for whatsapp, based on go-whatsapp and tview'
url='https://github.com/normen/whatscli'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('git')
depends=('go' 'git')
source=('git://github.com/normen/whatscli.git')
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
  go build -o ${_pkgname} -ldflags "-extldflags ${LDFLAGS} -s -w -X main.version=${pkgver}" main.go
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" ${pkgdir}/usr/bin/${pkgname}
}
