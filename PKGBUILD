# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=gonano
pkgver=0.1.17
pkgrel=2
_pkgdate=1644501572
pkgdesc='Go language support for NANO — a digital currency'
arch=('x86_64' 'armv7h')
url='https://github.com/hectorchu/gonano'
license=('MIT')
depends=('ocl-icd')
makedepends=('go')
provides=('gonano')
conflicts=('gonano')
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

  install -Dm0755 gonano    "$pkgdir/usr/bin/gonano"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  'f744d520a4c8f6954dbc730f60292f26cb433d643b38a911b6e2347a8c480951'
)
sha512sums=(
  'e2b6743553b049311f7b451794d3e7e5c7b087bc2671cdfd3f67a07913949d2603ca50bd42485d37b11f50e7a031f985e7ed4cbd05d134d9ed067fc782942a18'
)
b2sums=(
  'd0a8e6b9e553b2318ff41e0f86d0e6e06342d9b0031dcc105e66d526670f198d7a2d70e4c45ebc7e307e216cef1f29bc275d3c230c1eea2f5dfbcf1476a021ce'
)

# eof
