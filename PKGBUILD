# Maintainer: Joop Kiefte <ikojba at gmail dot com>
pkgname=goloco-git
_pkgname=goloco
pkgver=r1191.669c40a
pkgrel=1
pkgdesc="Reimplementation of Chris Sawyer's Locomotion in Go, ported from OpenLoco (needs the original game data)"
arch=('x86_64' 'aarch64')
url="https://github.com/LaPingvino/goloco"
license=('MIT')
depends=('glibc' 'libglvnd' 'libx11' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'libxxf86vm' 'alsa-lib')
makedepends=('git' 'go')
provides=('goloco')
conflicts=('goloco')
install=goloco.install
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export GOPATH="$srcdir/gopath"
  go mod download -modcacherw
}

build() {
  cd "$_pkgname"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-linkmode=external" -o goloco ./cmd/goloco
}

package() {
  cd "$_pkgname"
  install -Dm755 goloco "$pkgdir/usr/bin/goloco"
  install -Dm644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
