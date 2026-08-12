# Maintainer: Duncan Mac-Vicar P. <duncan@mac-vicar.eu>
pkgname=lstk
pkgver=0.21.0
pkgrel=1
pkgdesc='LocalStack CLI v2'
arch=('x86_64' 'aarch64')
url='https://github.com/localstack/lstk'
license=('Apache-2.0')
makedepends=('git' 'go')
optdepends=(
  'docker: required to run LocalStack containers with lstk start/stop/logs'
  'xdg-utils: use xdg-open to launch browser-based login flow'
)
options=(!debug)
source=("git+https://github.com/localstack/lstk.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  local _commit _build_date
  _commit="$(git rev-parse --short HEAD)"
  _build_date="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

  CGO_ENABLED=0 go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -ldflags="
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
