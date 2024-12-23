# Maintainer: tuhtah <tamer.fahmy at gmail dot com>
# Adapted from benthos: https://aur.archlinux.org/packages/benthos

pkgname=bento
pkgdesc='Fancy stream processing made operationally mundane'
arch=(aarch64 armv7h x86_64)
url='https://warpstreamlabs.github.io/bento/'
_url='https://github.com/warpstreamlabs/bento'
_branch='main'
pkgver=1.4.0
pkgrel=0
license=('MIT')
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
sha256sums=('395042738010d960ab5d93b42c717364ee54a43c7b5b71d97dd2d93bc822e6b3')
provides=($pkgname)
conflicts=($pkgname)

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  BENTO_BUILDFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  BENTO_LDFLAGS="'-ldflags=-linkmode=external -X=main.Version=v${pkgver} -X=main.DateBuilt=$(date +%Y-%m-%dT%H:%M:%SZ)'"
  export GOFLAGS="${BENTO_BUILDFLAGS} ${BENTO_LDFLAGS}"

  go build -o bento cmd/bento/main.go
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
