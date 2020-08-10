# Maintainer: w0rty <mawo97 at gmail.com>

pkgname=gitlab-glab
_realpkgname=glab
pkgver=1.8.1
pkgrel=2
pkgdesc='GLab is an open source Gitlab Cli tool written in Go to help work seamlessly with Gitlab from the command line.'
arch=('x86_64')
url="https://github.com/profclems/glab"
license=('MIT')
makedepends=('go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9fc201294da06f3ad9d7b2e15910f81273fbce642884865b9a61c5cbe041c62d')

prepare(){
  cd "${_realpkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  export GOPATH="$srcdir"/gopath
  cd "${_realpkgname}-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  _builddate=$(date -u +%m/%d/%Y)
  go build -o build -trimpath -buildmode=pie -ldflags "-extldflags \"${LDFLAGS}\" -X main.version=${pkgver} -X main.build=${_builddate} -s -w" -modcacherw ./cmd/glab/main.go
}

package() {
  cd "${_realpkgname}-$pkgver"
  install -Dm755 build/main "$pkgdir"/usr/bin/${_realpkgname}
  install -Dm644 $srcdir/${_realpkgname}-$pkgver/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
