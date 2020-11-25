# Maintainer: Pieter Joost van de Sande <pj@born2code.net>
pkgname=bella-git
_pkgname=bella
pkgver=20201124.42d8158
pkgrel=1
pkgdesc='Bella renders text to graphics and prints it on a label maker using IPP/CUPS.'
url='https://github.com/tv42/bella'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('git')
depends=('go' 'git')
source=('git+https://github.com/tv42/bella.git')
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
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ${_pkgname} -ldflags "-extldflags ${LDFLAGS} -s -w -X main.version=${pkgver}" ./cmd/bella-png/main.go
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ft=sh ts=2 sw=2 et
