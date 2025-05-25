# Maintainer: tuhtah <tamer.fahmy at gmail dot com>
# Adapted from benthos: https://aur.archlinux.org/packages/benthos

pkgname=bento
pkgdesc='Fancy stream processing made operationally mundane'
arch=(aarch64 armv7h x86_64)
url='https://warpstreamlabs.github.io/bento/'
_url='https://github.com/warpstreamlabs/bento'
_branch='main'
pkgver=1.7.1
pkgrel=0
license=('MIT')
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0b8eb6e4695a3f716e392e93d21f91e98c439ea2c257596e22e42c620f690011')
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
