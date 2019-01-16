# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=go-dep
_pkgname=${pkgname#go-}
pkgver=0.5.0
pkgrel=3
pkgdesc='Legacy dependency management tool for Go'
arch=(i686 x86_64)
url='https://golang.github.io/dep/'
license=(BSD)
depends=(glibc)
makedepends=("go>=1.11")
source=("https://github.com/golang/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('65c31c8d51513dfabd25f1f37ecd22a38ab3bcdd5893bdf10f54941250e4f19d')

export GO111MODULE=on

prepare() {
  cd "${_pkgname}-${pkgver}/"
  export GOCACHE="${srcdir}/cache"

  # Copy dependencies from the Gopkg.toml to bootstrap using Go Modules.
  rm -f go.mod go.sum
  go mod init github.com/golang/dep
  go mod vendor
}

build() {
  cd "${_pkgname}-${pkgver}/"
  export GOCACHE="${srcdir}/cache"

  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $_pkgname ./cmd/dep
}

package() {
  cd "${_pkgname}-${pkgver}/"

  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r docs/* "$pkgdir/usr/share/doc/$pkgname"

  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 CONTRIBUTORS "$pkgdir/usr/share/licenses/$pkgname/CONTRIBUTORS"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
