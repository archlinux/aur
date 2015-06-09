pkgname=mingw-w64-ogre
pkgver=1.9.0
pkgrel=2
pkgdesc="Scene-oriented, flexible 3D engine written in C++ (mingw-w64)"
arch=(any)
url="http://www.ogre3d.org"
license=("custom:MIT")
depends=(mingw-w64-boost mingw-w64-freeimage mingw-w64-freetype mingw-w64-zziplib mingw-w64-tinyxml mingw-w64-ois)
makedepends=(mingw-w64-cmake mercurial)
options=(!buildflags staticlibs !strip !emptydirs)
source=("hg+http://bitbucket.org/sinbad/ogre#tag=v${pkgver//./-}"
        cmake30.patch::https://bitbucket.org/sinbad/ogre/commits/d84bce645d3dd439188d3d29d8da51c51765a085/raw/)
md5sums=('SKIP'
         '116fb8009c8d4b499f9a885052cc0ea6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ogre
  patch -Np1 < ../cmake30.patch

  # should not be used for x86_64 builds, fixed upstream
  sed -i "/march=i686/d" CMakeLists.txt
}

build() {
  cd ogre
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DOGRE_MINGW_RC=/usr/bin/${_arch}-windres \
      -DOGRE_BUILD_RENDERSYSTEM_D3D9=OFF \
      -DOGRE_INSTALL_DEPENDENCIES=OFF \
      -DOGRE_COPY_DEPENDENCIES=OFF \
      -DOGRE_BUILD_SAMPLES=OFF \
      -DOGRE_INSTALL_SAMPLES=OFF \
      -DOGRE_BUILD_DOCS=OFF \
      -DOGRE_BUILD_TOOLS=OFF \
      -DOGRE_INSTALL_TOOLS=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/ogre/build-${_arch}"
    make install DESTDIR="$pkgdir"
    mv "$pkgdir"/usr/${_arch}/lib/RelWithDebInfo/* "$pkgdir"/usr/${_arch}/lib/
    mv "$pkgdir"/usr/${_arch}/lib/opt/* "$pkgdir"/usr/${_arch}/lib/
    mv "$pkgdir"/usr/${_arch}/bin/RelWithDebInfo/* "$pkgdir"/usr/${_arch}/bin/
    mkdir -p "$pkgdir"/usr/${_arch}/lib/cmake
    mv "$pkgdir"/usr/${_arch}/CMake/* "$pkgdir"/usr/${_arch}/lib/cmake
    rm -r "$pkgdir"/usr/${_arch}/lib/{RelWithDebInfo,opt}
    rm -r "$pkgdir"/usr/${_arch}/CMake
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.user.in' | xargs rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

