_gitname=pihole-exporter
pkgname=prometheus-pihole-exporter
pkgver=0.3.0
pkgrel=1
pkgdesc="A Prometheus exporter for PI-Hole's Raspberry PI ad blocker."
arch=('any')
url="https://github.com/eko/pihole-exporter"
license=('unknown')
makedepends=('go')
source=("https://github.com/eko/pihole-exporter/archive/v$pkgver.tar.gz"
	    'prometheus-pihole-exporter.service'
	    )
sha256sums=('09c7ea7ef541f7d5d61838e1f95cbad8b422288534f8565b6632cadcbc9d815f'
            '80250d75f04a788c4194ca606dc95172df477c99b745e5a0e0b960f8a62657b5'
            )

prepare(){
  cd "$_gitname-$pkgver"
  export GOPATH="${srcdir}/gopath"

  go get -d .
}

build() {
  cd "$_gitname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o $pkgname .
}

package() {
  install -Dm644 $pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service

  cd "$_gitname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
