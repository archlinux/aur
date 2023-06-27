# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgbase=prusa-slicer
pkgname=(prusa-slicer slicer-udev)
pkgver=2.6.0
_pkgver=2.6.0
pkgrel=1
pkgdesc="G-code generator for 3D printers (Prusa fork of Slic3r)"
arch=('x86_64')
url="https://github.com/prusa3d/PrusaSlicer"
license=('AGPL3')
# wx 3.2 is not supported yet https://github.com/prusa3d/PrusaSlicer/issues/8299
depends=('boost-libs' 'curl' 'glew' 'mpfr' 'nlopt' 'tbb' 'qhull' 'openvdb'
         'gtk3' 'libjpeg-turbo' 'opencascade')
makedepends=('cmake' 'boost' 'cereal' 'cgal' 'eigen' 'expat' 'gtest' 'libpng' 'systemd'
             'gst-plugins-base' 'glu' 'webkit2gtk' 'libnotify' 'ninja' 'nanosvg' 'git')
checkdepends=('catch2')
# prusa-slicer uses a patched wxWidgets and does not work with upstream, commit pinned in
# https://github.com/prusa3d/PrusaSlicer/blob/version_${pkgver}/deps/wxWidgets/wxWidgets.cmake
options=('!makeflags')
_wxcommit=78aa2dc0ea7ce99dc19adc1140f74c3e2e3f3a26
source=(https://github.com/prusa3d/PrusaSlicer/archive/version_${_pkgver}/${pkgname}-${pkgver}.tar.gz
        https://github.com/prusa3d/wxWidgets/archive/${_wxcommit}/wxWidgets-${_wxcommit}.tar.gz
        https://patch-diff.githubusercontent.com/raw/prusa3d/PrusaSlicer/pull/10390.patch
        use-system-catch2.patch
        nanosvg-use-library-impl.patch)
sha256sums=('a15f68e3b18a047c8c9a18a9d91629d2c777be1932087684cf6d2332d0888e77'
            '20a7a6debad508c0b113cbfc908ca6b1d6786c77f925acad9353b78c34779495'
            '761ed80f95614fa7ef7ca3ce063b43f773cfe5a0e1aa6dd5e5fc9b6cfe8b9c63'
            '3639dc2d290dc9a7d16259e0b421f8d21f16fb4abe46bbb3fab9328930fc5758'
            '4aeed62c069b925fa80e4c91bc20d88d3c7bcd65df5ef1199d45bbdb1f9180d6')

prepare() {
  cd PrusaSlicer-version_${_pkgver}
  # sed -i "s/7.6.2/7.6.3/" src/occt_wrapper/CMakeLists.txt # Hack for opencascade 7.6.3
  # patch -Np1 -i "${srcdir}"/10390.patch
  # patch -Np1 -i "${srcdir}"/use-system-catch2.patch # Borrowed from Debian
  # patch -Np1 -i "${srcdir}"/nanosvg-use-library-impl.patch
}

build() {
  cd PrusaSlicer-version_${_pkgver}

  # TODO: This is super ugly right now: We're using 100% vendored deps but we
  # couldn't get this thing to build otherwise. We'll work on devendoring this
  # but for now we just wanted to get this release out to users.
  cd deps
  cmake \
      -G Ninja \
      -B build \
      -DDEP_WX_GTK3=ON
  ninja -C build
  cd ..

  mkdir build
  cd build
  cmake .. \
      -G Ninja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_PREFIX_PATH=$(pwd)/../deps/build/destdir/usr/local \
      -DSLIC3R_STATIC=1 \
      -DSLIC3R_FHS=ON \
      -DSLIC3R_PCH=OFF \
      -DSLIC3R_GTK=3
  ninja

  # cmake -B build2 \ #-S PrusaSlicer-version_${_pkgver} \
  #   -G Ninja \
  #   -DCMAKE_INSTALL_PREFIX=/usr \
  #   -DCMAKE_INSTALL_LIBDIR=lib \
  #   -DOPENVDB_FIND_MODULE_PATH=/usr/lib/cmake/OpenVDB \
  #   -DSLIC3R_FHS=ON \
  #   -DSLIC3R_PCH=OFF \
  #   -DSLIC3R_GTK=3 \
  #   -DCMAKE_PREFIX_PATH=$(pwd)/../deps/build/destdir/usr/local
  # cmake --build build2
    #-DwxWidgets_USE_STATIC=ON \
}

check() {
  cd PrusaSlicer-version_${_pkgver}/build

  ctest -v
}

package_prusa-slicer() {
  optdepends=('slicer-udev: 3D printer connection rules')

  cd PrusaSlicer-version_${_pkgver}
  # DESTDIR="$pkgdir" make install
  DESTDIR="$pkgdir" ninja -C build install

  # Desktop icons
  mkdir -p "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/
  ln -s /usr/share/PrusaSlicer/icons/PrusaSlicer.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/PrusaSlicer.svg
  ln -s /usr/share/PrusaSlicer/icons/PrusaSlicer-gcodeviewer.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/PrusaSlicer-gcodeviewer.svg

  # Split udev rule
  mv "${pkgdir}"/usr/lib/udev/ "$srcdir"
}

package_slicer-udev() {
  depends=() # Reset dependencies

  install -d "${pkgdir}"/usr/lib/
  mv udev "${pkgdir}"/usr/lib/
}
