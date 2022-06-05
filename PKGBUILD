# Contributor: Ben Alex <ben.alex@acegi.com.au>

pkgname=rtsptoweb
pkgver=2.3.0
pkgrel=1
pkgdesc='Streams RTSP into web browser formats (eg MSE, WebRTC, HLS)'
arch=(x86_64 aarch64 armv6h armv7h)
url=https://github.com/deepch/RTSPtoWeb
license=(MIT)
depends=(bash)
makedepends=(go)
backup=(etc/rtsptoweb.json)
install=rtsptoweb.install
source=('https://github.com/deepch/RTSPtoWeb/archive/refs/tags/v2.3.0.zip'
        'rtsptoweb.sysusers'
        'rtsptoweb.service')
sha512sums=('82dadf684b30179a700cc05e0b3c55bbe447f37ab36f8beda272602c12bb280a57da60b29881d59c2e8538dfdb220c2c8586e428addcd99d74fc67de6ce28d57'
            '629d448cafd07875518c42435fabb8d6ffb033c0f94cc874247c3020d9d2dae92b9445c16bfb8f1c249746257143ffe226aa242e8c2224cc1c16ab17eed0a104'
            '0ab48983470fb6aa8013cac9ebc1d258dbbeef6882814f02f66be6d4d167c63539c7c0185c673a3d4e540116538772289b3ece9dea576a161a5f984e5e921abc')

build() {
  cd RTSPtoWeb-${pkgver}
  go get
  go mod download
  GO111MODULE=on CGO_ENABLED=0 go build -a -o rtsp-to-web
}

package() {
  install -Dm644 rtsptoweb.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 rtsptoweb.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm755 RTSPtoWeb-${pkgver}/rtsp-to-web "${pkgdir}/usr/lib/rtsptoweb/rtsptoweb"
  install -Dm644 RTSPtoWeb-${pkgver}/config.json "${pkgdir}/etc/rtsptoweb.json"
  install -Dm644 RTSPtoWeb-${pkgver}/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  mkdir -p "${pkgdir}/usr/lib/rtsptoweb/web"
  cp -dr --no-preserve='ownership'  RTSPtoWeb-${pkgver}/web/* "${pkgdir}/usr/lib/rtsptoweb/web"
}
