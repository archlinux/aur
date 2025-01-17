# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=tern
pkgver=2.3.2
pkgrel=1
pkgdesc='A standalone migration tool for PostgreSQL'
arch=('x86_64' 'aarch64')
url='https://github.com/jackc/tern'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('postgresql: for local instance of PostgreSQL')
options=('!lto')
_commit='264a5156033e46a937907458bebdcc4091bb70f4'
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
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -o build .
}

package() {
  cd "$pkgname"

  install -Dm755 -t "$pkgdir/usr/bin" build/tern

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.markdown
}
