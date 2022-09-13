# Maintainer: Wilhelm Schuster <aur [aT] rot 13 doT io>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=prusa-slicer-gtk2
pkgver=2.4.2
pkgrel=2
pkgdesc="G-code generator for 3D printers (built with GTK2)"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/prusa3d/PrusaSlicer"
license=(AGPL3)
# wx 3.2 is not supported yet https://github.com/prusa3d/PrusaSlicer/issues/8299
depends=(boost-libs curl glew tbb mpfr nlopt qhull openvdb slicer-udev
         gtk2 libjpeg-turbo) # wxwidgets-gtk2
makedepends=(cmake boost cereal cgal eigen expat gtest systemd libpng
             gst-plugins-base glu libnotify) # libigl not detected?
checkdepends=(catch2)
replaces=(slic3r-prusa3d)
conflicts=('prusa-slicer')
_wxcommit=489f6118256853cf5b299d595868641938566cdb
source=(${url}/archive/version_${pkgver}/${pkgname}-${pkgver}.tar.gz
        https://github.com/prusa3d/wxWidgets/archive/${_wxcommit}/wxWidgets-${_wxcommit}.tar.gz
        ${pkgname}-fix-lcereal-p1.patch::${url}/commit/0ffcfd8393457fd035576436752267c9a1e6bbcc.patch
        ${pkgname}-fix-lcereal-p2.patch::${url}/commit/cc788ebb643b6d4048f3550235ac3e9d3697ada0.patch
        ${pkgname}-boost-1.79-p1.patch::${url}/commit/408e56f0390f20aaf793e0aa0c70c4d9544401d4.patch
        ${pkgname}-boost-1.79-p2.patch::${url}/commit/926ae0471800abd1e5335e251a5934570eb8f6ff.patch
        ${pkgname}-boost-1.79-p3.patch::${url}/commit/436a454b2e5dc823c6a878b836f82f56922e8834.patch
        use-system-catch2.patch)
sha256sums=('ac3a77212260e8d0baf9df027c29e0ae965bc77f371e59fd27b8fe103ebb1f23'
            'b4f0f6aea13b779e87c227dd7a062a6c2af4cad2f4e92b1272e43e2d45eedf51'
            'e110c3ca7cd8034f878b22e4992c442cc200a7c001d570dc2c9eef8a6af41786'
            'eb5bce1cb5b3970a1aa92fd9b7fe1943da4d7bb2c9908890811090914fef91c4'
            'a1cddcfb276f2da60cd91226e09ba9869b861cab3108425c9d5c1851e8009e41'
            'c84babe994db99856abdc62be65f7cd1ff546bebffd928c0b79a434952ec4a6d'
            '0158f5e22face6174992e9d4bfbf90ca8d79100fdc230f5540c6f01d1bebf6a0'
            '3639dc2d290dc9a7d16259e0b421f8d21f16fb4abe46bbb3fab9328930fc5758')

prepare() {
  cd PrusaSlicer-version_${pkgver}

  patch -p1 < ../use-system-catch2.patch # Borrowed from Debian
  patch -p1 < ../${pkgname}-fix-lcereal-p1.patch
  patch -p1 < ../${pkgname}-fix-lcereal-p2.patch
  patch -p1 < ../${pkgname}-boost-1.79-p1.patch
  patch -p1 < ../${pkgname}-boost-1.79-p2.patch
  patch -p1 < ../${pkgname}-boost-1.79-p3.patch || :
}

build() {
  cmake -B deps -S wxWidgets-${_wxcommit} \
    -DCMAKE_INSTALL_PREFIX="${srcdir}"/deps/destdir/usr/local \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DwxBUILD_TOOLKIT=gtk2 \
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
    -DSLIC3R_GTK=2 \
    -DwxWidgets_USE_STATIC=ON \
    -DCMAKE_PREFIX_PATH="${srcdir}"/deps/destdir/usr/local
  make -C build
}

check() {
  cd build
  ctest -v
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  # Desktop icons
  mkdir -p "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/
  ln -s /usr/share/PrusaSlicer/icons/PrusaSlicer.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/PrusaSlicer.svg
  ln -s /usr/share/PrusaSlicer/icons/PrusaSlicer-gcodeviewer.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/PrusaSlicer-gcodeviewer.svg

  # Remove udev rules since we rely on official package
  rm -rf "${pkgdir}"/usr/lib/udev
}
