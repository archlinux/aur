# Maintainer: Danilo Carolino <danilogcarolino@gmail.com>

_gitbranch=main
_gitauthor=devemio
pkgname=docker-color-output-git
pkgver=2.2.0
pkgrel=18
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

  export GOCACHE="/tmp/docker-color-output-git"
  export GOPATH=$HOME
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
      -o bin/${pkgname%-git} ./cmd/cli
}

package() {
  install -Dm 755 "$srcdir/${pkgname%-git}-${pkgver}/bin/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
  install -vDm 644 "$srcdir/${pkgname%-git}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
  #install -vDm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
