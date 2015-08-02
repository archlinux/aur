# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Adam 'battlemidget' Stokes <adam.stokes@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
pkgname=eterm
_pkgname=Eterm
pkgver=0.9.6
pkgrel=3
pkgdesc="A vt102 terminal emulator intended as a replacement for xterm."
arch=('i686' 'x86_64')
url="http://eterm.org/"
license=('custom')
depends=('libast>=0.7' 'libxmu' 'libxres' 'libutempter')
options=('!libtool')
provides=('esetroot')
conflicts=('esetroot')
install=${pkgname}.install
source=(http://eterm.org/download/${_pkgname}-${pkgver}.tar.gz
	http://eterm.org/download/${_pkgname}-bg-${pkgver}.tar.gz)
md5sums=('90e424584c22d4050496874d14f78bb1'
         'e8c6567b13d7fb760bded56c1d1a181d')

build() {
  cd ${_pkgname}-${pkgver}
  CONF=""
  [ "${CARCH}" = "x86_64" ] && CONF="--disable-mmx"
  ./configure --prefix=/usr --mandir=/usr/share/man \
    --enable-trans --enable-utmp \
    --enable-multi-charset=utf-8 \
    --enable-xim --with-theme-update \
    --with-backspace=bs --without-terminfo \
    --enable-multi-charset ${CONF}
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cd ../bg
  install -dm755 "${pkgdir}/usr/share/${_pkgname}/pix/tile"
  install -m644 tile/* "${pkgdir}/usr/share/${_pkgname}/pix/tile"
  install -dm755 "${pkgdir}/usr/share/${_pkgname}/pix/scale"
  install -m644 scale/* "${pkgdir}/usr/share/${_pkgname}/pix/scale"
}

