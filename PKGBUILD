# Maintainer: Thomas Wearmouth <tomwmth@pm.me>

pkgname='pelican-wings'
pkgver='1.0.0_rc.3'
pkgrel=1
pkgdesc="Pelican's server control daemon"
arch=('x86_64' 'aarch64')
url='https://github.com/pelican/wings'
license=('MIT')
depends=('docker')
makedepends=('go')
conflicts=('pterodactyl-wings' 'pterodactyl-wings-bin')
source=(
  "$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
  "$pkgname.service"
)
sha256sums=(
  'f527acbae9d650a959ef8ef831f9d99de19725199836a258a45e22a40ed45c49'
  'f1755e5ae48f8275ff3ff50bcae363f22a4010fa408d69f43625e3cc261a894b'
)

prepare() {
  cd "wings-${pkgver//_/-}"
  mkdir -p build/
}

build() {
  cd "wings-${pkgver//_/-}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go build -o build -ldflags "-linkmode=external -X github.com/pelican/wings/system.Version=${pkgver//_/-}" ./wings.go
}

package() {
  cd "wings-${pkgver//_/-}"
  install -d "$pkgdir/etc/pelican"
  install -D -m 755 build/wings "$pkgdir/usr/bin/wings"
  install -D -m 644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
