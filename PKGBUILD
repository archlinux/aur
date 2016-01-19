# $Id$
# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=bowtie2
pkgver=2.2.6
pkgrel=4
pkgdesc="Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequence."
arch=("any")
optdepends=('intel-tbb: faster multithreading')
url="http://bowtie-bio.sourceforge.net/bowtie2"
license=('GPL3')
source=("https://github.com/BenLangmead/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('9e5d10dff2424177e8051092ff502bb6')

build() {
   cd $srcdir/$pkgname-$pkgver
   if pacman -Q intel-tbb > /dev/null 2>/dev/null; then
      msg2 "Building with Intel's TBB multithreading support"
      #WITH_TBB=1 make
      # tbb is broken in this release...remove this when fixed
      WITH_TBB=0 make
   else
      msg2 "You haven't installed the intel-tbb package; building without Intel's TBB multithreading support"
      WITH_TBB=0 make
   fi
}

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" install
   mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
   cp -a doc/* ${pkgdir}/usr/share/doc/${pkgname}/.
   cp -a example ${pkgdir}/usr/share/doc/${pkgname}
   cp -a scripts ${pkgdir}/usr/share/doc/${pkgname}
   install -Dm644 ${srcdir}/${pkgname}-${pkgver}/MANUAL -t "${pkgdir}/usr/share/doc/${pkgname}"
   install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
}
