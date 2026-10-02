# Maintainer: robertfoster
pkgname=stremio-server-go-bin
pkgver=0.19.0 # renovate: datasource=github-releases depName=M0Rf30/stremio-server-go
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
sha256sums_x86_64=('f4cf8fcdda103be1e3d26f14b4f867240cb7539b7321d2f5a9cc9e70b9791607')
sha256sums_aarch64=('cf515070e1217ff9437ccc2e794ad078cd66b61e2b103ef9cc3b1bde622af422')
sha256sums_armv7h=('b9f66aba47f50d21f35d895c90af221fa69aca1cbc24be6316e63a1429ba5bef')

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
