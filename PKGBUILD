_gitname=pihole-exporter
pkgname=prometheus-pihole-exporter
pkgver=1.2.0
pkgrel=1
pkgdesc="A Prometheus exporter for PI-Hole's Raspberry PI ad blocker."
arch=('any')
url="https://github.com/eko/pihole-exporter"
license=('MIT')
makedepends=('go')
source=("https://github.com/eko/pihole-exporter/archive/v$pkgver.tar.gz"
	    'prometheus-pihole-exporter.service'
	    )
sha256sums=('6e1b53647b99991ed934e5675283671c5c170a2bb3919d52e9b813997dd0896e'
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
