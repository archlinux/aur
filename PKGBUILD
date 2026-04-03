# Maintainer: David Flemström <david.flemstrom@gmail.com>

pkgname=superslicer-nightly-git
pkgver=2.3.55.5.r11521.g9f76bc145b
pkgrel=1
epoch=1
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.) — nightly dev_27_62 branch"
arch=("$CARCH")
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
options=(!emptydirs)
depends=('boost-libs' 'cgal' 'glew' 'imath' 'libspnav' 'nlopt' 'openvdb' 'qhull' 'slicer-udev' 'wxwidgets-gtk3')
makedepends=('boost' 'cereal' 'cmake' 'eigen' 'libigl' 'ninja' 'openvdb')
optdepends=('superslicer-profiles: Predefined printer profiles')
provides=("superslicer=$epoch:$pkgver")
conflicts=('superslicer' 'superslicer-prerelease' 'superslicer-git')
source=("SuperSlicer::git+https://github.com/supermerill/SuperSlicer.git#branch=dev_27_62"
        "heatshrink-0.4.1.zip::https://github.com/atomicobject/heatshrink/archive/refs/tags/v0.4.1.zip"
        "libbgcode-source.zip::https://github.com/prusa3d/libbgcode/archive/6f43cb004ef3d3bda37dde49f6235e24d2717629.zip"
        '0005-modern-deps.patch')
sha512sums=('SKIP'
            '910d1195536e41681dddf7468ad59f2343b530bed7b90cfb625a5b1c65c4e00cbf2c7ae28e9ef6a1e2895efe0a21fa2102017a773d238e86a8698b3cce1ffb96'
            'ace75273fee17a0d5cee6f6b6ae51861f0c323c3365b9ced711e9c21c1dc64e391ee29709dbe54922600ef8d1d6e1d963276f3bf32d6a77f8a66972f9e03b54e'
            'f6e699e942cd6cff558afeffe3a486122c84bb4fe9a5ee055b579d5c56e9de15b9e77af5787f9b8f59970ffa4bfbc56a5f77c0bf769d847333c74020475346c6')

pkgver()
{
  cd "$srcdir/SuperSlicer"
  git describe --long --tags | sed -E 's,^([0-9\.]+)([^0-9\.].*)?-([0-9]+)-(g[0-9a-f]+)$,\1.r\3.\4,'
}

prepare()
{
  cd "$srcdir/SuperSlicer"
  [ ! -d build ] || rm -rf build
  mkdir -p build

  # disabling tests is not enough, we need to remove them explicitly
  sed -i 's,add_subdirectory(test),,g' src/CMakeLists.txt

  # apply patches
  patch -Np1 -i "$srcdir/0005-modern-deps.patch"

  # build heatshrink (bundled, not in Arch repos)
  local _heatshrink_src="$srcdir/heatshrink-0.4.1"
  local _deps_prefix="$srcdir/deps-install"
  cp "$srcdir/SuperSlicer/deps/+heatshrink/CMakeLists.txt" "$_heatshrink_src/"
  cp "$srcdir/SuperSlicer/deps/+heatshrink/Config.cmake.in" "$_heatshrink_src/"
  cmake -B "$srcdir/heatshrink-build" -S "$_heatshrink_src" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$_deps_prefix"
  ninja -C "$srcdir/heatshrink-build"
  DESTDIR="" ninja -C "$srcdir/heatshrink-build" install

  # build libbgcode (bundled, not in Arch repos)
  local _libbgcode_src="$srcdir/libbgcode-6f43cb004ef3d3bda37dde49f6235e24d2717629"
  cmake -B "$srcdir/libbgcode-build" -S "$_libbgcode_src" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$_deps_prefix" \
    -DCMAKE_PREFIX_PATH="$_deps_prefix" \
    -DLibBGCode_BUILD_TESTS=OFF \
    -DLibBGCode_BUILD_CMD_TOOL=OFF
  ninja -C "$srcdir/libbgcode-build"
  DESTDIR="" ninja -C "$srcdir/libbgcode-build" install
}

build()
{
  cd "$srcdir/SuperSlicer/build"

  cmake .. \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-ignored-optimization-argument -ffat-lto-objects -DBOOST_FILESYSTEM_DEPRECATED -DBOOST_PROCESS_VERSION=1 -ffile-prefix-map=$srcdir=." \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_PREFIX_PATH="$srcdir/deps-install" \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DSLIC3R_FHS=ON \
    -DSLIC3R_STATIC=OFF \
    -DSLIC3R_WX_STABLE=ON \
    -DSLIC3R_GTK=3 \
    -DSLIC3R_BUILD_TESTS=OFF \
    -DSLIC3R_ALPHA=ON \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config \
    -DSLIC3R_APP_NAME="SuperSlicer" \
    -DSLIC3R_APP_KEY="SuperSlicer" \
    -DSLIC3R_APP_CMD="superslicer"

  ninja
}

package()
{
  cd "$srcdir/SuperSlicer/build"

  DESTDIR="$pkgdir" ninja install
  test ! -h "$pkgdir/usr/share/SuperSlicer/resources" || rm "$pkgdir/usr/share/SuperSlicer/resources"
  rm -r "${pkgdir}"/usr/lib/udev # Provided by slicer-udev
}
