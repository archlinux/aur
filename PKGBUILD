# Maintainer: Amolith <amolith@secluded.site>
pkgname=carpd-git
_pkgname=${pkgname%-git}
pkgdesc='Small tool that prints a count of total pending updates for Arch'
arch=("any")
url="https://git.sr.ht/~amolith/carpd"
_branch='main'
pkgver=r1.7aac36c
pkgrel=1
license=("Unlicense")
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

  go build -o "$_pkgname" .
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSES/Unlicense.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
