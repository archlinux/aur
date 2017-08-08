# Maintainer: Mikołaj Baranowski <mikolajb@gmail.com>

pkgname=wallpaper-switch
pkgver=0.4
pkgrel=1
pkgdesc='Runs in backgroud and changes Gnome backgroud to NASA picture of the day.'
license=('MIT')
arch=('x86_64' 'i686')
url='https://github.com/mikolajb/wallpaper-switch'
depends=()
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mikolajb/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('aed1758ddcad789ea5b564c66e2c201d85a4e2122d068e70389a86fc2abdd883')

build() {
  msg2 'Settgin GOPATH'
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${srcdir}/gopath"
  export GOPATH="${srcdir}/gopath"

  msg2 'Getting go dep tool'
  go get github.com/golang/dep/cmd/dep

  mkdir -p "${GOPATH}/src/github.com/mikolajb"
  ln -sf "$(pwd)" "${GOPATH}/src/github.com/mikolajb/${pkgname}"
  cd "${GOPATH}/src/github.com/mikolajb/${pkgname}"

  msg2 'Fetching dependencies...'
  "$GOPATH/bin/dep" ensure

  msg2 'Compiling...'
  go build -o wallpaper-switch
}

package() {
  msg2 'Installing...'

  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/wallpaper-switch ${pkgdir}/usr/bin/wallpaper-switch
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/wallpaper-switch.service ${pkgdir}/usr/lib/systemd/user/wallpaper-switch.service
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/wallpaper-switch.timer ${pkgdir}/usr/lib/systemd/user/wallpaper-switch.timer
}
