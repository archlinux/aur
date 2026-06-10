# Maintainer: Alex Oleshkevich <alex.oleshkevich@gmail.com>
pkgname=niri-autolabel
pkgver=0.1.2
pkgrel=1
pkgdesc="Labels niri workspaces from their window contents via OpenRouter"
arch=('x86_64')
url="https://github.com/alex-oleshkevich/niri-autolabel"
license=('MIT')
depends=('niri')
makedepends=('go')
_upstream=niri-autolabel
source=("$_upstream-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('86475ec10a013905af9f3ac91a519f50f61fa065e1803219ad7c11f2f68f8950')

build() {
  cd "$_upstream-$pkgver"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  go build -ldflags "-s -w -X main.version=$pkgver" -o autolabel .
}

check() {
  cd "$_upstream-$pkgver"
  go test ./...
}

package() {
  cd "$_upstream-$pkgver"
  install -Dm755 autolabel "$pkgdir/usr/bin/autolabel"
  install -Dm644 autolabel.service "$pkgdir/usr/lib/systemd/user/autolabel.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
