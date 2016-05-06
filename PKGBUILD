# This is the PKGBUILD for ncbi-vdb
# Maintainer: Aaron Baker <aa{last name}99{at}gmail{dt}org>

pkgname=ncbi-vdb
pkgver=2.6.2
pkgrel=1
pkgdesc="The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives."
arch=('x86_64')
url="https://github.com/ncbi/ncbi-vdb"
depends=('libxml2' 'ngs' 'hdf5')
provides=('ncbi-vdb')
license=('custom:PublicDomain')
source=("https://github.com/ncbi/ncbi-vdb/archive/$pkgver.tar.gz" "$pkgname-$pkgver.patch")
sha256sums=('c310edacd1a4f98a5cfab702f3eede98977ef64831f002fddd7728ed7e2034f4' '4062cc8018e26192eaaff6d27205a3854e223f2e9c75b2d935a283bf85e1f99c')

prepare(){
  cd "${pkgname}-${pkgver}"
  # stop NCBI root checks for great good
  patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
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
