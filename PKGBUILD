
# Maintainer: Nicolas Lorin <androw95220@gmail.com>

pkgname=stayrtr
pkgver=0.6.4
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

sha512sums=('966ced5dad74319657fd522e42f1add56234c1af7c7f9458ec3df890ebe06c9a9256b3007059fdf8b1ca7d117976aebed1741567f8182a55936f6a12dabc101d'
            '5d8173ff4a97f3af2830aaab481239add40929810082ce31f83efdfa0127f2d5da4acbffc38332ee4481eb4acf168f122653f8138226e1eeca3f2fffe7185216'
            '7a4dc1b760059299c9fd13da9ab33706d8a571004001e708b00d95cec8729c2c3035fc6aa0b0c4ede52fb7906d983064661efb0e83144f7359fa75f28076638a')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export GOPATH="$srcdir"/go
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  # go build -o build ./cmd/...
  make \
    OUTPUT_STAYRTR=build/stayrtr \
    OUTPUT_RTRDUMP=build/rtrdump \
    OUTPUT_RTRMON=build/rtrmon \
    STAYRTR_VERSION=$pkgver \
    LDFLAGS='"-X main.version=$(STAYRTR_VERSION) -X main.buildinfos=$(BUILDINFOS)"' \
    build-stayrtr build-rtrdump build-rtrmon
}

check() {
  cd "$pkgname-$pkgver"
  make test
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
