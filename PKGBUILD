pkgname=proart-meter-git
pkgver=r3.5b67298
pkgrel=1
pkgdesc='LED temperature meter controller for ASUS ProArt AIOs'
arch=('x86_64')
url='https://github.com/cagriekin/proart-meter'
license=('MIT')
depends=('libusb' 'lm_sensors')
makedepends=('go' 'git' 'libusb')
provides=('proart-meter')
conflicts=('proart-meter')
backup=('etc/proart-meter/config.yaml')
source=("git+https://github.com/cagriekin/proart-meter.git")
sha256sums=('SKIP')

pkgver() {
  cd proart-meter
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd proart-meter
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o proart-meter ./cmd/proart-meter
}

package() {
  cd proart-meter
  install -Dm755 proart-meter "$pkgdir/usr/bin/proart-meter"
  install -Dm644 config.yaml "$pkgdir/etc/proart-meter/config.yaml"
  install -Dm644 proart-meter.service "$pkgdir/usr/lib/systemd/system/proart-meter.service"
}
