# Maintainer: SeerLite <seerlite@tuta.io>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xkeyboard-config-bbkt-git
pkgver=2.31.r38.g80e6af3
pkgrel=1
pkgdesc="XKB configuration files with DreymaR's Big Bag patches applied (Colemak)"
arch=(any)
license=('custom')
url="https://forum.colemak.com/topic/1438-dreymars-big-bag-of-keyboard-tricks-linuxxkb-files-included"
makedepends=('intltool' 'xorg-xkbcomp' 'libxslt' 'python' 'git')
provides=('xkbdata' 'xkeyboard-config')
replaces=('xkbdata')
conflicts=('xkbdata' 'xkeyboard-config')
source=(git+https://github.com/SeerLite/xkeyboard-config)
sha512sums=('SKIP')

pkgver() {
  cd xkeyboard-config
  git describe --long | sed 's/^xkeyboard-config-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd xkeyboard-config
  ./autogen.sh
  ./configure --prefix=/usr \
      --with-xkb-base=/usr/share/X11/xkb \
      --with-xkb-rules-symlink=xorg \
      --enable-compat-rules=yes
  make
 }
 
 package() { 
  cd xkeyboard-config

  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/X11/xkb/compiled"

  install -m755 -d "${pkgdir}/var/lib/xkb"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
