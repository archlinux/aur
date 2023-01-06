# Maintainer: Bipin Kumar <bipin@ccmb.res.in>
# Contributor: sukanka <su975853527 at gmail>
# Contributor: Aaron Baker <aa{last name}99{at}gmail{dt}org>
# Contributor: Georgios Amanakis <g_amanakis{at}yahoo{dt}com>

pkgname=sra-tools
_dep=ncbi-vdb
pkgver=3.0.3
_depver=3.0.2
pkgrel=3
pkgdesc='A collection of tools and libraries for using data in the INSDC Sequence Read Archives'
url="https://github.com/ncbi/sra-tools"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ncbi/sra-tools/archive/refs/tags/$pkgver.tar.gz"
        "$_dep-$_depver.tar.gz::https://github.com/ncbi/ncbi-vdb/archive/refs/tags/$_depver.tar.gz")
license=('custom: Public Domain')
provides=('ncbi-vdb')
arch=(x86_64)
depends=('hdf5' 'python' 'mbedtls' 'libxml2')
makedepends=('cmake'  'doxygen' 'java-runtime')
sha256sums=('ea4b9a4b2e6e40e6b2bf36b01eb8df2b50280ef9dcdc66b504c1d1296600afbd'
            '275ccb225ddb156688c8c71f772f73276cb18ebff773a51150f86f8002ed2d59')

prepare(){
  cd ${srcdir}/"$pkgname-$pkgver"
  # fix permission denied in make install,
  # and we manually install them.
  sed -i 's|/etc/ncbi|${CMAKE_CURRENT_SOURCE_DIR}/etc/ncbi|g' build/env.cmake
  sed -i 's|/etc/profile.d/sra-tools|${SRC_DIR}/etc/profile.d/sra-tools|g' build/install.sh
}
build(){
  cd "$_dep-$_depver"
  install -d  build1
  cd build1
  cmake .. -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -Wno-dev \
        -DCMAKE_SKIP_RPATH=YES
  make

  cd ${srcdir}/"$pkgname-$pkgver"
  install -d  build1
  cd build1
  cmake .. -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
        -DVDB_INCDIR="$srcdir/$_dep-$_depver/interfaces/" \
        -DVDB_LIBDIR="$srcdir/$_dep-$_depver/build1/lib/" \
        -Wno-dev \
        -DCMAKE_SKIP_RPATH=YES
  make
}

package(){
  install -d  $srcdir/$_dep-$_depver/interfaces/kfg/ncbi/etc/profile.d/

  cd "$_dep-$_depver"/build1
  make DESTDIR="$pkgdir" install

  cd ${srcdir}/"$pkgname-$pkgver"/build1
  make DESTDIR="$pkgdir" install
  cp -rf ${srcdir}/"$pkgname-$pkgver"/etc "$pkgdir"
  cp -rf $srcdir/$_dep-$_depver/interfaces/kfg/ncbi/etc "$pkgdir"

  # install LICENSE file
  install -Dm644 ${srcdir}/"$pkgname-$pkgver"/LICENSE  -t "$pkgdir"/usr/share/licenses/sra-tools/

  # remove empty folder
  rm -Rf "$pkgdir"/usr/include/kfg/ncbi/etc/
  
  # remove symlinks       
  find "$pkgdir"/usr/bin  -type l -delete

  # Fix filenames: remove $pkgever suffix from end of binaries
  for filename in "$pkgdir"/usr/bin/*
    do [ -f "$filename" ] || continue
    mv "$filename" "${filename//.${pkgver}/}"
  done

  # Fix filenames: remove -orig suffix from end of binaries
  for filename in "$pkgdir"/usr/bin/*
    do [ -f "$filename" ] || continue
    mv -n "$filename" "${filename//-orig/}"
  done
}
