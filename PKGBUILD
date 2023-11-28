# Maintainer: Bipin Kumar <kbipinkumar@pm.me>
# Contributor: sukanka <su975853527 at gmail>
# Contributor: Aaron Baker <aa{last name}99{at}gmail{dt}org>
# Contributor: Georgios Amanakis <g_amanakis{at}yahoo{dt}com>
# Contributor: Guoyi Zhang <myname at malacology dot net>

pkgname=sra-tools
_dep=ncbi-vdb
pkgver=3.0.9
pkgrel=1
pkgdesc='A collection of tools and libraries for using data in the INSDC Sequence Read Archives'
url="https://github.com/ncbi/sra-tools"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ncbi/sra-tools/archive/refs/tags/$pkgver.tar.gz"
        "$_dep-$pkgver.tar.gz::https://github.com/ncbi/ncbi-vdb/archive/refs/tags/$pkgver.tar.gz")
license=('custom: Public Domain')
provides=('ncbi-vdb')
arch=(x86_64)
depends=('python' 'glibc' 'gcc-libs')
optdepends=('python-ngs: python module for ncbi sra-tools')
makedepends=('cmake'  'doxygen' 'java-runtime' 'hdf5' 'mbedtls' 'libxml2')
sha256sums=('41159b817fb7649e42b41b3ca37bb3346d4fcb27049737d8a3bca5091ad74bb5'
            '26c94e5259b0c7e98fdaa1e93d41201df29ffff56946dd19464c6a0cfb584f92')

prepare(){
  cd ${srcdir}/"$pkgname-$pkgver"
  # fix permission denied in make install,
  # and we manually install them.
  sed -i 's|/etc/ncbi|${CMAKE_CURRENT_SOURCE_DIR}/etc/ncbi|g' build/env.cmake
  sed -i 's|/etc/profile.d/sra-tools|${SRC_DIR}/etc/profile.d/sra-tools|g' build/install.sh
}
build(){
  cd "$_dep-$pkgver"
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
        -DVDB_INCDIR="$srcdir/$_dep-$pkgver/interfaces/" \
        -DVDB_LIBDIR="$srcdir/$_dep-$pkgver/build1/lib/" \
        -Wno-dev \
        -DCMAKE_SKIP_RPATH=YES
  make
}

package(){
  install -d  $srcdir/$_dep-$pkgver/interfaces/kfg/ncbi/etc/profile.d/

  cd "$_dep-$pkgver"/build1
  make DESTDIR="$pkgdir" install

  cd ${srcdir}/"$pkgname-$pkgver"/build1
  make DESTDIR="$pkgdir" install
  cp -rf ${srcdir}/"$pkgname-$pkgver"/etc "$pkgdir"
  cp -rf $srcdir/$_dep-$pkgver/interfaces/kfg/ncbi/etc "$pkgdir"

  # install LICENSE file
  install -Dm644 ${srcdir}/"$pkgname-$pkgver"/LICENSE  -t "$pkgdir"/usr/share/licenses/sra-tools/

  # remove empty folder
  rm -Rf "$pkgdir"/usr/include/kfg/ncbi/etc/
  
  # remove symlinks       
  find "$pkgdir"/usr/bin  -type l -delete
  # Fix filenames: remove $pkgever suffix from end of binaries
  for bin in "$pkgdir"/usr/bin/*
    do [ -f "$bin" ] || continue
    mv --update=none "$bin" "${bin//.${pkgver}/}"
  done
  # Fix filenames: remove -orig suffix from end of binaries
  for file in "$pkgdir"/usr/bin/*-orig; do mv --update=none "$file" "${file%-orig}"; done
 
}
