# Maintainer: Matt Boswell <mordervomubel+archlinux at lockmail.us>
# Previous Maintainer: josephgbr

_pkgbasename=libbonobo
pkgname=lib32-$_pkgbasename
pkgver=2.32.1
pkgrel=2
pkgdesc="A set of language and system independant CORBA interfaces for creating reusable components (32 bit)"
arch=('x86_64')
license=('GPL' 'LGPL')
depends=('lib32-orbit2')
makedepends=('intltool' 'gcc-multilib' 'lib32-libxml2')
options=('!libtool')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgbasename}/${pkgver%.*}/${_pkgbasename}-${pkgver}.tar.bz2)
sha256sums=('9160d4f277646400d3bb6b4fa73636cc6d1a865a32b9d0760e1e9e6ee624976b')

prepare() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  sed -i "s#-DG_DISABLE_DEPRECATED##" activation-server/Makefile.in
}

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
  		--disable-static --libexecdir=/usr/lib32/bonobo \
  		--libdir=/usr/lib32 CC='gcc -m32'
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/usr/{bin,include,sbin,share} ${pkgdir}/etc
  rm -rf ${pkgdir}/usr/lib32/{bonobo-2.0,bonobo/{bonobo-activation-server,servers}} #executables
}
