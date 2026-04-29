# Maintainer: Tom Yang <tomyangsh at icloud dot com>

pkgname=cloudflarespeedtest
pkgver=2.3.5
pkgrel=1
license=('GPL-3.0-only')
pkgdesc="Cloudflare IP Batch Test Tool"
depends=('glibc')
makedepends=('go')
arch=('x86_64')
url="https://github.com/XIU2/CloudflareSpeedTest"
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('50cdb7fe8fba26b5e2564772605860a5b8843b797b7f8ab58626d5e1a493b00f')

prepare() {
  cd "CloudflareSpeedTest-$pkgver"
  sed -i -e 's@ip.txt@/usr/share/cloudflarespeedtest/ip.txt@g' \
         -e 's@ipv6.txt@/usr/share/cloudflarespeedtest/ipv6.txt@g' \
    main.go
  export GOPATH="$srcdir"
  go mod download -modcacherw
}
build() {
  cd "CloudflareSpeedTest-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
  go build -ldflags="-X main.version=v$pkgver -compressdwarf=false -linkmode external -bindnow" \
           -o $pkgname
}

package() {
  cd "CloudflareSpeedTest-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 ip.txt "$pkgdir"/usr/share/cloudflarespeedtest/ip.txt
  install -Dm644 ipv6.txt "$pkgdir"/usr/share/cloudflarespeedtest/ipv6.txt
}
