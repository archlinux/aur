# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Maintainer: stefan-husmann@t-online.de
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=sawfish
pkgver=1.13.0
pkgrel=2
pkgdesc="An extensible window manager using a Lisp-based scripting language"
arch=('i686' 'x86_64')
url="http://sawfish.wikia.com/wiki/Main_Page"
license=('GPL')
depends=('libsm' 'rep-gtk' 'hicolor-icon-theme' 'gdk-pixbuf-xlib>=2.24.0')
source=(https://github.com/SawfishWM/sawfish/archive/refs/tags/sawfish-${pkgver}.zip arch_poweroff_defaults.patch NEWS)
sha256sums=(039a61311a1fc9290d5567aeff7ba9ff7029e7ecbd4be01d641691743af4453a
            34092f761f89fa3db90841e3fd270f42c06f769c53ed524deccdf48f204f611e
	    e0bbb48147ece401fe92341968ef2e978e1a32642caa27f191f7646995d0df76)
options=('!libtool')


prepare() {
  cd sawfish-${pkgname}-${pkgver}
  patch -p1 < "$srcdir"/arch_poweroff_defaults.patch
}

build() {
  cd sawfish-${pkgname}-${pkgver}
  ./autogen.sh
  # can compile with either of -std= c99 c11 c17
  # but current default c23 needs (minor) code changes which might occur upstream
  CFLAGS+=" -fcommon -std=c17" ./configure --prefix=/usr --libexecdir=/usr/lib 
  make
}

package() {
  cd sawfish-${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 sawfish.el "$pkgdir"/usr/share/emacs/site-lisp/sawfish.el
  install -Dm644 lisp/sawfish/wm/tile/readme.org \
    "$pkgdir"/usr/share/doc/$pkgname/readme.tiling.org
}
