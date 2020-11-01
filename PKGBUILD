# $Id$
# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=bowtie2
pkgver=2.4.2
pkgrel=1
pkgdesc="Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequence."
arch=("any")
depends=('termcap')
optdepends=('intel-tbb: faster multithreading')
url="http://bowtie-bio.sourceforge.net/bowtie2"
license=(GPL3)
source=("https://github.com/BenLangmead/bowtie2/archive/v${pkgver}.tar.gz")
md5sums=('d5f8674aed8bdbf6b96bd07f3df528ee')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make clean
}

build() {
   cd "bowtie2-${pkgver}"
   if pacman -Q intel-tbb > /dev/null 2>/dev/null; then
      msg2 "Building with Intel's TBB multithreading support"
      EXTRA_FLAGS="-std=gnu++98" NO_TBB=0 make prefix=/usr
   else
      msg2 "You haven't installed the intel-tbb package; building without Intel's TBB multithreading support"
      EXTRA_FLAGS="-std=gnu++98" NO_TBB=1 make prefix=/usr
   fi
}

package() {
   mkdir -p "${pkgdir}/opt/"
   cp -a "${srcdir}/bowtie2-${pkgver}" "${pkgdir}/opt/bowtie2"
   cd "${srcdir}/bowtie2-${pkgver}"
   make prefix=/usr DESTDIR="${pkgdir}" install
   mkdir -p "${pkgdir}/usr/share/doc/bowtie2"
   cp -a ${srcdir}/bowtie2-${pkgver}/doc "${pkgdir}/usr/share/doc/bowtie2"
   install -Dm644 ${srcdir}/bowtie2-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/bowtie2"
}
