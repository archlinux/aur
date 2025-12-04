# Maintainer: Bipin Kumar <kbipinkumar@pm.me>
# Contributor: sukanka <su975853527 at gmail>
# Contributor: Aaron Baker <aa{last name}99{at}gmail{dt}org>
# Contributor: Georgios Amanakis <g_amanakis{at}yahoo{dt}com>
# Contributor: Guoyi Zhang <myname at malacology dot net>

pkgname=sra-tools
_dep=ncbi-vdb
pkgver=3.3.0
pkgrel=1
pkgdesc='A collection of tools and libraries for using data in the INSDC Sequence Read Archives'
url="https://github.com/ncbi/sra-tools"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ncbi/sra-tools/archive/refs/tags/$pkgver.tar.gz"
        "$_dep-$pkgver.tar.gz::https://github.com/ncbi/ncbi-vdb/archive/refs/tags/$pkgver.tar.gz"
        "fix_xml_attribute_unused.patch")
license=('NCBI-PD')
provides=('ncbi-vdb')
arch=(x86_64)
depends=('python' 'glibc' 'gcc-libs' 'java-runtime')
optdepends=('python-ngs: python module for ncbi sra-tools')
makedepends=('cmake'  'doxygen' 'hdf5' 'mbedtls' 'libxml2')
sha256sums=('c8c1332747c913791914f4092bfba578d61131d3f742cd55d29f6ed7f8df5c92'
            '36b3467affd53bea794e3eeb5598619d820bc726dc68751a189181ac7973047d'
            'b7bf289f0d52824d7871d35add266838524f7cea919c9e9424842f9291d3df2a')
options=(!lto)
prepare(){
  cd ${srcdir}/"$pkgname-$pkgver"
  patch -p1 < ${srcdir}/fix_xml_attribute_unused.patch
  # fix permission denied in make install,
  # and we manually install them.
  sed -i 's|/etc/ncbi|${CMAKE_CURRENT_SOURCE_DIR}/etc/ncbi|g' build/env.cmake
  sed -i 's|/etc/profile.d/sra-tools|${SRC_DIR}/etc/profile.d/sra-tools|g' build/install.sh
  # Fix Main JAR installation (ngs-java.jar)
  # Move from /usr/jar/ to /usr/share/java/ngs/
  sed -i 's|install_jar( ngs-java \${CMAKE_INSTALL_PREFIX}/jar/ )|install_jar( ngs-java \${CMAKE_INSTALL_PREFIX}/share/java/ngs/ )|' ngs/ngs-java/CMakeLists.txt

  # Fix Documentation and Source JARs (ngs-doc.jar, ngs-src.jar)
  # Move from /usr/jar/ to /usr/share/doc/ngs/ (doc) and /usr/share/java/ngs/ 
  sed -i 's|ngs-doc.jar DESTINATION \${CMAKE_INSTALL_PREFIX}/jar/|ngs-doc.jar DESTINATION \${CMAKE_INSTALL_PREFIX}/share/doc/ngs/|' ngs/ngs-java/CMakeLists.txt
  sed -i 's|ngs-src.jar DESTINATION \${CMAKE_INSTALL_PREFIX}/jar/|ngs-src.jar DESTINATION \${CMAKE_INSTALL_PREFIX}/share/java/ngs/|' ngs/ngs-java/CMakeLists.txt
  # 3. Fix Examples JAR (ngs-examples.jar)
  # Moves from /usr/jar/ to /usr/share/java/ngs/
  sed -i 's|\${CMAKE_INSTALL_PREFIX}/jar/|${CMAKE_INSTALL_PREFIX}/share/java/ngs/|g' ngs/ngs-java/examples/CMakeLists.txt
  # Fix Javadoc directory
  # Move extracted javadocs from /usr/share/javadoc/ to /usr/share/doc/ngs/ngs-docs/
  sed -i '/SOURCEPATH \${CMAKE_CURRENT_SOURCE_DIR}/a \            INSTALL_DESTINATION share/doc/ngs/ngs-docs' ngs/ngs-java/CMakeLists.txt
  # Java Examples (move from /usr/share/examples-java to /usr/share/doc/sra-tools/examples/java)
  find ngs -name "CMakeLists.txt" -print0 | xargs -0 sed -i 's|share/examples-java|share/doc/sra-tools/examples/java|g'
  find ngs -name "CMakeLists.txt" -print0 | xargs -0 sed -i 's|examples-java|share/doc/sra-tools/examples/java|g'

  # Python Examples (move from /usr/share/examples-python to /usr/share/doc/sra-tools/examples/python)
  find ngs -name "CMakeLists.txt" -print0 | xargs -0 sed -i 's|share/examples-python|share/doc/sra-tools/examples/python|g'
  find ngs -name "CMakeLists.txt" -print0 | xargs -0 sed -i 's|examples-python|share/doc/sra-tools/examples/python|g'

  # Generic/C++ Examples (move from /usr/share/examples to /usr/share/doc/sra-tools/examples)
  find ngs -name "CMakeLists.txt" -print0 | xargs -0 sed -i 's|DESTINATION share/examples|DESTINATION share/doc/sra-tools/examples|g'
  find ngs -name "CMakeLists.txt" -print0 | xargs -0 sed -i 's|DESTINATION examples|DESTINATION share/doc/sra-tools/examples|g'
}
build(){
  cd "$_dep-$pkgver"
  install -d  build1
  cd build1
  cmake .. -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -Wno-dev \
        -DCMAKE_SKIP_RPATH=YES \
        -DCMAKE_C_FLAGS="${CFLAGS} -fno-strict-aliasing -fno-aggressive-loop-optimizations" \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS} -fno-strict-aliasing -fno-aggressive-loop-optimizations"
  make

  cd ${srcdir}/"$pkgname-$pkgver"
  install -d  build1
  cd build1
  cmake .. -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
        -DVDB_INCDIR="$srcdir/$_dep-$pkgver/interfaces/" \
        -DVDB_LIBDIR="$srcdir/$_dep-$pkgver/build1/lib/" \
        -Wno-dev \
        -DCMAKE_SKIP_RPATH=YES \
        -DCMAKE_C_FLAGS="${CFLAGS} -fno-strict-aliasing -fno-aggressive-loop-optimizations" \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS} -fno-strict-aliasing -fno-aggressive-loop-optimizations"
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
  # fix symlinks for static libraries
  cd "$pkgdir"/usr/lib
  ln -sf "libncbi-ngs.a.${pkgver}" "libncbi-ngs-static.a"
  ln -sf "libncbi-vdb.a.${pkgver}" "libncbi-vdb-static.a"
  ln -sf "libncbi-wvdb.a.${pkgver}" "libncbi-wvdb-static.a"
  ln -sf "libngs-c++.a.${pkgver}" "libngs-c++-static.a"
}
