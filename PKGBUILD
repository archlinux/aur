
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname="unpackerr"
pkgver=0.10.1
pkgrel=1
pkgdesc="A daemon that checks for completed downloads and extracts them so Radarr, Sonarr and/or Lidarr may import them."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/davidnewhall/unpackerr"
license=('MIT')
makedepends=('go')
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

sha512sums=('5af1c34e72370f19e57a5f217311d88e60573f9c188920d07193cacbffe61edb1d07d688f10633981de2180c59f82845d86f27f6cc870728b8f604e6f7b213fa'
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
