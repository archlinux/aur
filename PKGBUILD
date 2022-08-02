# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=glow-git
pkgver=1.4.1.r13.ge078953
pkgrel=1
pkgdesc="Render markdown on the CLI, with pizzazz!"
arch=('i686' 'x86_64')
url="https://github.com/charmbracelet/glow"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("glow=$pkgver")
conflicts=('glow')
source=("git+https://github.com/charmbracelet/glow.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "glow"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "glow"

  go build \
    ./
}

check() {
  cd "glow"

  go test \
    ./...
}

package() {
  cd "glow"

  install -Dm755 "glow" -t "$pkgdir/usr/bin"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/glow"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/glow"
}
