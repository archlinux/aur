# Maintainer: cubercsl <2014cais01 at gmail dot com>
# Contributor: cokemine <aptx4561 at gmail dot com>

pkgname=nodestatus-client-go
_pkgname=${pkgname/-go}
pkgver=1.0.9
pkgrel=1
pkgdesc="The client of NodeStatus / Go Version"
provides=('nodestatus-client')
conflicts=('nodestatus-client' 'nodestatus-client-nodejs')
arch=('x86_64')
url="https://github.com/cokemine/nodestatus-client-go"
license=('MIT')
depends=('glibc')
optdepends=('vnstat: Use vnstat for traffic statistics')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cokemine/nodestatus-client-go/archive/v$pkgver.tar.gz"
        "$_pkgname.service"
        "config.conf.example")
sha512sums=('5c985e03d37df6abb41dc9768e7310628d36699c58deb12aa0b2b9d1ae90871e16e6311bf70fca2e50dfee3c513ff6644eda9408bf0225a297cb72e0ed8c2c31'
            '81c4e9344cc0f2205dd527924e93344118cc8d9a459500c9aba41896e2e577e781ebfb0e1b08039c084c8a5567b1f0cdfbb5eadb19ecf101b4e006e07b1437d1'
            '6df4553e0d89d208c3c9f82adc1fdd8c285e404344eaef96e6bddc45ccb66fe1832615ca3a1019d7930ce508b88284e6cf55a9bec7c3c4b324cc797b62a509ac')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  cd "$srcdir/$pkgname-$pkgver"
  go build -o $_pkgname ./...
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 ../config.conf.example "$pkgdir/etc/nodestatus/client/config.conf.example"
  install -Dm644 ../"$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
