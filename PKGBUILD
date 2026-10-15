# Maintainer: Daniel Liland <celsiuss@await.sh>

pkgname=preflight
pkgver=1.4.1
pkgrel=1
pkgdesc="A modern slicer built for precision and performance. "
arch=('x86_64')
url="https://github.com/oozebot/preFlight"
license=('AGPL-3.0-only')
depends=('gtk3' 'webkit2gtk-4.1' 'boost-libs' 'curl' 'expat' 'libjpeg-turbo'
  'nanosvg' 'nlopt' 'opencascade' 'libpng' 'qhull' 'tbb'
  'wxwidgets-gtk3' 'wxwidgets-common' 'z3' 'zlib' 'libgcc' 'libstdc++' 'glibc' 'dbus' 'fontconfig'
  'cairo' 'libglvnd' 'libx11' 'glib2' 'pango' 'hicolor-icon-theme' 'python')
makedepends=('cmake' 'glu' 'ninja' 'git' 'boost' 'catch2'
  'cereal' 'cgal' 'eigen' 'nlohmann-json' 'glad' 'pybind11')
options=('!makeflags')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/oozebot/preFlight/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7de2b4ed1769255363a11e354df1867c27fefb821ecff1286d167eeb8942f95d')

_dir="preFlight-$pkgver"

prepare() {
  cd ${_dir}

  # Dynamically link system OpenCASCADE
  sed -i -e 's/\(OpenCASCADE\).*\(REQUIRED\)/\1 \2/
             /TK/d
             s/^\(set(OCCT_LIBS\)/\1 TKDESTEP/' \
    src/step/CMakeLists.txt
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
    -DCMAKE_BUILD_TYPE=Release \
    -DpreFlight_deps_PACKAGE_EXCLUDES="Boost|Catch2|Cereal|CGAL|CURL|Eigen|EXPAT|JPEG|json|NanoSVG|NLopt|OCCT|OpenSSL|PNG|pybind11|PythonRuntime|Qhull|TBB|TBBMallocProxy|wxWidgets|z3|ZLIB"
  ninja -C deps_${pkgver}

  cmake \
    -G Ninja \
    -S ${_dir} \
    -B build_${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_PREFIX_PATH="$(pwd)/deps_${pkgver}/destdir/usr/local" \
    -DCMAKE_FIND_PACKAGE_PREFER_CONFIG=ON \
    -DPREFLIGHT_FHS=ON \
    -DPREFLIGHT_GTK=3 \
    -DPREFLIGHT_PCH=1 \
    -DPREFLIGHT_STATIC=0 \
    -DPREFLIGHT_ENC_CHECK=OFF \
    -DCMAKE_CXX_FLAGS="-Wno-template-body"
  ninja -C build_${pkgver}
}

package() {
  optdepends=('slicer-udev: 3D printer connection rules'
              'python-numpy: numpy_analysis.py preprocessor sample')

  DESTDIR="$pkgdir" ninja -C build_${pkgver} install
}
