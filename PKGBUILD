# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=xkeyboard-config-gitshtrom
pkgver=20091219
pkgrel=1
pkgdesc="X keyboard configuration files"
arch=(i686 x86_64)
license=('custom')
url="http://www.freedesktop.org/wiki/Software/XKeyboardConfig"
depends=('xorg-xkb-utils')
makedepends=('intltool' 'pkgconfig')
provides=('xkbdata' 'xkeyboard-config')
replaces=('xkbdata' 'xkeyboard-config')
conflicts=('xkbdata' 'xkeyboard-config')

_gitname="xkeyboard-config" 
_gitbranch="dvorak-shtrom"
_gitroot="git://github.com/shtrom/xkeyboard-config"

build() {
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
          git --git-dir=${srcdir}/$_gitname/.git pull origin ${_gitbranch}|| exit 1
          msg "The local files are updated to ${_gitbranch}."
  else
          git clone $_gitroot || exit 1
          git --git-dir=${srcdir}/$_gitname/.git checkout -b ${_gitbranch} \
                origin/${_gitbranch} || exit 2
  fi

  # Speed up: only create the build tree if it didn't existe before
  # src/$_gitname-build should be manually removed before final builds
  if [ ! -d ${srcdir}/$_gitname-build ]; then
          cp -r $_gitname $_gitname-build
          cd $_gitname-build
          rm -rf .git
  else
          cd $_gitname-build
  fi

  msg "GIT checkout done or server timeout"

  ./autogen.sh --prefix=/usr \
              --with-xkb-base=/usr/share/X11/xkb \
              --with-xkb-rules-symlink=xorg \
              --enable-compat-rules=yes || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  rm -f "${pkgdir}/usr/share/X11/xkb/compiled" || return 1
  install -m755 -d "${pkgdir}/var/lib/xkb"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/" || return 1
}
