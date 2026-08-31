# Maintainer: David Newhall II <captain at golift dot io>
# Maintainer: Donald Webster <fryfrog at gmail dot com>

pkgname='unpackerr'
pkgver=0.16.1
pkgrel=1
pkgdesc='Extracts downloads so Radarr, Sonarr, Lidarr or Readarr may import them.'
url='https://unpackerr.zip'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'pentium4')
license=('MIT')
provides=('unpackerr')
makedepends=('go' 'gzip')
optdepends=(
  'transmission-cli: torrent downloader (CLI and daemon)'
  'transmission-gtk: torrent downloader (GTK+)'
  'transmission-qt: torrent downloader (Qt)'
  'deluge: torrent downloader'
  'rtorrent: torrent downloader'
)
backup=('etc/unpackerr/unpackerr.conf')
source=("unpackerr-0.16.1.tar.gz::https://github.com/Unpackerr/unpackerr/releases/download/v0.16.1/unpackerr-0.16.1.tar.gz")
sha256sums=('a46f2148b4a6b8e8814ea60a2845bc2f296561814cd0cf7504526518739217e0')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
}

build() {
  cd "${pkgname}-${pkgver}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  LDFLAGS="-w -s -X golift.io/version.Version=${pkgver} \
    -X golift.io/version.Revision=${pkgrel} \
    -X golift.io/version.BuildDate=$(date -u +%Y-%m-%dT%H:%M:00Z) \
    -X golift.io/version.BuildUser=$(whoami || echo unknown) \
    -X \"golift.io/version.Branch=${pkgver} [aur]\""
  go build -o unpackerr -ldflags "${LDFLAGS}" .
  go run github.com/davidnewhall/md2roff@v0.0.1 --manual unpackerr --version "${pkgver}" --date "$(date -u +%Y-%m-%d)" examples/MANUAL.md
  go run github.com/davidnewhall/md2roff@v0.0.1 --manual unpackerr --version "${pkgver}" --date "$(date -u +%Y-%m-%d)" README.md
  gzip -9nf examples/MANUAL
  mv examples/MANUAL.gz unpackerr.1.gz
}

package() {
  cd "${pkgname}-${pkgver}"
  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/share/doc/${pkgname}" "${pkgdir}/etc/${pkgname}"
  install -D -m 755 unpackerr "${pkgdir}/usr/bin/unpackerr"
  install -D -m 644 examples/unpackerr.conf.example "${pkgdir}/etc/unpackerr/unpackerr.conf"
  install -D -m 644 examples/unpackerr.conf.example "${pkgdir}/etc/unpackerr/unpackerr.conf.example"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/unpackerr/LICENSE"
  install -D -m 644 examples/MANUAL.html "${pkgdir}/usr/share/doc/${pkgname}/unpackerr-manual.html"
  install -D -m 644 README.html "${pkgdir}/usr/share/doc/${pkgname}/README.html"
  install -D -m 644 examples/docker-compose.yml "${pkgdir}/usr/share/doc/${pkgname}/docker-compose.yml"
  install -D -m 644 examples/unpackerr.conf.example "${pkgdir}/usr/share/doc/${pkgname}/unpackerr.conf.example"
  install -D -m 644 unpackerr.1.gz "${pkgdir}/usr/share/man/man1/unpackerr.1.gz"
  install -D -m 644 init/systemd/unpackerr.service "${pkgdir}/usr/lib/systemd/system/unpackerr.service"
  echo 'u unpackerr - "unpackerr daemon"' > unpackerr.sysusers
  install -D -m 644 unpackerr.sysusers "${pkgdir}/usr/lib/sysusers.d/unpackerr.conf"
  install -D -m 644 init/systemd/unpackerr.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/unpackerr.conf"
}
