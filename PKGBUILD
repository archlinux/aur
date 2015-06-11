# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=g15mpd
pkgver=1.0.0
pkgrel=3
pkgdesc="A simple frontend for the Media Player Daemon, for use with G15Daemon."
arch=('i686' 'x86_64')
url="http://www.g15tools.com/"
license=('GPL')
depends=('g15daemon' 'libmpd' 'libxtst')
makedepends=('autoconf' 'automake' 'gcc' 'libtool' 'make' 'patch' 'pkg-config')
options=('!libtool')
source=(http://downloads.sourceforge.net/g15daemon/${pkgname}-${pkgver}.tar.bz2 \
	${pkgname}-libmpdheader.patch)
md5sums=('20f44c69b121750c27879e04c2cdff60' '6392a59672f0b737535a9bcf04ba49a0')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # apply patches...
  patch -Np1 -i ../${pkgname}-libmpdheader.patch || return 1
  
  # Generating build system
  sh autogen.sh || return 1

  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --localstatedir=/var \
	      --disable-static

  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install || return 1
}
