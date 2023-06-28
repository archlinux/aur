# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgbase=prusa-slicer
pkgname=(prusa-slicer slicer-udev)
pkgver=2.6.0
_pkgver=2.6.0
pkgrel=3
pkgdesc="G-code generator for 3D printers (Prusa fork of Slic3r)"
arch=('x86_64')
url="https://github.com/prusa3d/PrusaSlicer"
license=('AGPL3')
# wx 3.2 is not supported yet https://github.com/prusa3d/PrusaSlicer/issues/8299
depends=('boost-libs' 'curl' 'glew' 'mpfr' 'nlopt' 'tbb' 'qhull' 'openvdb'
         'gtk3' 'libjpeg-turbo' 'opencascade')
makedepends=('cmake' 'boost' 'cereal' 'cgal' 'eigen' 'expat' 'gtest' 'libpng' 'systemd'
             'gst-plugins-base' 'glu' 'webkit2gtk' 'libnotify' 'ninja' 'nanosvg' 'git' 'catch2')
# prusa-slicer uses a patched wxWidgets and does not work with upstream, commit pinned in
# https://github.com/prusa3d/PrusaSlicer/blob/version_${pkgver}/deps/wxWidgets/wxWidgets.cmake
_wxcommit=78aa2dc0ea7ce99dc19adc1140f74c3e2e3f3a26
source=(https://github.com/prusa3d/PrusaSlicer/archive/version_${_pkgver}/${pkgname}-${pkgver}.tar.gz
        https://github.com/prusa3d/wxWidgets/archive/${_wxcommit}/wxWidgets-${_wxcommit}.tar.gz
        https://patch-diff.githubusercontent.com/raw/prusa3d/PrusaSlicer/pull/10390.patch
        use-system-catch2.patch
        fixCheckResizerFlags.patch::https://github.com/prusa3d/PrusaSlicer/commit/24a5ebd65c9d25a0fd69a3716d079fd1b00eb15c.patch
        nanosvg-use-library-impl.patch)
sha256sums=('a15f68e3b18a047c8c9a18a9d91629d2c777be1932087684cf6d2332d0888e77'
            '20a7a6debad508c0b113cbfc908ca6b1d6786c77f925acad9353b78c34779495'
            '761ed80f95614fa7ef7ca3ce063b43f773cfe5a0e1aa6dd5e5fc9b6cfe8b9c63'
            '3639dc2d290dc9a7d16259e0b421f8d21f16fb4abe46bbb3fab9328930fc5758'
            'b55f5db832e801d2c97820d8d60a2309500e783f4372f802b16b06352447e61d'
            '4aeed62c069b925fa80e4c91bc20d88d3c7bcd65df5ef1199d45bbdb1f9180d6')

prepare() {
  cd PrusaSlicer-version_${_pkgver}
  sed -i "s/7.6.2/7.6.3/" src/occt_wrapper/CMakeLists.txt # Hack for opencascade 7.6.3
  patch -Np1 -i "${srcdir}"/10390.patch
  patch -Np1 -i "${srcdir}"/use-system-catch2.patch # Borrowed from Debian
  patch -Np1 -i "${srcdir}"/fixCheckResizerFlags.patch
}

build() {
  echo "Building Prusa wxWidgets"
  cmake -B wxwidgets-build -S wxWidgets-${_wxcommit} \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX="${srcdir}"/wxwidgets-install \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DwxBUILD_TOOLKIT=gtk3 \
    -DwxUSE_MEDIACTRL=OFF \
    -DwxUSE_DETECT_SM=OFF \
    -DwxUSE_UNICODE=ON \
    -DwxUSE_UNICODE_UTF8=ON \
    -DwxUSE_OPENGL=ON \
    -DwxUSE_LIBPNG=sys \
    -DwxUSE_ZLIB=sys \
    -DwxUSE_NANOSVG=sys \
    -DwxUSE_NANOSVG_EXTERNAL=ON \
    -DwxUSE_NANOSVG_EXTERNAL_ENABLE_IMPL=ON \
    -DwxUSE_REGEX=OFF \
    -DwxUSE_LIBXPM=builtin \
    -DwxUSE_LIBJPEG=sys \
    -DwxUSE_LIBTIFF=sys \
    -DwxUSE_EXPAT=sys \
    -DwxUSE_LIBSDL=OFF \
    -DwxUSE_XTEST=OFF \
    -DwxUSE_GLCANVAS_EGL=OFF \
    -DwxUSE_WEBREQUEST=OFF
  ninja -C wxwidgets-build
  ninja -C wxwidgets-build install

  # -z muldefs allows for symbols to be overridden at link time.
  # In this case we have wxwidgets and prusa-slicer linked against nanosvg and
  # finally prusa-slicer needs to be linked against wxWidgets as well. As both
  # contain nanosvg symbols this usually fails.
  export LDFLAGS="$LDFLAGS -z muldefs"
  echo "Building PrusaSlicer"
  cmake -B build -S PrusaSlicer-version_${_pkgver} \
      -G Ninja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DOPENVDB_FIND_MODULE_PATH=/usr/lib/cmake/OpenVDB \
      -DCMAKE_PREFIX_PATH="${srcdir}"/wxwidgets-install \
      -DSLIC3R_FHS=ON \
      -DSLIC3R_PCH=OFF \
      -DSLIC3R_GTK=3 \
      -DwxWidgets_USE_STATIC=ON
  ninja -C build
}

check() {
  cd build

  ctest -v
}

package_prusa-slicer() {
  optdepends=('slicer-udev: 3D printer connection rules')

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
