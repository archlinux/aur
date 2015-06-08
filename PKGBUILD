# $Id$
# Maintainer: Realex
# Based on cinnamon-settings-daemon PKGBUILD

_pkgname=cinnamon-settings-daemon
pkgname=${_pkgname}-git
pkgver=221.ec2ca3a
pkgrel=1
pkgdesc="The Cinnamon Settings daemon"
arch=('i686' 'x86_64')
license=('GPL')
depends=('cinnamon-desktop-git'  'libibus' 'libcanberra-pulse' 'librsvg' 'nss' 'pulseaudio-alsa' 'upower' 'libnotify' 'libwacom' 'libgnomekbd')
makedepends=('intltool' 'docbook-xsl' 'gnome-common' 'cinnamon-desktop-git' 'git')
options=('!emptydirs' '!libtool')
conflicts=("${_pkgname}")
install=${pkgname}.install
url="http://cinnamon.linuxmint.com/"
source=(${_pkgname}::git+https://github.com/linuxmint/cinnamon-settings-daemon.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd ${srcdir}/${_pkgname}

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/${_pkgname} --disable-static --enable-systemd

  #https://bugzilla.cinnamon.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd ${srcdir}/${_pkgname}
  make DESTDIR="$pkgdir" install
}
