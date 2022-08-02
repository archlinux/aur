# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=skate-git
pkgver=0.2.0.r9.g693df1f
pkgrel=1
pkgdesc="A personal key value store"
arch=('i686' 'x86_64')
url="https://github.com/charmbracelet/skate"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("skate=$pkgver")
conflicts=('skate')
source=("git+https://github.com/charmbracelet/skate.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "skate"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "skate"

  go build \
    ./
}

check() {
  cd "skate"

  go test \
    ./...
}

package() {
  cd "skate"

  install -Dm755 "skate" -t "$pkgdir/usr/bin"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/skate"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/skate"
}
