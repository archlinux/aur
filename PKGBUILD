# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-pulseaudio-plugin
pkgname=${_pkgname}-git
pkgver=0.3.0+2+gdea2be9
pkgrel=1
pkgdesc="Pulseaudio plugin for Xfce4 panel"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://goodies.xfce.org/projects/panel-plugins/xfce4-pulseaudio-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libpulse' 'libkeybinder3' 'libnotify')
makedepends=('intltool' 'git' 'xfce4-dev-tools' 'python') #for gdbus-codegen
optdepends=('pavucontrol: default pulseaudio mixer')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%.r*}")
source=("git://git.xfce.org/panel-plugins/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed "s/^${_pkgname}-//;s/-/+/g"
}

prepare() {
  cd $_pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$_pkgname"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --enable-keybinder \
    --enable-libnotify \
    --enable-maintainer-mode

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="${pkgdir}" install
}
