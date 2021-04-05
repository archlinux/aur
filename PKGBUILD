# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=gofetch-git
_pkgname=${pkgname%-git}
pkgver=r54.9ca09f3
pkgrel=1
pkgdesc='Gofetch is a pretty command-line "Go and System information" tool written in Go'
arch=(x86_64 i686 armv7h)
url='https://github.com/Gyro7/gofetch'
license=('MIT')
makedepends=(git go)
source=("gofetch::git+$url.git#branch=main")
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $_pkgname

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build .
}

check() {
  cd "$_pkgname"
  go test ./...
}

package() {
  cd "$_pkgname"
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
