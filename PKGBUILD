# Maintainer: Mikołaj Baranowski <mikolajb@gmail.com>

pkgname=wallpaper-switch
pkgver=0.1
pkgrel=1
pkgdesc='Runs in backgroud and changes Gnome backgroud to NASA picture of the day.'
license=('MIT')
arch=('x86_64' 'i686')
url='https://github.com/mikolajb/wallpaper-switch'
depends=()
makedepends=('go')
source=("${pkgname}::git+http://github.com/mikolajb/wallpaper-switch")
sha256sums=('SKIP')
_gotoml=github.com/BurntSushi/toml
_gogouuid=github.com/nu7hatch/gouuid
_gohtml=golang.org/x/net/html

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  msg2 'Compiling...'

  GOPATH="$srcdir" go get -fix -v -x ${_gotoml}/
  GOPATH="$srcdir" go get -fix -v -x ${_gogouuid}/
  GOPATH="$srcdir" go get -fix -v -x ${_gohtml}/

  cd ${srcdir}/${pkgname}/
  GOPATH="$GOPATH:$srcdir" go build -o wallpaper-switch
}

# check() {
#   GOPATH="$GOPATH:$srcdir" go test -v -x ${_gotoml}/...
#   GOPATH="$GOPATH:$srcdir" go test -v -x ${_gogouuid}/...
#   GOPATH="$GOPATH:$srcdir" go test -v -x ${_gohtml}/...
# }

package() {
  msg2 'Installing...'

  install -Dm755 ${srcdir}/${pkgname}/wallpaper-switch ${pkgdir}/usr/bin/wallpaper-switch
  install -Dm644 ${srcdir}/${pkgname}/wallpaper-switch.service ${pkgdir}/usr/lib/systemd/user/wallpaper-switch.service
  install -Dm644 ${srcdir}/${pkgname}/wallpaper-switch.timer ${pkgdir}/usr/lib/systemd/user/wallpaper-switch.timer
}
