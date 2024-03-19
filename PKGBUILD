# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='gonano'
pkgver=0.1.17
pkgrel=5
_pkgdate=1644501572
pkgdesc='Go language support for NANO — a digital currency'
arch=('aarch64' 'armv7h' 'x86_64')
url='https://github.com/hectorchu/gonano'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('gcc-libs' 'glibc' 'ocl-icd')
makedepends=('go')
options=('lto')
source=(
  "$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)

prepare() {
  cd "$pkgname-$pkgver"

  go mod tidy

  # mynano.ninja is offline
  # see e.g. https://github.com/hectorchu/gonano/issues/16
  export _old_endpoint='mynano.ninja/api/node'
  export _new_endpoint='rainstorm.city/api'

  printf 'Changing default RPC endpoint from “%s” to “%s”:\n' "$_old_endpoint" "$_new_endpoint"
  for _file in wallet/wallet.go cmd/root.go rpc/account_test.go; do
    printf ' · %s' "$_file"
    sed -i "s|$_old_endpoint|$_new_endpoint|g" "$_file"
    printf '\n'
  done
  printf 'Done!\n'
}

build() {
  cd "$pkgname-$pkgver"

  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "${CARCH:-unknown}" in
    'x86_64' | 'i386' )
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
    ;;
    * ) : pass ;;
  esac

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
  cd "$pkgname-$pkgver"

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
