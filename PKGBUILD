# Maintainer: Luca Weiss <luca@z3ntu.xyz>
# Contributor: user20159 <https://aur.archlinux.org/account/user20159>
pkgname=matrix-sliding-sync
_basename=sliding-sync
pkgver=0.99.15
pkgrel=1
pkgdesc="Sliding sync proxy for matrix protocol, required for modern clients like Element X."
arch=('x86_64')
url="https://github.com/matrix-org/sliding-sync"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go>=1.19')
source=("${_basename}-${pkgver}.tar.gz::https://github.com/matrix-org/${_basename}/archive/v${pkgver}.tar.gz"
        "matrix-sliding-sync.service"
        "matrix-sliding-sync.conf")
sha256sums=('33daae057119e45573fb54d15d85dadf30e30151f744aa2caa84da745049b85d'
            '0185da8695331343e42bd41c07b9bf20906c8dda14d29de8386bad1fbc6bcafa'
            'f8b74879166b1fc857fcc66155bd7bfe74da717160b8e72971f90506669d822d')
backup=("etc/matrix-sliding-sync.conf")

build() {
  cd "$srcdir/${_basename}-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build ./cmd/syncv3/
}

package() {
  install -Dm755 "$srcdir/${_basename}-$pkgver/syncv3" "$pkgdir"/usr/bin/syncv3
  install -Dm644 matrix-sliding-sync.service "$pkgdir"/usr/lib/systemd/system/matrix-sliding-sync.service
  install -Dm600 matrix-sliding-sync.conf "$pkgdir"/etc/matrix-sliding-sync.conf
}
