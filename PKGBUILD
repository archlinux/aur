# Maintainer: Sam Whited <sam@samwhited.com>

_pkgname=dep
pkgname=go-${_pkgname}-git
pkgver=v0.5.0_15_g22125cfaa6dd
pkgrel=1
pkgdesc='Legacy dependency management tool for Go'
arch=(i686 x86_64)
url='https://golang.github.io/dep/'
license=(BSD)
depends=(glibc)
makedepends=("go>=1.11")
conflicts=('go-dep')
provides=('go-dep')
source=("git+https://github.com/golang/dep.git")
sha256sums=('SKIP')

export GO111MODULE=on

pkgver() {
  cd "${_pkgname}"
  git describe --tags --long | sed s/-/_/g
}

prepare() {
  cd "${_pkgname}"
  export GOCACHE="${srcdir}/cache"

  # Copy dependencies from the Gopkg.toml to bootstrap using Go Modules.
  rm -f go.mod go.sum
  go mod init github.com/golang/dep
  go mod vendor
}

build() {
  cd "${_pkgname}"
  export GOCACHE="${srcdir}/cache"

  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $_pkgname ./cmd/dep
}

package() {
  cd "${_pkgname}"

  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r docs/* "$pkgdir/usr/share/doc/$pkgname"

  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 CONTRIBUTORS "$pkgdir/usr/share/licenses/$pkgname/CONTRIBUTORS"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
