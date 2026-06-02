# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=wordgen-git
pkgver=0.5.3.r0.g9861075
pkgrel=1
pkgdesc='A CLI random word generator.'
arch=('x86_64')
url='https://github.com/wordgen/cli'
license=('AGPL-3.0-or-later')
makedepends=('git' 'go')
provides=('wordgen')
conflicts=('wordgen')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/cli"

  git describe --long --tags --abbrev=7 \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "$srcdir/cli"

  go test ./...
}

build() {
  cd "$srcdir/cli"

  _version="$(git describe --tags --always)"

  CGO_ENABLED=0 \
    go build \
    -trimpath \
    -ldflags="-s -X main.version=$_version" \
    -buildvcs=false \
    -o ./bin/wordgen \
    ./cmd/wordgen
}

package() {
  cd "$srcdir/cli"

  install -Dm755 ./bin/wordgen -t "$pkgdir/usr/bin/"
  install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/wordgen/"
}
