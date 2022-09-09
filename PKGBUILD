# Maintainer: Eric Engestrom <aur@engestrom.ch>

_pkgname=bichon
pkgname=$_pkgname-git
pkgver=0+442.gd69c5e0bf9
pkgrel=1
pkgdesc="Tool to determine whether the X server in use is Xwayland"
arch=(x86_64)
url=https://gitlab.com/bichon-project/bichon
license=(Apache)
makedepends=(git go)
source=("git+$url")
sha256sums=('SKIP')
conflicts=($_pkgname)
provides=($_pkgname)

pkgver() {
  cd "$_pkgname" || exit 1
  set -o pipefail
  git describe --tags --abbrev=10 | sed 's/-/+/; s/-/./' ||
  printf "0+%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=10 HEAD)"
}

build() {
  cd "$_pkgname" || exit 1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  cd "$_pkgname" || exit 1
  GOBIN="$pkgdir"/usr/bin/ go install
}
