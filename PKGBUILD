# Maintainer: SeerLite <seerlite@tuta.io>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xkeyboard-config-bbkt-git
pkgver=2.32.r5.gcadc98f5
pkgrel=1
pkgdesc="Upstream XKB configuration files patched with DreymaR's Big Bag mods (Colemak)"
arch=(any)
license=('custom')
url="https://github.com/SeerLite/xkeyboard-config-bbkt"
makedepends=('intltool' 'xorg-xkbcomp' 'libxslt' 'python' 'git' 'xorg-server-devel')
provides=('xkbdata' 'xkeyboard-config')
replaces=('xkbdata')
conflicts=('xkbdata' 'xkeyboard-config')
source=(git+https://github.com/SeerLite/xkeyboard-config-bbkt)
sha512sums=('SKIP')

pkgver() {
  cd xkeyboard-config-bbkt
  git describe --long | sed 's/^xkeyboard-config-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd xkeyboard-config-bbkt
  ./autogen.sh
  ./configure --prefix=/usr \
      --with-xkb-base=/usr/share/X11/xkb \
      --with-xkb-rules-symlink=xorg \
      --enable-compat-rules=yes
  make
 }
 
 package() { 
  cd xkeyboard-config-bbkt

  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/X11/xkb/compiled"

  install -m755 -d "${pkgdir}/var/lib/xkb"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
