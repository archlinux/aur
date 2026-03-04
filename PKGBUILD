# Maintainer: Duncan Mac-Vicar P. <duncan@mac-vicar.eu>
pkgname=lstk
pkgver=0.2.3
pkgrel=1
pkgdesc='LocalStack CLI v2'
arch=('x86_64' 'aarch64')
url='https://github.com/localstack/lstk'
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
options=(!debug)
source=("git+https://github.com/localstack/lstk.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  local _commit _build_date
  _commit="$(git rev-parse --short HEAD)"
  _build_date="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -ldflags="
      -linkmode external
      -extldflags '$LDFLAGS'
      -X github.com/localstack/lstk/internal/version.version=${pkgver}
      -X github.com/localstack/lstk/internal/version.commit=${_commit}
      -X github.com/localstack/lstk/internal/version.buildDate=${_build_date}
    " \
    -o lstk \
    .
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 lstk "$pkgdir/usr/bin/lstk"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
