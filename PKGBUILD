# Maintainer: Clayton Kehoe <clayton.j.kehoe at boeing dot com>
# Contributor : wiz64 <wiz64 dot com>
pkgname=config-file-validator
pkgver=3.0.0
pkgrel=1
pkgdesc="A tool to validate the syntax and schema of configuration files"
arch=('x86_64')
url="https://github.com/Boeing/config-file-validator"
license=('Apache 2.0')
depends=('glibc')
makedepends=('go>=1.26.1' 'git' 'sed')
source=("git+https://github.com/Boeing/config-file-validator.git")
sha256sums=('SKIP')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --abbrev=0 | sed 's/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  CGO_ENABLED=0 \
  GOOS=linux \
  GOARCH=amd64 \
  go build \
  -ldflags="-w -s -extldflags '-static' \
  -X github.com/Boeing/config-file-validator/v3.version=$pkgver" \
  -tags netgo \
  -o cfv \
  cmd/cfv/cfv.go
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 cfv "$pkgdir/usr/bin/cfv"
}
