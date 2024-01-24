# Maintainer: Amolith <amolith@secluded.site>
pkgname=watt-wiser-git
_pkgname=${pkgname%-git}
pkgdesc='A software energy consumption estimation tool'
arch=("any")
url="https://git.sr.ht/~whereswaldon/watt-wiser"
_branch='main'
pkgver=r113.d2c33d7
pkgrel=1
license=("Unlicense")
makedepends=("git" "go" "gcc" "libx11" "vulkan-headers" "pkgconf" "wayland" "wayland-protocols" "libx11" "libxkbcommon-x11" "libxcursor")
depends=("watt-wiser-sensors" "xdg-desktop-portal")
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
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
