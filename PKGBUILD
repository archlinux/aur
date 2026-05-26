# Maintainer: Igilq <igorwisnia@ik.me>

pkgname=fusioncore-git
pkgver=r12.20260119.d959eb1
pkgrel=1
pkgdesc="Fallout Modloader for Linux"
arch=('x86_64')
url="https://github.com/Bazsalanszky/fusioncore"
license=('MIT')
depends=()
makedepends=('git' 'go')
provides=('fusioncore')
conflicts=('fusioncore')
source=("git+https://github.com/Bazsalanszky/fusioncore.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/fusioncore"
  printf "r%s.%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git show -s --date=format:%Y%m%d --format=%cd HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/fusioncore"

  export CGO_ENABLED=1
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"

  go build \
    -buildmode=pie \
    -ldflags="-linkmode=external -s -w" \
    -o fusion-core \
    ./cmd/fusion-core
}

package() {
  cd "$srcdir/fusioncore"

  install -Dm755 fusion-core "$pkgdir/usr/bin/fusion-core"
}
