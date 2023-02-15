# Maintainer: Danilo Carolino <danilogcarolino@gmail.com>

_gitbranch=main
_gitauthor=devemio
pkgname=docker-color-output-git
pkgver=2.2.0
pkgrel=12
pkgdesc="Colors for Docker CLI"
arch=('x86_64')
license=('MIT')
url="https://github.com/${_gitauthor}/${pkgname%-git}"
source=("${pkgname%-git}.tar.gz::https://github.com/${_gitauthor}/${pkgname%-git}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('SKIP')
depends=('go')
makedepends=("go" "git")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
options=("!lto")

prepare() {
  cd "$srcdir/${pkgname%-git}-${pkgver}"

  go mod tidy -compat=1.17
}

build() {
  cd "$srcdir/${pkgname%-git}-${pkgver}"

  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export GOCACHE=/tmp/
  make EXT_LDFLAGS="-linkmode external" GOFLAGS="-buildmode=pie -trimpath" 
}

package() {
  cd "$srcdir/${pkgname%-git}-${pkgver}"
  install -vDm 755 "bin/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  #install -vDm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
}
