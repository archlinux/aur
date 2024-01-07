# Maintainer: Amolith <amolith@secluded.site>
pkgname=enclave-git
_pkgname=${pkgname%-git}
pkgdesc='Command-line secure encrypted deniable cloud-synchronized notebook'
arch=("any")
url="https://github.com/symbolicsoft/enclave"
_branch='main'
pkgver=r6.a2ae2e8
pkgrel=1
license=("GPL-2.0")
makedepends=("git" "go")
source=("$_pkgname::git+$url#branch=$_branch")
sha256sums=("SKIP")
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd $_pkgname

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o "$_pkgname" github.com/symbolicsoft/enclave/v2/cmd/enclave
}

check() {
  cd "$_pkgname"
  go test ./...
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
