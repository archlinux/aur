# Maintainer: Clayton Kehoe <clayton.j.kehoe at boeing dot com>
# Contributor : wiz64 <wiz64 dot com>
pkgname=config-file-validator
pkgver=1.8.1
pkgrel=1
pkgdesc="A tool to validate the syntax of configuration files"
arch=('x86_64')
url="https://github.com/Boeing/config-file-validator"
license=('Apache 2.0')
depends=('glibc')
makedepends=('go>=1.21' 'git' 'sed')
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
  -X github.com/Boeing/config-file-validator.version=$pkgver" \
  -tags netgo \
  -o validator \
  cmd/validator/validator.go
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 validator "$pkgdir/usr/bin/validator"
}