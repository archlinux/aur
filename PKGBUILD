# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
pkgname=hd-idle-go
_pkgname=hd-idle
pkgver=1.16
pkgrel=1
pkgdesc='Hard Disk Idle Spin-Down Utility - enhanced reimplementation of hd-idle'
arch=('x86_64')
url="https://github.com/adelolmo/hd-idle"
license=('GPL3')
install=hd-idle-go.install
backup=(etc/default/hd-idle etc/logrotate.d/hd-idle)
provides=('hd-idle')
conflicts=('hd-idle')
optdepends=('logrotate')
makedepends=('go')
source=("https://github.com/adelolmo/hd-idle/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('9b01ecfcbee56b11b239850fcae666bb')

prepare(){
  cd "$_pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$_pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 debian/hd-idle.8 "$pkgdir"/usr/share/man/man8/hd-idle.8
  install -Dm644 debian/hd-idle.default "$pkgdir"/etc/default/hd-idle
  install -Dm644 debian/hd-idle.logrotate "$pkgdir"/etc/logrotate.d/hd-idle
  install -Dm644 debian/hd-idle.service "$pkgdir"/usr/lib/systemd/system/hd-idle.service
}
