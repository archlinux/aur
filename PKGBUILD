# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=gonano
pkgver=0.1.17
pkgrel=3
_pkgdate=1644501572
pkgdesc='Go language support for NANO — a digital currency'
arch=('aarch64' 'armv7h' 'x86_64')
url='https://github.com/hectorchu/gonano'
license=('MIT')
depends=('gcc-libs' 'glibc' 'ocl-icd')
makedepends=('go')
options=('lto')
source=(
  "$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)

build() {
  cd "$pkgname-$pkgver" || exit 1

  # https://wiki.archlinux.org/title/Go_package_guidelines
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  # »unrecognized import path "launchpad.net/gocheck":
  #  GOVCS disallows using bzr for public launchpad.net/gocheck;
  #  see 'go help vcs'«
  export GOVCS='*:all'

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.version=$pkgver -X main.date=$_pkgdate" \
    -mod=readonly \
    -modcacherw \
     .
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -vDm0755 gonano    "$pkgdir/usr/bin/gonano"
  install -vDm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -vDm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  'f744d520a4c8f6954dbc730f60292f26cb433d643b38a911b6e2347a8c480951'
)
b2sums=(
  'd0a8e6b9e553b2318ff41e0f86d0e6e06342d9b0031dcc105e66d526670f198d7a2d70e4c45ebc7e307e216cef1f29bc275d3c230c1eea2f5dfbcf1476a021ce'
)

# eof
