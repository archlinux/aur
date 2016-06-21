# This is the PKGBUILD for ncbi-vdb
# Maintainer: Aaron Baker <aa{last name}99{at}gmail{dt}org>

pkgname=ncbi-vdb
pkgver=2.6.3
pkgrel=1
pkgdesc="The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives."
arch=('x86_64')
url="https://github.com/ncbi/ncbi-vdb"
depends=('libxml2' 'ngs' 'hdf5')
provides=('ncbi-vdb')
license=('custom:PublicDomain')
source=("https://github.com/ncbi/ncbi-vdb/archive/$pkgver.tar.gz" "$pkgname.patch")
sha256sums=('49bb251207b22d3136129f7f718985e0a9acb2e08d382d52e3ab7400544202a6' 'db379579bae63b67d1a58ead406e39123374d6f5ff195a7ab41bb4e10d6f98fb')

prepare(){
  cd "${pkgname}-${pkgver}"
  # ncbi build process frequently checks if we are root user which interferes 
  #   with makepkg use of fakeroot
  patch -p1 -i $srcdir/$pkgname.patch 
}

build(){
  cd "${pkgname}-${pkgver}"
  ./configure --prefix="$pkgdir/usr/"
  make
}

check(){
  cd "${pkgname}-${pkgver}"
  make -k test
}

package(){
  cd "$pkgname-$pkgver"
  # ncbi does not use autoconf/automake so there is no respect for DESTDIR
  #   but there is a ROOT(dir)
  make "ROOT=$pkgdir" install
  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"

  # the source of this package is required by others
  # TODO is there somewhere to put this for namcap not to complain?
  mkdir -p "$pkgdir/usr/src/${pkgname}-${pkgver}"
  cp -r . "$pkgdir/usr/src/${pkgname}-${pkgver}"

  # add the license
  mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
  cp "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  # TODO without this a link from libncbi-vdb-static.a -> libncbi-vdb.a is dead because 
  #   libncbi-vdb.a gets removed somehow??
  cd "$pkgdir/usr/lib/"
  ln -sf "libncbi-vdb.a.$pkgver" libncbi-vdb-static.a
  ln -sf "libncbi-wvdb.a.$pkgver" libncbi-wvdb-static.a
}
