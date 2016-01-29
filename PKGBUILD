# This is the PKGBUILD for ncbi-vdb
# Maintainer: Aaron Baker <aa{last name}99{at}gmail{dt}org>

pkgname=ncbi-vdb
pkgver=2.5.7
pkgrel=1
pkgdesc="The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives."
arch=('x86_64')
url="https://github.com/ncbi/ncbi-vdb"
depends=('libxml2' 'ngs' 'hdf5')
provides=('ncbi-vdb')
license=('custom:PublicDomain')
source=("https://github.com/ncbi/ncbi-vdb/archive/$pkgver.tar.gz" "$pkgname.patch")
sha256sums=('e088717270a48f070d5aeb633558e778081c70e5c42e5e621d6a5b8f3c2c5e41' '19f09b19cad2ebd4df4185022e711f9bc32898926168d234833e56d70c2d2029')

prepare(){
  cd "${pkgname}-${pkgver}"
  # ncbi build process frequently checks if we are root user which interferes 
  #   with makepkg use of fakeroot
  patch -p1 -i "$srcdir/$pkgname.patch"
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
  ln -sf libncbi-vdb.a.2.5.7 libncbi-vdb-static.a
  ln -sf libncbi-wvdb.a.2.5.7 libncbi-wvdb-static.a
}
