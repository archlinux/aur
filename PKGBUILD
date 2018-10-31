# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: David Scholl <djscholl@gmail.com>

pkgname=vtwm
pkgver=5.5.0
pkgrel=1
pkgdesc="A lightweight, customizable window manager with a virtual desktop"
arch=('i686' 'x86_64')
url="http://www.vtwm.org"
license=('MIT')
depends=('libxpm' 'libxmu' 'libxft' 'libxinerama' 'libxrandr' 'esound' 'rplay')
optdepends=('m4: for config file preprocessing')
makedepends=('imake')
backup=('usr/share/X11/vtwm/system.vtwmrc')
options=('!makeflags')
source=("http://sourceforge.net/projects/vtwm/files/${pkgname}-${pkgver}.tar.gz"
	"vtwm.desktop")
md5sums=('703cfddc08012230bbe4edb1edd1f141'
         '7b4fcabdd4cf2b3a03683c37cb0fa82b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -e "/^AC_INIT/s|^.*$|AC_INIT([vtwm],[$pkgver], [mailto:vtwm-hackers@lists.sandelman.ca],[vtwm])|" \
    -i configure.ac
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
  aclocal
  automake --foreign --add-missing
  autoconf
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -Dm0644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  install -Dm0644 ../vtwm.desktop "${pkgdir}/usr/share/xsessions/vtwm.desktop"
}
