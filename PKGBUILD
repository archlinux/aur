# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Link Dupont <link at subpop do net>

pkgname=svgalib
pkgver=1.9.25
pkgrel=4
pkgdesc="A low-level SuperVGA graphics library"
arch=('i686' 'x86_64')
url="http://www.svgalib.org/"
license=('GPL')
depends=('perl')
source=(http://mail.arava.co.il/~matan/${pkgname}/${pkgname}-${pkgver}.tar.gz
        svgalib-1.9.25-linux2.6.patch
        svgalib-1.9.25-linux2.6.28.patch
        svgalib-1.9.25-glibc210.patch
        svgalib-1.9.25-linux2.6.36.patch)
md5sums=('4dda7e779e550b7404cfe118f1d74222'
         'eadd4d3974a475ccc9d72f1e614c69df'
         '5c797ca334e4c7f326dc08df7a3eb5c9'
         '938f822ede2c9e76f2da0dd3ee38ba33'
         '99e767dec306ff4d307eef151f352466')

build() {
  cd ${pkgname}-${pkgver}

  find -name Makefile -exec sed '/fixldsoconf/d;/ldconfig/d' -i {} \;
  ln -sf ../gl/vgagl.h threeDKit/

  cd "${srcdir}"

  patch -Np1 -i "${srcdir}"/svgalib-1.9.25-linux2.6.patch
  patch -Np1 -i "${srcdir}"/svgalib-1.9.25-linux2.6.28.patch
  patch -Np1 -i "${srcdir}"/svgalib-1.9.25-glibc210.patch
  patch -Np1 -i "${srcdir}"/svgalib-1.9.25-linux2.6.36.patch
  
  cd ${pkgname}-${pkgver}
  
  make prefix="${pkgdir}"/usr \
	NO_HELPER=n \
	shared static
}

package() {
  install -dm755 "${pkgdir}"/usr/lib
  
  cd ${pkgname}-${pkgver}
  
  make prefix="${pkgdir}"/usr \
	datadir="${pkgdir}"/etc/vga \
	NO_HELPER=y \
	install
}
