# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

# Careful when upgrading this package! It usually breaks ABI without bumping
# soname. Also, be very mindful of the version of spirv-tools that this links
# to. Upstream actually expects the use of the particular commits of
# spirv-tools and spirv-headers that are provided in known_good.json. However,
# if we went that route, we'd have to vendor the resulting spirv-tools libs
# from this glslang build and they would be incompatible with system libs,
# resulting in us having to ship both. Instead, I recommend just waiting until
# upstream releases a compatible version of spirv-tools, then updating the
# spriv-tools system package and only then building glslang against that.
_setPrefix="/usr"
_setLibdir="lib32"
_setFullLibdir="${_setPrefix}/${_setLibdir}"
_pkgbasename=glslang

pkgname=lib32-$_pkgbasename
pkgver=12.2.0
pkgrel=1
pkgdesc='OpenGL and OpenGL ES shader front end and validator (32bit)'
arch=('x86_64')
url='https://github.com/KhronosGroup/glslang'
license=('BSD')
depends=(
        "$_pkgbasename>=$pkgver"
        'lib32-glibc'
        'lib32-gcc-libs'
        'python'
        )
makedepends=(
        'cmake'
        'ninja'
        'git'
        'lib32-spirv-tools'
        'spirv-headers'
        )
options=('staticlibs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/glslang/archive/${pkgver}.tar.gz)
sha256sums=('870d17030fda7308c1521fb2e01a9e93cbe4b130bc8274e90d00e127432ab6f6')

prepare() {
  echo "Patching if needed"
  cd ${_pkgbasename}-${pkgver}
}

build() {
  export CCFLAGS="-m32"
  export CXXFLAGS="-m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgbasename}-${pkgver}
  # we need fat LTO objects to not break consumers during linking
  export CXXFLAGS+=" -ffat-lto-objects"
  cmake \
    -Bbuild-shared \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib32" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_FLAGS:STRING=-m32 \
    -DBUILD_SHARED_LIBS=ON
  ninja -Cbuild-shared

  cmake \
    -Bbuild-static \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib32" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_FLAGS:STRING=-m32 \
    -DBUILD_SHARED_LIBS=OFF
  ninja -Cbuild-static
}

check() {
  cd ${_pkgbasename}-${pkgver}
  ninja -Cbuild-shared test
}

package() {
  cd ${_pkgbasename}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build-shared install
  DESTDIR="${pkgdir}" ninja -C build-static install

  cd "${pkgdir}/usr/lib32/"
  for lib in *.so; do
    ln -sf "${lib}" "${lib}.0"
  done

  for i in "${pkgdir}/usr/bin/"*; do
    mv "$i" "$i"32
  done

  rm -rf "${pkgdir}"/usr/{include,share}
}

# vim: ts=2 sw=2 et: