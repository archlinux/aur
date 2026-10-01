# Maintainer: George Hilliard <me@thirtythreeforty.net>
pkgname=droprun
pkgver=0.3.0
pkgrel=1
pkgdesc="Linux sandboxing that doesn't get in your way"
arch=('x86_64' 'aarch64')
url='https://github.com/wrr/drop'
license=('Apache-2.0')
depends=('passt')
optdepends=('gvisor: gVisor sandbox runtime (runsc)')
makedepends=('go>=1.25')
conflicts=('drop' 'droprun-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1b55e422b7fc959134efc9c2568bd9252d9bb500ad309874c13ec6cee33bc399')

prepare() {
  cd "$srcdir/drop-$pkgver"
  go mod download
}

build() {
  cd "$srcdir/drop-$pkgver"
  CGO_ENABLED=0 go build -mod=readonly -trimpath -buildmode=pie \
    -ldflags "-X main.Version=$pkgver" -o drop ./cmd/drop
}

check() {
  cd "$srcdir/drop-$pkgver"
  CGO_ENABLED=0 go test -mod=readonly ./...
}

package() {
  cd "$srcdir/drop-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
