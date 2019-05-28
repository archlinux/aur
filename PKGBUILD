# This is the PKGBUILD for sra-tools
# Maintainer: Aaron Baker <aa{last name}99{at}gmail{dt}org>
# Maintainer: Georgios Amanakis <g_amanakis{at}yahoo{dt}com>

pkgname=sra-tools
pkgver=2.9.6
pkgrel=1
pkgdesc="The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives."
arch=('x86_64')
url="http://github.com/ncbi/sra-tools/"
depends=('libxml2' 'file' 'hdf5' 'ngs' 'ncbi-vdb')
optdepends=('fuse: mount remote genome reference files')
provides=('sra-tools')
license=('custom:PublicDomain')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ncbi/sra-tools/archive/$pkgver.tar.gz"
	"sra-tools.patch")
sha256sums=('f1fdd0d294da0528d00ab14e34921cb9cfe775a332543abf54ade5db13467e44'
            '59c87371b10a3d8f7c1c8312c534ec9a6374cb3428ecbeb42c60cf422cab0782')

prepare(){
  cd $pkgname-$pkgver

  # sra-tools tries to link to hdf5 as a static library but Arch provides this as 
  # a dynamic library https://bbs.archlinux.org/viewtopic.php?id=208018
  sed -e 's/-shdf5/-lhdf5/' -i tools/pacbio-load/Makefile
  patch -p1 -i ../sra-tools.patch
}

build(){
  cd "${pkgname}-${pkgver}"
  ./configure \
	--prefix="$pkgdir/usr/" \
	--build-prefix="$srcdir/build_dir" \
	--with-ngs-sdk-prefix="/usr" \
	--with-ncbi-vdb-sources="/usr/src/ncbi-vdb-$pkgver" \
	--with-ncbi-vdb-build="/usr/src/ncbi-vdb-$pkgver/build_dir"
  make
}

#check(){
#  cd "${pkgname}-${pkgver}"
#  make -k test
#}

package(){
  cd "$pkgname-$pkgver"
#  make "ROOT=$pkgdir" install
  make install

  # add the license
  mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
  cp "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
