# Maintainer: robertfoster
pkgname=rivulet-engine-bin
pkgver=0.26.0 # renovate: datasource=github-releases depName=rivulet-kodi/rivulet-engine
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
            '68eec26421b691c9776654b87957907e1835d5c315ef08079cbdc8f65af95e00')
sha256sums_x86_64=('8d9136ed70fc5beebe086e107c4c93e22b28b400a22cfffd9a7fd0dbf26c4e76')
sha256sums_aarch64=('ee5cde1e52864bdecf4ed240e85f4c4fd5575db00667f6045d4756ec34acb935')
sha256sums_armv7h=('da4384f151cc29b98b6f796129b9e28c431e175170c12ab9bfa6a9eaa39327bf')

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
