# Maintainer: Amolith <amolith@secluded.site>
pkgname=beats-swatch-git
_pkgname=${pkgname%-git}
_binname=${_pkgname%-swatch}
pkgdesc='Go library for all your Swatch Internet Time needs (command)'
arch=("any")
url="https://github.com/peterhellberg/beats.git"
uri="github.com/peterhellberg/beats"
_branch='master'
pkgver=r8.9151836
pkgrel=1
license=("MIT")
makedepends=("git" "go")
source=("$pkgname::git+$url#branch=$_branch")
sha256sums=("SKIP")
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd $pkgname

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go mod init $uri
  go mod tidy
  go build -o "$_binname" ./cmd/$_binname
}

check() {
  cd "$pkgname"
  go test ./cmd/$_binname
}

package() {
  cd "$pkgname"
  install -Dm755 "$_binname" "$pkgdir/usr/bin/$_binname"
  sed -n '/---/q;p' README.md | sed 's/^> //' | tail -19 > LICENSE
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_binname/LICENSE"
}
