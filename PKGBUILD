# Maintainer: robertfoster
pkgname=stremio-server-go-bin
pkgver=0.20.1 # renovate: datasource=github-releases depName=M0Rf30/stremio-server-go
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
sha256sums_x86_64=('917be2db5a1115c4c4e083bba1918a202c70ed5e3e26556af59f89db99dc9dad')
sha256sums_aarch64=('329d0be5470a689bb0481b5be2c8c65cd202668cd713efcd9518482580cc0c94')
sha256sums_armv7h=('f7a46f0f2a765ddc7aca0cfec8801780619d51a3da2455dc33b6117e284c9a23')

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
