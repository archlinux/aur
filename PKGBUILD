# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=soft-serve-git
pkgver=0.3.2.r14.g76cedbf
pkgrel=1
pkgdesc="A tasty, self-hostable Git server for the command line"
arch=('i686' 'x86_64')
url="https://github.com/charmbracelet/soft-serve"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("soft-serve=$pkgver")
conflicts=('soft-serve')
source=("git+https://github.com/charmbracelet/soft-serve.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "soft-serve"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "soft-serve"

  go build \
    ./cmd/...
}

check() {
  cd "soft-serve"

  go test \
    ./...
}

package() {
  cd "soft-serve"

  install -Dm755 "soft" -t "$pkgdir/usr/bin"
  install -Dm644 "cmd/soft/soft.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/soft-serve"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/soft-serve"
}
