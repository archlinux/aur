# Maintainer: Mikołaj Baranowski <mikolajb@gmail.com>

pkgname=wallpaper-switch
pkgver=0.3
pkgrel=1
pkgdesc='Runs in backgroud and changes Gnome backgroud to NASA picture of the day.'
license=('MIT')
arch=('x86_64' 'i686')
url='https://github.com/mikolajb/wallpaper-switch'
depends=()
makedepends=('go' 'glide')
source=("${pkgname}-${pkgver}::https://github.com/mikolajb/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ef78605575b5466d4e0974a44efbb3b0c53542cbaa559cf9d3b01776e083da24')

build() {
  msg2 'Settgin GOPATH'
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  mkdir -p "${GOPATH}/src/github.com/mikolajb"
  ln -sf "$(pwd)" "${GOPATH}/src/github.com/mikolajb/${pkgname}"
  cd "${GOPATH}/src/github.com/mikolajb/${pkgname}"

  msg2 'Fetching dependencies...'
  glide install

  msg2 'Compiling...'
  go build -o wallpaper-switch
}

package() {
  msg2 'Installing...'

  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/wallpaper-switch ${pkgdir}/usr/bin/wallpaper-switch
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/wallpaper-switch.service ${pkgdir}/usr/lib/systemd/user/wallpaper-switch.service
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/wallpaper-switch.timer ${pkgdir}/usr/lib/systemd/user/wallpaper-switch.timer
}
