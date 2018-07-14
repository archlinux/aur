# Maintainer: Clar Charr <clar@charr.xyz>

pkgname=miniflux
pkgver=2.0.9
pkgrel=1
pkgdesc='Minimalist Feed Reader'
arch=('x86_64')
url='https://miniflux.app'
license=('Apache')
depends=('postgresql')
makedepends=('go' 'godep')
conflicts=('miniflux-git')
backup=('etc/miniflux.conf')
source=(
  https://github.com/miniflux/miniflux/archive/${pkgver}.tar.gz
  miniflux.conf
  miniflux.service
  miniflux.sysusers
)
sha256sums=(
  1c3340452153fd433ef9e03468f60d46da70bfb28c01e777b068e4ff741250b9
  1247a3cfe0307f5f1bb070e616f57344d8f16201070ecf7dda243b3fa1fbd8b8
  36b0204756474c3a4124fa3d3188b0a117aae24771b9737fc6dc87aea8ec5076
  d1ce5acf1e633b04b92bf9330bd64d97c19d8f8d39c7bb4b64e11a96be4b73e2
)

prepare() {
  mkdir -p "${srcdir}/src/github.com/miniflux"
  ln -s "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/miniflux/${pkgname}"
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  GOPATH="${srcdir}" go get github.com/tdewolff/minify
  GOPATH="${srcdir}" PATH="${PATH}:${GOPATH}/bin/" make linux
}

package() {
  install -Dm644 "${srcdir}/miniflux.conf" "${pkgdir}/etc/miniflux.conf"
  install -Dm644 "${srcdir}/miniflux.service" "${pkgdir}/usr/lib/systemd/system/miniflux.service"
  install -Dm644 "${srcdir}/miniflux.sysusers" "${pkgdir}/usr/lib/sysusers.d/miniflux.conf"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/miniflux-linux-amd64" "${pkgdir}/usr/bin/miniflux"
}

