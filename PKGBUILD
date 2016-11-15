# Upstream Maintainer (i3-wm): Thorsten Töpper <atsutane-tu@freethoughts.de>
# Patch Contributor: Marius Muja <mariusm@cs.ubc.ca>
# Patch Contributor: mickael9 <mickael9@gmail.com>
# Patch Contributor: Esteve Varela Colominas <esteve.varela@gmail.com>
# Package Maintainer: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=i3-wm-iconpatch
_pkgsourcename=i3
pkgver=4.13
pkgrel=1
pkgdesc='An improved dynamic tiling window manager (with titlebar icon patch)'
arch=('i686' 'x86_64')
url='http://i3wm.org/'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm')
groups=('i3')
depends=('xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-wm' 'xcb-util-xrm' 
         'libev' 'yajl' 'startup-notification' 'pango' 'libxkbcommon-x11')
makedepends=('bison' 'flex' 'pkg-config')
optdepends=('dmenu: As menu.'
            'i3lock: For locking your screen.'
            'i3status: To display systeminformation with a bar.'
            'perl: i3-save-tree and i3-dmenu-desktop'
            'perl-anyevent-i3: Features like saving the layout.'
            'perl-json-xs: Features like saving the layout.')
options=('docs' '!strip')
source=("http://i3wm.org/downloads/${_pkgsourcename}-${pkgver}.tar.bz2"
        "http://i3wm.org/downloads/${_pkgsourcename}-${pkgver}.tar.bz2.asc"
        "iconsupport.patch")
sha1sums=('f4ca5c9023563f42be9c36b605c7a18d6f70114a'
          'SKIP'
          'cc94ae0e9faf639471e0a5c259cfbccab69f5f02')
validpgpkeys=('424E14D703E7C6D43D9D6F364E7160ED4AC8EE1D') # Michael Stapelberg

prepare() {

  cd "$srcdir/$_pkgsourcename-$pkgver"
  
  patch -p1 < "$srcdir/iconsupport.patch"

}

build() {

  cd "$srcdir/$_pkgsourcename-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc
  cd ${CARCH}-pc-linux-gnu

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
