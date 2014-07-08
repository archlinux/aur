# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: David Scholl <djscholl@gmail.com>

pkgname=vtwm
pkgver=5.4.7
pkgrel=6
pkgdesc="A lightweight, customizable window manager with a virtual desktop"
arch=('i686' 'x86_64')
url="http://www.vtwm.org"
license=('MIT')
depends=('libxpm' 'libxmu' 'flex' 'rplay')
makedepends=('imake')
backup=('usr/share/X11/vtwm/system.vtwmrc')
source=("http://www.vtwm.org/downloads/${pkgname}-${pkgver}.tar.gz"
	"vtwm.desktop")
md5sums=('707f8d93b19b46fb3d036053be66288b'
         '7b4fcabdd4cf2b3a03683c37cb0fa82b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  (
	  head -n 26 add_window.c
	  head -n 20 applets.c
	  head -n 18 desktop.c
	  head -n 22 sound.c
	  cat contrib/nexpm/xpm.COPYRIGHT

  ) >COPYRIGHT
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  xmkmf
  make	CFLAGS="$CFLAGS" \
	LDOPTIONS="$LDFLAGS" \
	VTWMLIBDIR=/usr/share/X11/vtwm
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make VTWMLIBDIR=/usr/share/X11/vtwm DESTDIR="${pkgdir}" install
  install -Dm0644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  install -Dm0644 ../vtwm.desktop "${pkgdir}/usr/share/xsessions/vtwm.desktop"
}
