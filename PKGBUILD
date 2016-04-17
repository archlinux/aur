# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Alexey Pavlov <Alexpux@gmail.com>
# Contributor: Ray Donnelly <mingw.android@gmail.com>
_realname=icu
pkgname=mingw-w64-${_realname}
pkgver=57.1
pkgrel=1
arch=(any)
pkgdesc="International Components for Unicode library (mingw-w64)"
url="http://www.icu-project.org/"
license=("custom:icu")
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure)
options=(!buildflags staticlibs !strip !emptydirs)
source=("http://download.icu-project.org/files/icu4c/${pkgver}/icu4c-${pkgver//./_}-src.tgz"
"0004-move-to-bin.mingw.patch"
"0007-actually-move-to-bin.mingw.patch"
"0008-data-install-dir.mingw.patch"
"0009-fix-bindir-in-config.mingw.patch"
"0010-msys-rules-for-makefiles.mingw.patch"
"0011-sbin-dir.mingw.patch"
"0012-libprefix.mingw.patch"
"0014-mingwize-pkgdata.mingw.patch"
"0015-debug.mingw.patch"
"0016-icu-pkgconfig.patch"
"0017-icu-config-versioning.patch")
md5sums=('976734806026a4ef8bdd17937c8898b9'
         '4c8143786ed499184e64fc5a1a1d0fdf'
         'eb56b72df2ca0dc77261c4f2adc5c8ad'
         '9c63125f7bdd88871c89e13ee62ac02b'
         '93830d77021eab270e537d466653557e'
         'cce2427d95bcb4a364df5ab605c3e9a3'
         'ee93f131a132f7e65d11d15a467b7abc'
         'f43d08a14a3e723977178fed136e58b1'
         '74415f3f3876b5f2f7cea0c5d367c5c6'
         'd1accfbefbcd399a4a28a4a4e0737915'
         '3f13cf5733c4a9363c5823a24d3fba85'
         'da12188a00025605be0c4ee22d1895bb')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd icu
  patch -p1 -i ../0004-move-to-bin.mingw.patch
  patch -p1 -i ../0007-actually-move-to-bin.mingw.patch
  patch -p1 -i ../0008-data-install-dir.mingw.patch
  patch -p1 -i ../0009-fix-bindir-in-config.mingw.patch
  patch -p1 -i ../0010-msys-rules-for-makefiles.mingw.patch
  patch -p1 -i ../0011-sbin-dir.mingw.patch
  patch -p1 -i ../0012-libprefix.mingw.patch
  patch -p1 -i ../0014-mingwize-pkgdata.mingw.patch
  patch -p1 -i ../0015-debug.mingw.patch
  patch -p1 -i ../0016-icu-pkgconfig.patch
  patch -p1 -i ../0017-icu-config-versioning.patch

  cd source
  autoreconf -fi
}

build() {
  cd icu/source
  mkdir -p nativebuild && pushd nativebuild
  CFLAGS=-fno-stack-protector
  ../configure --enable-static --disable-shared
  make
  popd
  for _arch in ${_architectures}; do
    mkdir build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --with-cross-build=$PWD/../nativebuild \
      --with-data-packaging=library \
      --disable-rpath \
      --enable-release \
      --disable-tools \
      --disable-tests \
      --disable-samples
    make -j1
    popd
  done
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  for _arch in ${_architectures}; do
    cd "$srcdir/icu/source/build-${_arch}"
    make install DESTDIR="$pkgdir"
    mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
    ln -s "/usr/${_arch}/bin/icu-config" "$pkgdir/usr/bin/${_arch}-icu-config"
  done
}
