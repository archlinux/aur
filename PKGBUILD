# Maintainer: robertfoster
pkgname=stremio-server-go-bin
pkgver=0.18.0 # renovate: datasource=github-releases depName=M0Rf30/stremio-server-go
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
sha256sums=('04d37f62270f1ac9925d1717e84fab424048216871b81fd072d447211b46f683'
            '00f324787c8ab340d33255ffdb9d143c026467655a01d54a965293739e2396d0')
sha256sums_x86_64=('882c009a01c99a7d340ec0b4361ceca9ccd090bdde34137f37f64e6601a3b42d')
sha256sums_aarch64=('3f7bb120f74d3cbdcd6bbcd80b0e6a691ab4261292d6214ea490daac9ea9634a')
sha256sums_armv7h=('4c1ef1dab38dad649704ec54e37b6b7daffb1b8f48da6a6957ca71aab342e67d')

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
