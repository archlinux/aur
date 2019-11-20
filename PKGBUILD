# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

# Careful when upgrading this package! It usually breaks ABI without bumping soname.
_setPrefix="/usr"
_setLibdir="lib32"
_setFullLibdir="${_setPrefix}/${_setLibdir}"
_pkgbasename=glslang

pkgname=lib32-$_pkgbasename
pkgver=7.13.3496
pkgrel=2
pkgdesc='OpenGL and OpenGL ES shader front end and validator (32bit)'
arch=('x86_64')
url='https://github.com/KhronosGroup/glslang'
license=('BSD')
depends=(
        "$_pkgbasename"
        'lib32-gcc-libs'
        'lib32-spirv-tools'
        'python'
        )
makedepends=(
        'cmake'
        'ninja'
        )
options=('staticlibs')
source=(
        ${_pkgnamename}-${pkgver}.tar.gz::https://github.com/KhronosGroup/glslang/archive/${pkgver}.tar.gz
        fix-cmake-folder.patch
)
sha256sums=(
        '170d1538a670af4cae300e875d7cda9744b1acee1ab7252ecf7c4004186bb922'
        '5b231d27cfde2178b937b115e9b92fe10c28e7624a638cca9f7b48b4bec3f71e'
)

prepare() {
    echo "Patching"
    cd ${_pkgbasename}-${pkgver}
    patch --forward --strip=1 --verbose --input="${srcdir}/fix-cmake-folder.patch"
}

build() {
  export CCFLAGS="-m32"
  export CXXFLAGS="-m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgbasename}-${pkgver}
  mkdir -p build-{shared,static}
  (cd build-shared
    cmake .. \
      -G Ninja \
      -DCMAKE_LIBRARY_PATH="/usr/lib32" \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DCMAKE_INSTALL_LIBDIR="lib32" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_C_FLAGS:STRING=-m32 \
      -DCMAKE_CXX_FLAGS:STRING=-m32 \
      -DBUILD_SHARED_LIBS=ON \
      -DINSTALL_DOCS=OFF
    ninja
  )
  (cd build-static
    cmake .. \
      -G Ninja \
      -DCMAKE_LIBRARY_PATH="/usr/lib32" \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DCMAKE_INSTALL_LIBDIR="lib32" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_C_FLAGS:STRING=-m32 \
      -DCMAKE_CXX_FLAGS:STRING=-m32 \
      -DBUILD_SHARED_LIBS=OFF \
      -DINSTALL_DOCS=OFF
    ninja
  )
}

package() {
  cd ${_pkgbasename}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build-shared install
  DESTDIR="${pkgdir}" ninja -C build-static install

  cd "${pkgdir}/usr/lib32/"
  for lib in *.so; do
    ln -sf "${lib}" "${lib}.0"
  done
  cd ..

  for i in "${pkgdir}/usr/bin/"*; do
    mv "$i" "$i"32
  done

  rm -rf "${pkgdir}"/usr/{include,share}
}

# vim: ts=2 sw=2 et: