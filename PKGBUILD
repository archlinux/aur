
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname="tqm"
pkgver=1.14.0
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

sha512sums=('d25ff4ac41ffff642b73daaf85e4845dbc73bb879b52a20a4b0098f68292cbabc55baa9de72f00a65eb4c2c5c5d89fe2ed9c7d057aaccd4062cf3e9bb736a1e5')

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
