# Contributor: Tanguy Bouzéloc <the.zauron@gmail.com>
# Maintainer: Samantha Baldwin <fuhsaz 'plus' aur 'at' cryptic 'dot' li>

pkgname=ion3
pkgver=20090110
pkgrel=2
pkgdesc="Tiling tabbed window manager designed with keyboard users in mind"
arch=('i686' 'x86_64')
url="http://modeemi.fi/~tuomov/ion/"
license=('custom')
depends=('lua>=5.1' 'libx11' 'libxext' 'libsm' 'libice' 'libxcb' 'libxau' 'libxdmcp')
source=(http://tuomov.iki.fi/software/dl/ion-3-${pkgver}.tar.gz ion3.desktop)
md5sums=('1f17be1e87187b4af7de047187cc4930'
         'ea0c20a78da0f60463632b1149fdfeb8')

build() {
  cd ${srcdir}/ion-3-${pkgver}
  cp system.mk system.mk.new
  sed -e 's:PREFIX=/usr/local:PREFIX=/usr:' \
      -e 's:ETCDIR=$(PREFIX)/etc:ETCDIR=/etc:' \
      -e 's:$(PREFIX)/man:$(PREFIX)/share/man:' \
      -e 's:$(PREFIX)/doc:$(PREFIX)/share/doc:' \
      -e 's:#HAS_SYSTEM_ASPRINTF=1:HAS_SYSTEM_ASPRINTF=1:' \
      -e 's:INSTALL=.*$:INSTALL=install:' \
      -e 's:LUA_DIR=/usr/local:LUA_DIR=/usr:' \
      system.mk.new > system.mk

  if [ -n "${CFLAGS}" ] ; then
    cp system.mk system.mk.new
    sed -e "s:CFLAGS=-Os:CFLAGS=${CFLAGS}:" system.mk.new > system.mk
  fi
}

package() {
  cd ${srcdir}/ion-3-${pkgver}
  make ${MAKEFLAGS} || return 1
  make PREFIX=${pkgdir}/usr ETCDIR=${pkgdir}/etc/ion3 install || return 1
  install -D -m644 ${startdir}/ion3.desktop ${pkgdir}/etc/X11/sessions/ion3.desktop || return 1
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
