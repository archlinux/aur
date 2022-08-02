# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=melt-git
pkgver=0.4.1.r6.gdf736f8
pkgrel=1
pkgdesc="Backup and restore Ed25519 SSH keys with seed words"
arch=('i686' 'x86_64')
url="https://github.com/charmbracelet/melt"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("melt=$pkgver")
conflicts=('melt')
source=("git+https://github.com/charmbracelet/melt.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "melt"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "melt"

  go build \
    ./cmd/...
}

check() {
  cd "melt"

  #go test \
  #  ./...
}

package() {
  cd "melt"

  install -Dm755 "melt" -t "$pkgdir/usr/bin"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/melt"
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/melt"
}
