# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=d2-git
pkgver=0.5.1.r147.gce9383577
pkgrel=1
pkgdesc="A modern diagram scripting language that turns text to diagrams"
arch=('i686' 'x86_64')
url="https://d2lang.com/"
license=('MPL2')
depends=('glibc')
makedepends=('git' 'go')
provides=("d2=$pkgver")
conflicts=('d2')
source=("git+https://github.com/terrastruct/d2.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "d2"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "d2"

  go build \
    ./...
}

check() {
  cd "d2"

  #go test \
  #  ./...
}

package() {
  cd "d2"

  GOBIN="$pkgdir/usr/bin" \
    go install ./

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/d2"
  cp -r "docs" "$pkgdir/usr/share/doc/d2"

  install -Dm644 "ci/release/template/man/d2.1" -t "$pkgdir/usr/share/man/man1"
}
