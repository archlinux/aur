# Maintainer: envolution
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=html2md
pkgver=1.6.0
pkgrel=2
pkgdesc='HTML to Markdown converter'
arch=(x86_64 aarch64 armv7h i686)
url='https://github.com/suntong/html2md'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
source=(
  "${pkgname}-${pkgver}::git+$url.git#tag=v$pkgver"
)
sha256sums=('9df1f93b4a88ed0000afffd63ea8c07670f60faa91ae7e6ae10426c5685053aa')

build() {
  cd "$pkgname-$pkgver"

	export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v .
}

check() {
  cd "$pkgname-$pkgver"
  go test -v ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -vDm755 -t "$pkgdir/usr/bin" html2md
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
