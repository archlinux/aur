# Maintainer: Daniel Liland <celsiuss@await.sh>

pkgbase=preflight
pkgname=preflight
pkgver=0.9.5
pkgrel=1
pkgdesc="A modern slicer built for precision and performance. "
arch=('x86_64')
url="https://github.com/prusa3d/PrusaSlicer"
license=('AGPL-3.0-only')
depends=('gtk3' 'webkit2gtk-4.1' 'mpfr' 'gmp' 'blosc' 'boost-libs' 'curl'
  'expat' 'libjpeg' 'nanosvg' 'nlopt' 'opencascade' 'opencsg'
  'openexr' 'openssl' 'openvdb' 'libpng' 'qhull' 'tbb' 'libtiff'
  'wxwidgets-gtk3' 'z3' 'zlib' 'gcc-libs' 'glibc' 'dbus' 'imath'
  'glib2' 'pango' 'hicolor-icon-theme' 'imath')
makedepends=('cmake' 'systemd' 'glu' 'ninja' 'git' 'python' 'boost' 'catch2'
  'cereal' 'cgal' 'eigen' 'nlohmann-json' 'glad')
options=('!makeflags')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/oozebot/preFlight/archive/refs/tags/v${pkgver}.tar.gz"
  0001-fix-building-for-arch.patch
  0002-occt-wrapper-patch.patch)
sha256sums=('838af4b32b33ad2d1ca347f91865143b703394f2c0e13cace6bf8ce982a51ce4'
  '0985a92b9643c617159a9ded1eed28b6bba1c3a71aae42fbd6e76b210f3491a6'
  '1c282fa3443bcf5035278a8d4fec9ce08f57a04e7f45699dc9cdc95d2a79d26e')

_dir="preFlight-$pkgver"

prepare() {
  cd ${_dir}
  # We want to use the system OpenVDB
  rm cmake/modules/FindOpenVDB.cmake

  # Dynamically link system OpenCASCADE
  sed -i -e 's/\(OpenCASCADE\).*\(REQUIRED\)/\1 \2/
             /TK/d
             s/^\(set(OCCT_LIBS\)/\1 TKDESTEP/' \
    src/occt_wrapper/CMakeLists.txt

  patch -Np1 -i "${srcdir}/0001-fix-building-for-arch.patch"
  patch -Np1 -i "${srcdir}/0002-occt-wrapper-patch.patch"

  # Do some minimal branding to indicate that user is running the official
  # Arch Linux package version and to direct them to the proper bug reporting
  # guidelines.
  #sed -i -e 's;https://github.com/prusa3d/slic3r/issues/new;https://wiki.archlinux.org/title/PrusaSlicer#Issue_Reporting;' src/slic3r/GUI/MainFrame.cpp
  #sed -i -e "s;UNKNOWN;arch${pkgrel};" version.inc
}

build() {
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  # Fix crashes
  export CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS/}

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
    -S ${_dir}/deps \
    -B deps_${pkgver} \
    -DpreFlight_deps_PACKAGE_EXCLUDES="Blosc;Boost;Catch2;Cereal;CGAL;CURL;Eigen;EXPAT;GLEW;GMP;JPEG;json;MPFR;NanoSVG;NLopt;OCCT;OpenCSG;OpenEXR;OpenSSL;OpenVDB;PNG;Qhull;TBB;TIFF;wxWidgets;z3;ZLIB"
  ninja -C deps_${pkgver}

  cmake \
    -G Ninja \
    -S ${_dir} \
    -B build_${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_PREFIX_PATH="$(pwd)/deps_${pkgver}/destdir/usr/local" \
    -DCMAKE_FIND_PACKAGE_PREFER_CONFIG=ON \
    -DSLIC3R_FHS=ON \
    -DSLIC3R_PCH=OFF \
    -DSLIC3R_GTK=3 \
    -DSLIC3R_PCH=1 \
    -DCMAKE_CXX_FLAGS="-Wno-template-body"
  ninja -C build_${pkgver}
}

check() {
  cd build_${pkgver}

  ctest
}

package() {
  optdepends=('slicer-udev: 3D printer connection rules')

  DESTDIR="$pkgdir" ninja -C build_${pkgver} install

  # Desktop icons
  mkdir -p "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/

  # Split udev rule
  mv "${pkgdir}"/usr/lib/udev/ "$srcdir"
}
