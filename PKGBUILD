# Contributor: Army
# Maintainer: Moritz Maxeiner <moritz@ucworks.org>
# Co-Maintainer: Stefan-Husmann@t-online.de

pkgname=dunst-git
_gitname=dunst
pkgver=r1048.5a9f37b
pkgrel=1
pkgdesc="a lightweight notification-daemon - git version"
arch=('i686' 'x86_64' 'armv7h')
url="https://dunst-project.org/"
license=('BSD')
depends=('libxinerama' 'libxss' 'pango' 'libnotify' 'gtk3')
if [ ! -e ${SRCDEST}/config.h ]; then
  depends+=('libxdg-basedir')
fi
makedepends=('git' 'perl')
provides=('dunst' 'notification-daemon' 'dunstify')
conflicts=('dunst' 'dunstify')
source=('git+https://github.com/dunst-project/dunst')
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_gitname}
  if [ -e ${srcdir}/config.h ]; then
    msg "Using custom config.h"
    cp ${srcdir}/config.h .
  fi
}

build() {
  cd ${_gitname}
  if [ -e ${SRCDEST}/config.h ]; then
    CFLAGS=-DSTATIC_CONFIG make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
    CFLAGS=-DSTATIC_CONFIG make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 dunstify
  else
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 dunstify
  fi
}

package() {
  cd ${srcdir}/${_gitname}
  if [ -e ${SRCDEST}/config.h ]; then
    CFLAGS=-DSTATIC_CONFIG make DESTDIR="${pkgdir}" PREFIX=/usr install
  else
    make DESTDIR="${pkgdir}" PREFIX=/usr install
  fi
  install -Dm755 dunstify "${pkgdir}"/usr/bin/dunstify
  install -Dm755 contrib/dunst_espeak.sh "${pkgdir}"/usr/bin/dunst_espeak.sh
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
