pkgname=gnss-share
pkgver=0.5
pkgrel=2
pkgdesc='An app for sharing GNSS location data, with support multiple clients and
loading/saving AGPS data.'
arch=(x86_64 aarch64)
url="https://gitlab.com/postmarketOS/gnss-share/"
license=('GPL3')
makedepends=('go')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('142de3c92ab3e67d1d16140ccf13fc5d49fff97fa944914a4d5d0cecfeab545aec83aeecdd9607991eb245796f219849e88afd63072dfc0d9f929f83a0a63c9d')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build \
  	-trimpath \
  	-buildmode=pie \
  	-mod=readonly \
  	-modcacherw \
  	-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
  	-o build ./cmd/...
    
}


package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm755 build/stmctl "$pkgdir"/usr/bin/stmctl
  install -m755 -d ${pkgdir}/etc/
  install -Dm644 gnss-share.conf "$pkgdir"/etc/
  install -m755 -d ${pkgdir}/usr/lib/systemd/system
  install -m644  systemd/gnss-share.service  ${pkgdir}/usr/lib/systemd/system
}

