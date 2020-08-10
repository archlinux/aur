# Maintainer: w0rty <mawo97 at gmail.com>

pkgname=gitlab-glab
_realpkgname=glab
pkgver=1.8.0
pkgrel=1
pkgdesc='GLab is an open source Gitlab Cli tool written in Go to help work seamlessly with Gitlab from the command line.'
arch=('x86_64')
url="https://github.com/profclems/glab"
license=('MIT')
makedepends=('go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d8920ee2cec3e5a2731d79126b2951452288530698507bd584ff22825e781fb3')

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
  _builddate=$(date -u +%Y-%m-%d)
  go build -o build -trimpath -buildmode=pie -ldflags "-extldflags \"${LDFLAGS}\" -X glab.version=${pkgver} -X glab.build=${_builddate} -s -w" -modcacherw ./cmd/glab/main.go
}

package() {
  cd "${_realpkgname}-$pkgver"
  install -Dm755 build/main "$pkgdir"/usr/bin/${_realpkgname}
  install -Dm644 $srcdir/${_realpkgname}-$pkgver/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
