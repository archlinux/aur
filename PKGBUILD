# This is the PKGBUILD for sra-tools
# Maintainer: Aaron Baker <aa{last name}99{at}gmail{dt}org>

pkgname=sra-tools
pkgver=2.6.3
pkgrel=1
pkgdesc="The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives."
arch=('x86_64')
url="http://www.ncbi.nlm.nih.gov/Traces/sra/"
depends=('libxml2' 'file' 'hdf5' 'ngs' 'ncbi-vdb')
optdepends=('fuse: mount remote genome reference files')
provides=('sra-tools')
license=('custom:PublicDomain')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ncbi/sra-tools/archive/$pkgver.tar.gz")
sha256sums=('5e2760def0d89a60ecfbd96b7d3428dd3124b190eda419bfe6b76bcab7352178')

prepare(){
  cd $pkgname-$pkgver

  # sra-tools tries to link to hdf5 as a static library but Arch provides this as 
  # a dynamic library https://bbs.archlinux.org/viewtopic.php?id=208018
  sed -e 's/-shdf5/-lhdf5/' -i tools/pacbio-load/Makefile
}

build(){
  cd "${pkgname}-${pkgver}"
  ./configure --prefix="$pkgdir/usr/" --with-ngs-sdk-prefix=/usr --with-ncbi-vdb-sources="/usr/src/ncbi-vdb-$pkgver"
  make
}

check(){
  cd "${pkgname}-${pkgver}"
  make -k test
}

package(){
  cd "$pkgname-$pkgver"
  make "ROOT=$pkgdir" install

  # add the license
  mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
  cp "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
