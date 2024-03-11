# Maintainer: Amolith <amolith@secluded.site>
pkgname=watt-wiser-sensors-git
_pkgname=${pkgname%-git}
_repo=watt-wiser
pkgdesc='A software energy consumption estimation tool'
arch=("any")
url="https://git.sr.ht/~whereswaldon/$_repo"
_branch='main'
pkgver=r183.872a2df
pkgrel=1
license=("Unlicense")
makedepends=("git" "go" "gcc" "lm_sensors")
source=("$_repo::git+$url#branch=$_branch")
sha256sums=("SKIP")
provides=($pkgname)
conflicts=("watt-wiser-sensors" "watt-wiser")

pkgver() {
  cd "$_repo"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd $_repo

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o "$_pkgname" ./cmd/watt-wiser-sensors
}

check() {
  cd "$_repo"
  go test ./...
}

package() {
  cd "$_repo"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
