# Maintainer: robertfoster
pkgname=rivulet-engine-bin
pkgver=0.27.0 # renovate: datasource=github-releases depName=rivulet-kodi/rivulet-engine
pkgrel=1
pkgdesc="IPv6-capable, pure-Go drop-in for Stremio's streaming server with HLS transcoding and DLNA casting"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/rivulet-kodi/rivulet-engine"
license=('MIT')
depends=('glibc')
optdepends=(
  'ffmpeg: HLS transcoding and hardware-accelerated streaming'
  'yt-dlp: YouTube playback support (/yt endpoint)'
)
provides=("${pkgname%%-bin}")
conflicts=("${pkgname%%-bin}" "${pkgname%%-bin}-git" 'stremio-server-go-bin')
replaces=('stremio-server-go-bin')
options=('!strip')
backup=("etc/rivulet-engine/rivulet-engine.env")
_raw="https://raw.githubusercontent.com/rivulet-kodi/rivulet-engine/v${pkgver}/deploy/systemd"
source=(
  "rivulet-engine-${pkgver}.service::${_raw}/rivulet-engine.service"
  "rivulet-engine-${pkgver}.env::${_raw}/rivulet-engine.env"
)
source_x86_64=("${pkgname%%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/rivulet-engine_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname%%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/rivulet-engine_Linux_arm64.tar.gz")
source_armv7h=("${pkgname%%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/rivulet-engine_Linux_armv7.tar.gz")
sha256sums=('4be5cac8078c2a1ef66b8412e3d266db4230ba7cd2abb85728eb04ad6c3a6c56'
            'ae5a48081960c4cb08b2c1ba005b817d8e0ddf18afcc00857de8b4cf75e4167f')
sha256sums_x86_64=('f4e4683e27595514b06e03fc79ed4397a726d9ea2f21d6806a5fc57f353934d0')
sha256sums_aarch64=('bc0df2af190d0489dae2fa6a3b9e3454b6a796896950f9f4431ab72785f88a94')
sha256sums_armv7h=('5da815937d33c9441e00b3ad2913d070f493cb332a81953b3bce21d6acd418cb')

package() {
  # Install binary
  install -Dm755 "${srcdir}/rivulet-engine" \
    "${pkgdir}/usr/bin/rivulet-engine"

  # Install user systemd service (shipped in the upstream repo under deploy/systemd)
  install -Dm644 "${srcdir}/rivulet-engine-${pkgver}.service" \
    "${pkgdir}/usr/lib/systemd/user/rivulet-engine.service"

  # Install default environment file
  install -Dm644 "${srcdir}/rivulet-engine-${pkgver}.env" \
    "${pkgdir}/etc/rivulet-engine/rivulet-engine.env"

  # License and documentation
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
