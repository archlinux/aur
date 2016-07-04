# $Id$
# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=bowtie2-git
_pkgname=bowtie2
pkgver=v2.2.9.r9.g9c90266
pkgrel=1
pkgdesc="Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequence."
arch=("any")
optdepends=('intel-tbb: faster multithreading')
url="http://bowtie-bio.sourceforge.net/bowtie2"
license=('GPL3')
source=('git://github.com/BenLangmead/bowtie2')
md5sums=('SKIP')
conflicts=('bowtie2')
provides=('bowtie2')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  make clean
}

build() {
   cd $_pkgname
   if pacman -Q intel-tbb > /dev/null 2>/dev/null; then
      msg2 "Building with Intel's TBB multithreading support"
      WITH_TBB=1 make 
   else
      msg2 "You haven't installed the intel-tbb package; building without Intel's TBB multithreading support"
      WITH_TBB=0 make 
   fi
}

package() {
   mkdir -p "${pkgdir}/opt/${_pkgname}"
   cp -a "${srcdir}/${_pkgname}"/* "${pkgdir}/opt/${_pkgname}"/.
   cd "${srcdir}/${_pkgname}"
   make prefix=/usr DESTDIR="${pkgdir}" install
   install -Dm644 "${srcdir}/${_pkgname}/MANUAL" -t "${pkgdir}/usr/share/doc/${_pkgname}"
   install -Dm644 "${srcdir}/${_pkgname}/LICENSE" -t "$pkgdir/usr/share/licenses/${_pkgname}"
}
