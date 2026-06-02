# Maintainer: Abdullah Zulfiqar <abdullah@example.com>
pkgname=twin-cli-git
pkgver=87afb7e
pkgrel=1
pkgdesc="A lightweight, agentic self-healing CLI wrapper that intercepts compiler failures and executes Docker sandbox recovery."
arch=('x86_64' 'aarch64')
url="https://github.com/AbdullahZulfiqar2005/Twin"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
optdepends=('docker: for containerized sandbox verification trial runs')
provides=('twin')
conflicts=('twin')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Twin"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/Twin"
  mkdir -p build
}

build() {
  cd "$srcdir/Twin"
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
  go build -o build/twin -ldflags="-s -w -X main.Version=${pkgver}" ./cmd/twin
}

package() {
  cd "$srcdir/Twin"
  install -Dm755 build/twin "$pkgdir/usr/bin/twin"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
