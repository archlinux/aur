# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Nigel Kukard <nkukard@LBSD.net>
# Contributor: Zhaofeng Li <hello@zhaofeng.li>

pkgname=gortr
pkgver=0.14.7
pkgrel=7
pkgdesc="The RPKI-to-Router server used at Cloudflare"
arch=('x86_64')
url='https://github.com/cloudflare/gortr'
license=('BSD')
depends=()
makedepends=('go')
backup=('etc/conf.d/gortr')
source=(
  "gortr-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  'gortr.env'
  'gortr.service'
  'gortr.sysusers'
)

sha512sums=('02cd38da2af1af11a3384578c81cc07098b6e0a5abdf17cd70dcc7256c7a0ec687a60d590e7ce7a133faa28d0a768ef206c7a59672a10998e52b8a2dc2752a44'
            '3b48c5aa6e4ee074df4e7087f664a114f9fd9b5d586f17cad9cc5af6a6bff788f46012dbec37b5c08e5b858bcbe7f59d7fc65e013104a57a5606e1c3d0b9ee61'
            'c5a1bfb1957ef42d73811d087151c565beaec46b0d533dcd27661304e26e394040f0c4f3d75b1eedd6728e3c4a27c07db5a626cb8d8e8fe99bc6851f858df955'
            'be46844e548f7eaf46c7f7b07db42b192c88f7c2cb980ab0dca952838ad0c80854f21414f12d47f62f51128ddd5d971e243a8846eece604228c2a4d13d64f1d7')

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
  install -Dm755 "${srcdir}/gortr-${pkgver}/build/gortr" "${pkgdir}/usr/bin/gortr"
  install -Dm755 "${srcdir}/gortr-${pkgver}/build/rtrdump" "${pkgdir}/usr/bin/rtrdump"
  install -Dm755 "${srcdir}/gortr-${pkgver}/build/rtrmon" "${pkgdir}/usr/bin/rtrmon"
  install -Dm644 "${srcdir}/gortr.env" "${pkgdir}/etc/conf.d/gortr"
  install -Dm644 "${srcdir}/gortr.service" "${pkgdir}/usr/lib/systemd/system/gortr.service"
  install -Dm644 "${srcdir}/gortr.sysusers" "${pkgdir}/usr/lib/sysusers.d/gortr.conf"
  install -Dm644 "${srcdir}/gortr-${pkgver}/cmd/gortr/cf.pub" "${pkgdir}/usr/lib/${pkgname}/cf.pub"
  install -Dm644 "${srcdir}/gortr-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
