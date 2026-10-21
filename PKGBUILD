# Maintainer: robertfoster
pkgname=rivulet-engine-bin
pkgver=0.27.2 # renovate: datasource=github-releases depName=rivulet-kodi/rivulet-engine
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
sha256sums=('098d596087516d030133260bd64f5b9a9ee5e31e39c52fda8117506710fa61b4'
            'e07465b3db3503130d0b2627e3b8cac759158bd62f560eddccad62d48221655b')
sha256sums_x86_64=('086792eaaf6ed2ea6a57ebb1f48ac0f8359d3a957a49bb78f53256c4efeb25b1')
sha256sums_aarch64=('ceb966588e0c28ca9bee76ea1b2ae6ded4bbc997b7c886a6f481afd273a42219')
sha256sums_armv7h=('1c7f16189967c5d5cd1313cec66b6d0b9a0fa574f153b2d67d49317bc25363ee')

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
