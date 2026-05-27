
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname="tqm"
pkgver=1.20.0
pkgrel=1
pkgdesc="CLI tool to manage your torrent client queues. Primary focus is on removing torrents that meet specific criteria."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/autobrr/tqm"
license=('GPL3')
makedepends=('go')
optdepends=(
  'deluge: torrent downloader'
  'qbittorrent: torrent downloader'
)

#backup=('etc/unpackerr/unpackerr.conf')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/autobrr/tqm/archive/v${pkgver}.tar.gz"
)

sha512sums=('09ddd0eb423b8f86cc8a957e0b588b6cd498c7497552001f1de488058f89a24c16767be8b92be08755f086ab7e21b73391fe778c4bbfda493339712bdbf0c488')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  go build -ldflags "-s -w -X github.com/autobrr/tqm/pkg/runtime.Version=${pkgver}" -o tqm ./cmd/tqm
}

package() {
  # Install the binary
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/tqm" "${pkgdir}/usr/bin/tqm"
}
