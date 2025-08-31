
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname="tqm"
pkgver=1.17.0
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

sha512sums=('e6f34cb4c8b67cd14052fd1953daf0434478ef3f110449a56bf4e26ac24b5e525a43bf1935e53e81b8198c6bf70e65a36e8eff4ae3f9501452994071c1680a60')

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
