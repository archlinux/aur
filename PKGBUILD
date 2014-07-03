# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=trayer
pkgver=1.0
pkgrel=8
pkgdesc="A lightweight GTK2-based systray"
arch=('i686' 'x86_64')
url="https://gna.org/projects/fvwm-crystal/"
license=('GPL' 'MIT')
depends=('gtk2')
makedepends=('libxmu')
options=('!makeflags')
source=(http://download.gna.org/fvwm-crystal/trayer/${pkgver}/${pkgname}-${pkgver}.tar.gz
        trayer.diff manpage.diff)
sha1sums=('f2657693d196578e3776b0812952dfa1c25878cc'
          '63459c5f74b8cc137d8a16ab997200025225215c'
          'eb919fd4a6223034e59e7c9fd0de298d40c91242')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p0 -i ../trayer.diff
  patch -p1 -i ../manpage.diff
  sed -i 's/$(LIBS) $(OBJ) $(SYSTRAYOBJ)/$(OBJ) $(SYSTRAYOBJ) $(LIBS) -lX11/' Makefile
}

build() {
  cd ${pkgname}-${pkgver}
  make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX="${pkgdir}/usr" install
  install -D -m644 trayer.1 "${pkgdir}/usr/share/man/man1/trayer.1"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
