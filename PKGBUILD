# Maintainer: Jens Staal <staal1978@gmail.com>
pkgname=ugene-git
pkgver=38.1.r485.g113d9908d0
pkgrel=1
pkgdesc="A free cross-platform genome analysis suite."
arch=('x86_64')
url="http://ugene.unipro.ru/"
license=('GPL')
depends=('libxtst' 'glu' 'qt5-webkit' 'qt5-websockets' 'qt5-svg' 'qt5-script' 'desktop-file-utils' 'qspec-git' 'opencl-driver')
makedepends=('git' 'opencl-headers')
#optdepends lists packages that otherwise are present in ugene-external-tools
optdepends=('cufflinks' 'bowtie' 'clustalw' 'phyml' 'blast+' 'clustal-omega' 'vcftools' 'mrbayes' 'bwa' 'bedtools'
	'tcoffee' 'hmmer' 'snpeff' 'samtools' 'mafft' 'trimmomatic' 'stringtie' 'kraken' 'diamond-aligner'
	'python2-cutadapt' 'python' 'java-runtime' 'bowtie2' 'tophat' 'fastqc')
#missing packages from ugene-external-tools: CAP3, bedgraph2BigWig wevote, metaphlan2, clark, spades, cistrome 
provides=('ugene' 'ugene-bin')
conflicts=('ugene' 'ugene-bin')
source=('ugene::git+https://github.com/ugeneunipro/ugene.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/ugene
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd "${srcdir}"/ugene
  #make sure that the wanted branch is active
  git checkout master
  CXXFLAGS="$CXXFLAGS -Wno-depreceated"
  OPENCL_INC_PATH=/usr/include/CL
  qmake -r CONFIG+=x64 PREFIX=${pkgdir}/opt/ugene UGENE_OPENCL_DETECTED=1 UGENE_USE_SYSTEM_SQLITE=1 UGENE_USE_BUNDLED_ZLIB=0 .
  make -j 4
}

package() {
  cd "${srcdir}"/ugene
  make PREFIX=${pkgdir}/opt/ugene install
  mkdir -p ${pkgdir}/usr/bin
  ln -s /opt/ugene/ugene ${pkgdir}/usr/bin/ugene
  mkdir -p ${pkgdir}/usr/share/applications
  ln -s /opt/ugene/ugene.desktop ${pkgdir}/usr/share/applications/ugene.desktop
}

post_install() {
  update-desktop-database -q
}
post_remove() {
  update-desktop-database -q
}
 
