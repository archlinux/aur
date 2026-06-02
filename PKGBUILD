# Maintainer: Martin Pollow <martin dot pollow at gmail dot com>

pkgname=python-pyroomacoustics
_pyname=pyroomacoustics
pkgver=0.10.1
pkgrel=1
pkgdesc='Package for audio signal processing for indoor applications and beamforming algorithms'
arch=('x86_64')
url="https://github.com/LCAV/pyroomacoustics"
license=('MIT')
depends=('python-numpy' 'python-scipy')
makedepends=('python-setuptools' 'python-setuptools-scm' 'cmake' 'cython' 'pybind11' 'eigen' 'nanoflann')
optdepends=('libsamplerate: for resampling signals'
    'python-soxr: for resampling signals'
    'python-matplotlib: to create graphs and plots'
    'python-sounddevice: to play sound samples')
source=(${_pyname}-${pkgver}.tar.gz::"https://github.com/LCAV/pyroomacoustics/archive/v${pkgver}.tar.gz")
sha256sums=('1700bbef779ab1975ff760e5c5f3edc7b672917876f0314621fb936537bd9ccd')

prepare() {
  # Upstream's external/CMakeLists.txt pulls eigen, nanoflann and pybind11 via
  # FetchContent (git clone of pinned tags) at build time. That needs network
  # access and 'git' inside build(), and ignores the system libraries. Replace
  # it with find_package() so the build is offline/reproducible and uses the
  # eigen/nanoflann/pybind11 makedepends. The consumed targets are Eigen3::Eigen,
  # nanoflann::nanoflann and pybind11_add_module (see CMakeLists.txt); if a
  # future release adds a dependency here, the build fails loudly.
  cat > "$srcdir/$_pyname-$pkgver/external/CMakeLists.txt" <<'EOF'
# external/ is pulled in via add_subdirectory(), so make the imported targets
# GLOBAL; otherwise Eigen3::Eigen / Python::Module / pybind11 are not visible in
# the parent scope where libroom is defined (FetchContent created them globally).
set(CMAKE_FIND_PACKAGE_TARGETS_GLOBAL TRUE)
find_package(Eigen3 REQUIRED)
find_package(nanoflann REQUIRED)
# The main CMakeLists sets PYBIND11_FINDPYTHON ON, so pybind11_add_module needs
# the Python::Module target; request Development.Module explicitly here.
find_package(Python REQUIRED COMPONENTS Interpreter Development.Module)
find_package(pybind11 CONFIG REQUIRED)
EOF
}

build() {
  cd "$srcdir/$_pyname-$pkgver"
  # Upstream uses setuptools_scm (write_to=pyroomacoustics/version.py); the
  # release tarball has no git metadata, so tell it the version explicitly,
  # otherwise the build falls back to 0.0.0 and never writes version.py,
  # which makes "import pyroomacoustics" fail.
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python setup.py build_ext --inplace
  python setup.py build
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
  install -m0644 -D "$srcdir/$_pyname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chmod -R a+r "$pkgdir/usr"
}
