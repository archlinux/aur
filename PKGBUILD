# $Id$
# Maintainer: Manuel Wildauer <m.wildauer@gmail.com>

pkgname=i3-wm-alternative
_pkgsourcename=i3
pkgver=4.14
pkgrel=1
pkgdesc='An improved dynamic tiling window manager'
arch=('i686' 'x86_64')
url='http://i3wm.org/'
license=('BSD')
replaces=('i3' 'i3bar')
groups=('i3')
depends=('xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-wm' 'xcb-util-xrm'
         'libev' 'yajl' 'startup-notification' 'pango' 'libxkbcommon-x11')
makedepends=('bison' 'flex')
optdepends=('dmenu: As menu.'
            'i3lock: For locking your screen.'
            'i3status: To display systeminformation with a bar.'
            'perl: i3-save-tree and i3-dmenu-desktop'
            'perl-anyevent-i3: Features like saving the layout.'
            'perl-json-xs: Features like saving the layout.')
options=('docs' '!strip')
source=("http://i3wm.org/downloads/${_pkgsourcename}-${pkgver}.tar.bz2"
        "http://i3wm.org/downloads/${_pkgsourcename}-${pkgver}.tar.bz2.asc")
md5sums=('ad134ada9972943b799feaddfb1f3121'
         'SKIP')
validpgpkeys=('424E14D703E7C6D43D9D6F364E7160ED4AC8EE1D') # Michael Stapelberg

build() {
  cd "$srcdir/$_pkgsourcename-$pkgver"
  
  ./configure --prefix=/usr --sysconfdir=/etc
  cd ${CARCH}-pc-linux-gnu
  # In order to avoid problems with bison use only a single process
  MAKEFLAGS="-j1"
  make CPPFLAGS+="-U_FORTIFY_SOURCE"
}

package() {
  cd "$srcdir/$_pkgsourcename-$pkgver/${CARCH}-pc-linux-gnu"
  make DESTDIR="$pkgdir/" install
  
  mkdir -p "${pkgdir}/usr/share/man/man1/"
  install -m644 ../man/*.1 "${pkgdir}/usr/share/man/man1/"

  install -Dm644 ../LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
