# Contributor: Army

# Maintainer: Moritz Maxeiner <moritz@ucworks.org>

pkgname=dunst-git
_gitname=dunst
pkgver=1.0.0.584.48de907
pkgrel=2
pkgdesc="a lightweight replacement for the notification-daemons provided by most desktop environments"
arch=('i686' 'x86_64')
url="http://www.knopwob.org/dunst"
license=('BSD')
depends=('libxinerama' 'libxss' 'pango' 'libnotify')

if [ ! -e ${SRCDEST}/config.h ]; then
  depends+=('libxdg-basedir')
fi

makedepends=('git' 'perl')
provides=("dunst" 'notification-daemon')
conflicts=("dunst")
source=('git://github.com/knopwob/dunst.git')
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver()
{
  cd ${srcdir}/${_gitname}
  echo $(git describe --abbrev=0 | sed 's|v||g').$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare()
{
  cd ${srcdir}/${_gitname}
  if [ -e ${SRCDEST}/config.h ]; then
    msg "Using custom config.h"
    cp ${SRCDEST}/config.h .
  fi
}

build()
{
  cd ${srcdir}/${_gitname}
  if [ -e ${SRCDEST}/config.h ]; then
    CFLAGS=-DSTATIC_CONFIG make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
	CFLAGS=-DSTATIC_CONFIG make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 dunstify
  else
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 dunstify
  fi
}

package()
{
  cd ${srcdir}/${_gitname}
  if [ -e ${SRCDEST}/config.h ]; then
    CFLAGS=-DSTATIC_CONFIG make DESTDIR="${pkgdir}" PREFIX=/usr install
  else
    make DESTDIR="${pkgdir}" PREFIX=/usr install
  fi

  install -Dm755 dunstify "${pkgdir}/usr/bin/dunstify"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
