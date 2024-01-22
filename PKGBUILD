
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname="unpackerr"
pkgver=0.13.1
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

sha512sums=('7a707d71ed53dd5189f71e1a921264c67c72bc6ec2ce7812d0aa87a8da336b7047a92d85cd966cc28782ef637650d6fb2d694b2f199cc68467d8c3feefb6c246'
            '303dad17d17ff073fa0e4517c09b437f6269646c062507552d5de0067a36a0685b2b10c9333c4b4d719d1e76807b26546f66aba8171dc1d0dc69e3685be23967'
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
