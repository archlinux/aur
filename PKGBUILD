# Maintainer: toxdes <hi@toxdes.com>
pkgname=glesha
pkgver=0.5.2
pkgrel=1
pkgdesc='Encrypted archives and indexed cloud backups'
arch=('x86_64' 'aarch64')
url='https://github.com/toxdes/glesha'
license=('MIT')
depends=()
makedepends=('git' 'go>=1.25')
source=("git+https://github.com/toxdes/glesha.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/glesha"
  CGO_ENABLED=0 go build -trimpath \
    -ldflags "-s -w -X main.VERSION=$(cat version.txt) -X main.GIT_SHA=$(git rev-parse --short=8 HEAD)" \
    -o build/glesha .
}

check() {
  cd "$srcdir/glesha"
  go test ./...
}

package() {
  cd "$srcdir/glesha"
  install -Dm755 build/glesha "$pkgdir/usr/bin/glesha"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 config-sample.toml "$pkgdir/usr/share/doc/glesha/config-sample.toml"
  for page in man/*.1; do
    install -Dm644 "$page" "$pkgdir/usr/share/man/man1/${page##*/}"
  done
}
