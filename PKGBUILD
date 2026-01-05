# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Robert Schiele <rschiele@gmail.com>

pkgbase=prusa-slicer
pkgname=(prusa-slicer slicer-udev)
pkgver=2.9.4
pkgrel=3
pkgdesc="G-code generator for 3D printers (Prusa fork of Slic3r)"
arch=('x86_64')
url="https://github.com/prusa3d/PrusaSlicer"
license=('AGPL-3.0-only')
depends=('gtk3' 'webkit2gtk-4.1' 'mpfr' 'gmp' 'blosc' 'boost-libs' 'curl'
         'expat' 'glew' 'libjpeg' 'nanosvg' 'nlopt' 'opencascade' 'opencsg'
         'openexr' 'openssl' 'openvdb' 'libpng' 'qhull' 'tbb' 'libtiff'
         'wxwidgets-gtk3' 'z3' 'zlib')
makedepends=('cmake' 'systemd' 'glu' 'ninja' 'git' 'python' 'boost' 'catch2'
             'cereal' 'cgal' 'eigen3' 'nlohmann-json')
options=('!makeflags')
source=(https://github.com/prusa3d/PrusaSlicer/archive/version_${pkgver/_/-}/${pkgname}-${pkgver/_/-}.tar.gz
        fixes_boost.patch
        fixes_cgal.patch
        fixes_nanosvg.patch
        integrate_occtwrapper.patch
        boost-1.88.patch
        boost-1.89.patch
        allow_wayland.patch)
sha256sums=('4f2d8d30561047a82f63ec23eb530f996b08d599c0d9ecbaebaeb44aa4a1c849'
            '9cd41e83bf05f33b60a5ec99a166f10ac24a4f970dc7853ff67a9635fe21bdb7'
            '42b60b5d3c5912569feee7a7fd886ad98581237002da242f211a651005e3a911'
            'bd5d5b2cdc60df0add095dc7b77643022a7245b74dc9d7720fdc50eb203dba08'
            'a09fb8f10dde4ea04c663a410aac9586b6461c60e5bb3b828277a0294b8be223'
            '75d240f20ac5a9da8a780500dd9756af8c6d13edddaf25ff99673d42eabf3d7a'
            '730fe9b67d69dffd8f02ba92e13263cd002cc597204d8b718deeb76ff25f43c7'
            '7f7c27900ea9f7d944cd9ce26ee87b17c582bec6dad7d7e52967d28be0dd8708')

prepare() {
  cd PrusaSlicer-version_${pkgver/_/-}
  # We want to use the system OpenVDB
  rm cmake/modules/FindOpenVDB.cmake
  # Dynamically link system OpenCASCADE
  sed -i -e 's/\(OpenCASCADE\).*\(REQUIRED\)/\1 \2/
             /TK/d
             s/^\(set(OCCT_LIBS\)/\1 TKDESTEP/' \
      src/occt_wrapper/CMakeLists.txt
  patch -Np1 -i "${srcdir}"/fixes_boost.patch
  patch -Np1 -i "${srcdir}"/fixes_cgal.patch
  patch -Np1 -i "${srcdir}"/fixes_nanosvg.patch
  patch -Np1 -i "${srcdir}"/integrate_occtwrapper.patch
  patch -Np1 -i "${srcdir}"/boost-1.88.patch
  patch -Np1 -i "${srcdir}"/boost-1.89.patch
  patch -Np1 -i "${srcdir}"/allow_wayland.patch
  # Do some minimal branding to indicate that user is running the official
  # Arch Linux package version and to direct them to the proper bug reporting
  # guidelines.
  sed -i -e 's;https://github.com/prusa3d/slic3r/issues/new;https://wiki.archlinux.org/title/PrusaSlicer#Issue_Reporting;' src/slic3r/GUI/MainFrame.cpp
  sed -i -e "s;UNKNOWN;arch${pkgrel};" version.inc
}

build() {
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  # Use all packages currently available in extra from the system.
  # While upstream does not provide any support if we are using system deps,
  # the alignment of ABI incompatibiities seem more challenging. Additionally,
  # using the vendor deps would create extra responsibility in this package to
  # apply security fixes for issues fixed in the system deps.
  # Therefore we should instead explain how to properly verify issues against
  # the upstream Flatpak to decide whether they are upstream issues to be
  # reported there or are packaging issues we should look for by ourselves.
  # This approach should also fix recurring ABI issue. See
  # https://gitlab.archlinux.org/archlinux/packaging/packages/prusa-slicer/-/issues/2
  cmake \
      -G Ninja \
      -S PrusaSlicer-version_${pkgver/_/-}/deps \
      -B deps_${pkgver} \
      -DPrusaSlicer_deps_PACKAGE_EXCLUDES="Blosc;Boost;Catch2;Cereal;CGAL;CURL;Eigen;EXPAT;GLEW;GMP;JPEG;json;MPFR;NanoSVG;NLopt;OCCT;OpenCSG;OpenEXR;OpenSSL;OpenVDB;PNG;Qhull;TBB;TIFF;wxWidgets;z3;ZLIB"
  ninja -C deps_${pkgver}

  cmake \
      -G Ninja \
      -S PrusaSlicer-version_${pkgver/_/-} \
      -B build_${pkgver} \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_PREFIX_PATH=$(pwd)/deps_${pkgver}/destdir/usr/local \
      -DCMAKE_FIND_PACKAGE_PREFER_CONFIG=ON \
      -DSLIC3R_FHS=ON \
      -DSLIC3R_PCH=OFF \
      -DSLIC3R_GTK=3
  ninja -C build_${pkgver}
}

check() {
  cd build_${pkgver}

  ctest
}

package_prusa-slicer() {
  optdepends=('slicer-udev: 3D printer connection rules')

  DESTDIR="$pkgdir" ninja -C build_${pkgver} install

  # Desktop icons
  mkdir -p "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/
  ln -s /usr/share/PrusaSlicer/icons/PrusaSlicer.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/PrusaSlicer.svg
  ln -s /usr/share/PrusaSlicer/icons/PrusaSlicer-gcodeviewer.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/PrusaSlicer-gcodeviewer.svg

  # Split udev rule
  mv "${pkgdir}"/usr/lib/udev/ "$srcdir"
}

package_slicer-udev() {
  pkgdesc="udev rules for Slic3r-like software"
  depends=() # Reset dependencies

  install -d "${pkgdir}"/usr/lib/
  mv udev "${pkgdir}"/usr/lib/
}
