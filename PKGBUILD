# Maintainer: robertfoster
pkgname=stremio-server-go-bin
pkgver=0.21.0 # renovate: datasource=github-releases depName=M0Rf30/stremio-server-go
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
            '54852db559effa603fe7a6bd8064102b2d47710f29f378188b0005813abc0b93')
sha256sums_x86_64=('3c824dd75178308743c66582bc8fe526626837da0cd5c1a27240b424deffba2f')
sha256sums_aarch64=('12b250794a13e11f90cc2f9b6f6d414d53b35e77453ffc065693e0331378ac95')
sha256sums_armv7h=('3bd21e854563595b91ae69eac2d5cb0535b8213f10f89f4942c8894fdc6294e6')

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
