# Maintainer: Nicolas Lorin <androw95220@gmail.com>

pkgname=stayrtr
pkgver=0.4.0
pkgrel=1
pkgdesc="Simple RPKI-To-Router server. (Hard fork of GoRTR)"
arch=('x86_64')
url='https://github.com/bgp/stayrtr'
license=('BSD-3-Clause')
depends=()
makedepends=('go')
conflicts=('gortr')
backup=('etc/default/stayrtr')
source=(
  "stayrtr-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  'stayrtr.service'
  'stayrtr.sysusers'
)

sha512sums=('cc994ab46dbd1080ea6ca26123e9054c5207b459c1d1fe7dec035da824eeef19286584975a51fa30c11c7a40e308cadc09330dbc0f48f5e37a4a37368f67cfa9'
            '5d8173ff4a97f3af2830aaab481239add40929810082ce31f83efdfa0127f2d5da4acbffc38332ee4481eb4acf168f122653f8138226e1eeca3f2fffe7185216'
            '7a4dc1b760059299c9fd13da9ab33706d8a571004001e708b00d95cec8729c2c3035fc6aa0b0c4ede52fb7906d983064661efb0e83144f7359fa75f28076638a')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir"/go
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  install -Dm755 "${srcdir}/stayrtr-${pkgver}/build/stayrtr" "${pkgdir}/usr/bin/stayrtr"
  install -Dm755 "${srcdir}/stayrtr-${pkgver}/build/rtrdump" "${pkgdir}/usr/bin/rtrdump"
  install -Dm755 "${srcdir}/stayrtr-${pkgver}/build/rtrmon" "${pkgdir}/usr/bin/rtrmon"
  install -Dm644 "${srcdir}/stayrtr-${pkgver}/package/stayrtr.env" "${pkgdir}/etc/default/stayrtr"
  install -Dm644 "${srcdir}/stayrtr.service" "${pkgdir}/usr/lib/systemd/system/stayrtr.service"
  install -Dm644 "${srcdir}/stayrtr.sysusers" "${pkgdir}/usr/lib/sysusers.d/stayrtr.conf"
  install -Dm644 "${srcdir}/stayrtr-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
