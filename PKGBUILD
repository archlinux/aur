# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=icewm-git
pkgver=1.3.8
pkgrel=1
pkgdesc="A window manager designed for speed, usability, and consistency"
arch=('i686' 'x86_64')
url="http://icewm.org/"
license=('LGPL')
provides=('icewm')
conflicts=('icewm' 'icwm-cvs' 'icwm-ak' 'icwm-init0' 'icwm-testing' 'icwm-zstegi')
depends=('libxft' 'libxinerama' 'gdk-pixbuf2')
makedepends=('git' 'xorg-mkfontdir' 'linuxdoc-tools')
source=('git://github.com/bbidulock/icewm.git')
md5sums=('SKIP')

pkgver() {
  cd icewm
  git describe --tags --always | sed 's|icewm_||;s|[-_]|.|g;s|[.]g[a-f0-9]*$||'
}

prepare() {
  cd icewm
  sed -i VERSION \
    -e 's/^VERSION=.*$/VERSION='"$pkgver"'/'
  sed <icewm.spec.in >icewm.spec \
    -e 's/%%VERSION%%/'"$pkgver"'/'
  sed <icewm.lsm.in >icewm.lsm \
    -e 's/%%VERSION%%/'"$pkgver"'/' \
    -e 's/%%DATE%%/'"`date +%d%b%Y`"'/'
}

build() {
  cd icewm
  autoreconf -fiv
  ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-shaped-decorations --enable-gradients
  make all docs nls
}

package() {
  cd icewm
  make DESTDIR="$pkgdir" install install-man install-docs install-nls install-desktop
}

# vim: sw=2 et:

