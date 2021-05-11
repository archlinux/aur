# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=fm-git
_pkgname=${pkgname%-git}
pkgdesc='A terminal based file manager'
arch=(aarch64 armv5h armv6h armv7h x86_64)
url='https://github.com/knipferrc/fm'
_branch='main'
pkgver=r117.807309c
pkgrel=1
license=('MIT')
makedepends=(git go)
source=("$pkgname::git+$url.git#branch=$_branch")
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $pkgname

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o "$_pkgname" ./main.go
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
