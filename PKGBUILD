# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: tee < teeaur at duck dot com >

pkgname=rare-go
_pkgname=rare
pkgver=0.5.5
pkgrel=1
pkgdesc="A fast text scanner/regex extractor and realtime summarizer"
arch=('x86_64' 'aarch64')
url="https://github.com/zix99/rare"
license=('GPL-3.0-or-later')
depends=('pcre2')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('89e9738097f3a42b564d8c06ca4bacffe22f9f6436679298f5441d502d97e9b4')

prepare() {
  cd "${_pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
  mkdir -p build
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  cd "${_pkgname}-${pkgver}"
  go build -o build -tags pcre2 .
}

check() {
  cd "${_pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/docs/${pkgname}/" README.md
}

# vim:set ts=2 sw=2 et:
