# Maintainer: robertfoster
pkgname=stremio-server-go-bin
pkgver=0.24.0 # renovate: datasource=github-releases depName=M0Rf30/stremio-server-go
pkgrel=1
pkgdesc="IPv6-capable, pure-Go drop-in for Stremio's streaming server with HLS transcoding and DLNA casting"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/M0Rf30/stremio-server-go"
license=('MIT')
depends=('glibc')
optdepends=(
  'ffmpeg: HLS transcoding and hardware-accelerated streaming'
  'yt-dlp: YouTube playback support (/yt endpoint)'
)
provides=("${pkgname%%-bin}")
conflicts=("${pkgname%%-bin}" "${pkgname%%-bin}-git")
options=('!strip')
backup=("etc/stremio-server/stremio-server.env")
_raw="https://raw.githubusercontent.com/M0Rf30/stremio-server-go/v${pkgver}/deploy/systemd"
source=(
  "stremio-server-${pkgver}.service::${_raw}/stremio-server.service"
  "stremio-server-${pkgver}.env::${_raw}/stremio-server.env"
)
source_x86_64=("${pkgname%%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/stremio-server_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname%%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/stremio-server_Linux_arm64.tar.gz")
source_armv7h=("${pkgname%%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/stremio-server_Linux_armv7.tar.gz")
sha256sums=('aede86d121b9be90fc31e051696bea95527711953c924b49ac7101fb4280cb40'
            'dfd3c12bd257647703cfb5964c22935e67ff4d0a6d655cec5e17c21c29878680')
sha256sums_x86_64=('8e73f7e42ca6ac100fa406a12f8f52a2c8531757c65eefe85b1e75c594914135')
sha256sums_aarch64=('a99b4d62b89d5df4b936478117a149ff7717e1d4389a19e2678378aeef066ed1')
sha256sums_armv7h=('6b9ff22119b67bcc99a814a1ba4eb779ce85439a33874c48394dc807cae9b803')

package() {
  # Install binary
  install -Dm755 "${srcdir}/stremio-server" \
    "${pkgdir}/usr/bin/stremio-server"

  # Install user systemd service (shipped in the upstream repo under deploy/systemd)
  install -Dm644 "${srcdir}/stremio-server-${pkgver}.service" \
    "${pkgdir}/usr/lib/systemd/user/stremio-server.service"

  # Install default environment file
  install -Dm644 "${srcdir}/stremio-server-${pkgver}.env" \
    "${pkgdir}/etc/stremio-server/stremio-server.env"

  # License and documentation
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
