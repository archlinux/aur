# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgbase=prusa-slicer
pkgname=(prusa-slicer slicer-udev)
pkgver=2.5.0
pkgrel=5
pkgdesc="G-code generator for 3D printers (Prusa fork of Slic3r)"
arch=(x86_64)
url="https://github.com/prusa3d/PrusaSlicer"
license=(AGPL3)
# wx 3.2 is not supported yet https://github.com/prusa3d/PrusaSlicer/issues/8299
depends=(boost-libs curl glew mpfr nlopt tbb qhull openvdb
         gtk3 libjpeg-turbo opencascade) # wxwidgets-gtk3
makedepends=(cmake boost cereal cgal eigen expat gtest libpng systemd
             gst-plugins-base glu webkit2gtk libnotify) # libigl not detected?
checkdepends=(catch2)
replaces=(slic3r-prusa3d)
# prusa-slicer uses a patched wxWidgets and does not work with upstream, commit pinned in
# https://github.com/prusa3d/PrusaSlicer/blob/version_${pkgver}/deps/wxWidgets/wxWidgets.cmake
_wxcommit=489f6118256853cf5b299d595868641938566cdb
source=(${url}/archive/version_${pkgver}/${pkgname}-${pkgver}.tar.gz
        https://github.com/prusa3d/wxWidgets/archive/${_wxcommit}/wxWidgets-${_wxcommit}.tar.gz
        ${pkgname}-fix-lcereal-p1.patch
        ${pkgname}-fix-lcereal-p2.patch
        ${pkgname}-boost-1.79-p1.patch
        ${pkgname}-boost-1.79-p2.patch
        ${pkgname}-boost-1.79-p3.patch
        ${pkgname}-uniqueptr.patch
        use-system-catch2.patch)
sha256sums=('dbbf3e10c812d1dc7bae4bd6879e60f864d763b2738b099dd34b9636d0e5eb6a'
            'b4f0f6aea13b779e87c227dd7a062a6c2af4cad2f4e92b1272e43e2d45eedf51'
            'fcccc601d893fc1988081e05fefe30f5561f1ef47aaf516295b31127326a4ae0'
            '0c1084277bc6b9f0e7c28d0e47f98a3a195cdfbb3f0fe973dcb22bf4e6b24670'
            'a1cddcfb276f2da60cd91226e09ba9869b861cab3108425c9d5c1851e8009e41'
            'c84babe994db99856abdc62be65f7cd1ff546bebffd928c0b79a434952ec4a6d'
            '0158f5e22face6174992e9d4bfbf90ca8d79100fdc230f5540c6f01d1bebf6a0'
            '971c1cfd696846262b326ca58c41df9c82c17320632a29cc415124739b72c254'
            '3639dc2d290dc9a7d16259e0b421f8d21f16fb4abe46bbb3fab9328930fc5758')

prepare() {
  cd PrusaSlicer-version_${pkgver}
  sed -i "s/7.6.2/7.6.3/" src/occt_wrapper/CMakeLists.txt # Hack for opencascade 7.6.3
  patch -p1 < ../use-system-catch2.patch # Borrowed from Debian
  patch -p1 < ../${pkgname}-fix-lcereal-p1.patch
  patch -p1 < ../${pkgname}-fix-lcereal-p2.patch
  patch -p1 < ../${pkgname}-boost-1.79-p1.patch
  patch -p1 < ../${pkgname}-boost-1.79-p2.patch
  patch -p1 < ../${pkgname}-boost-1.79-p3.patch || true
  patch -p1 < ../${pkgname}-uniqueptr.patch
}

build() {
  cmake -B deps -S wxWidgets-${_wxcommit} \
    -DCMAKE_INSTALL_PREFIX="${srcdir}"/deps/destdir/usr/local \
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
    -DwxUSE_REGEX=builtin \
    -DwxUSE_LIBJPEG=sys \
    -DwxUSE_LIBTIFF=sys \
    -DwxUSE_EXPAT=sys \
    -DwxUSE_LIBLZMA=sys \
    -DwxUSE_LIBSDL=OFF \
    -DwxUSE_XTEST=OFF
  cmake --build deps
  cmake --install deps
  cmake -B build -S PrusaSlicer-version_${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DOPENVDB_FIND_MODULE_PATH=/usr/lib/cmake/OpenVDB \
    -DSLIC3R_FHS=ON \
    -DSLIC3R_PCH=OFF \
    -DSLIC3R_GTK=3 \
    -DwxWidgets_USE_STATIC=ON \
    -DCMAKE_PREFIX_PATH="${srcdir}"/deps/destdir/usr/local
  make -C build
}

check() {
  cd build

  ctest -v
}

package_prusa-slicer() {
  optdepends=('slicer-udev: 3D printer connection rules')

  make -C build DESTDIR="${pkgdir}" install

  # Desktop icons
  mkdir -p "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/
  ln -s /usr/share/PrusaSlicer/icons/PrusaSlicer.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/PrusaSlicer.svg
  ln -s /usr/share/PrusaSlicer/icons/PrusaSlicer-gcodeviewer.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/PrusaSlicer-gcodeviewer.svg

  # Split udev rule
  mv "${pkgdir}"/usr/lib/udev/ .
}

package_slicer-udev() {
  depends=() # Reset dependencies

  install -d "${pkgdir}"/usr/lib/
  mv udev "${pkgdir}"/usr/lib/
}
