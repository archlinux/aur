# Contributor: Ben Alex <ben.alex@acegi.com.au>

pkgname=rtsptoweb
pkgver=2.4.0
pkgrel=1
pkgdesc='Streams RTSP into web browser formats (eg MSE, WebRTC, HLS)'
arch=(x86_64 aarch64 armv6h armv7h)
url=https://github.com/deepch/RTSPtoWeb
license=(MIT)
depends=(bash)
makedepends=(go)
backup=(etc/rtsptoweb.json)
install=rtsptoweb.install
source=('https://github.com/deepch/RTSPtoWeb/archive/refs/tags/v2.4.0.zip'
        'rtsptoweb.sysusers'
        'rtsptoweb.service')
sha512sums=('f9471092f314027696733251a09853be1aa14a78aa56058c8dac567b5419309ef72f9db30141d734a6c5aee4b425747afd840367d32c22b988d4fef2750ca2e3'
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
