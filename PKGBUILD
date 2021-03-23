
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname="unpackerr"
pkgver=0.9.0
pkgrel=1
pkgdesc="A daemon that checks for completed downloads and extracts them so Radarr, Sonarr and/or Lidarr may import them."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/davidnewhall/unpackerr"
license=('MIT')
depends=('go')
optdepends=(
  'transmission-cli: torrent downloader (CLI and daemon)'
  'transmission-gtk: torrent downloader (GTK+)'
  'transmission-qt: torrent downloader (Qt)'
  'deluge: torrent downloader'
  'rtorrent: torrent downloader'
)

backup=('etc/unpackerr/unpackerr.conf')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/davidnewhall/unpackerr/archive/v${pkgver}.tar.gz"
  'unpackerr.service'
  'unpackerr.sysusers'
)

sha512sums=('2d5082139999ff42f17615aedc296d94c626c64567f798a967fab37df5ad06db726b55f22936fddf91a3459a47fea222453aeabe97ac49948adbf322c53c9b0f'
            '54017fc67dc86233c01fcf9b6a46c9758509111442782e67c2356b8ec5fc062abf2a6a45df62abe13d789b9933a00e2bfedbfdb6ac9eb57c3e03b43334c96676'
            '1607677947bb788eb9a7bdc37e85c10632888d476d393493013dbdb3924f805adae9b6c6f31e60800ed95a9bed7c1e8ee8a48ebdaacd60c52e355054f62e0237')

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
  go build -o unpackerr
}

package() {
  # Install the binary
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/unpackerr" "${pkgdir}/usr/bin/unpackerr"

  # Create the configuration folder and install configuration file(s).
  mkdir -p "${pkgdir}/etc/unpackerr"
  install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/examples/unpackerr.conf.example" "${pkgdir}/etc/unpackerr/unpackerr.conf"
  install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/examples/unpackerr.conf.example" "${pkgdir}/etc/unpackerr/unpackerr.conf.example"

  # Install the various systemd files.
  install -D -m 644 "${srcdir}/unpackerr.service" "${pkgdir}/usr/lib/systemd/system/unpackerr.service"
  install -D -m 644 "${srcdir}/unpackerr.sysusers" "${pkgdir}/usr/lib/sysusers.d/unpackerr.conf"
}
