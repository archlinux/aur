# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=tern
pkgver=2.2.0
pkgrel=1
pkgdesc='A standalone migration tool for PostgreSQL'
arch=('x86_64')
url='https://github.com/jackc/tern'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('postgresql: for local instance of PostgreSQL')
options=('!lto')
_commit='bc02ac511a0c2ae3a3bd261302085adddc46bfa9'
source=("$pkgname::git+$url.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  mkdir -p build
  go mod download
}

build() {
  cd "$pkgname"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external" \
    -o build \
    .
}

package() {
  cd "$pkgname"

  install -Dm755 -t "$pkgdir/usr/bin" build/tern

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.markdown
}
