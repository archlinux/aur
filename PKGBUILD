# Maintainer: Brian Thompson <brianrobt@pm.me>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: xiretza <xiretza+aur@xiretza.xyz>
# Maintainer: SecByShresth <Shresthpaul133@gmail.com>

pkgbase=rapidyaml
pkgname=('rapidyaml' 'python-rapidyaml')
pkgver=0.10.0
pkgrel=1
arch=('x86_64')
url="https://github.com/biojppm/rapidyaml"
license=('MIT')

# Dependencies required to BUILD the entire project (both C++ and Python parts)
# 'swig' and 'python' are mandatory here for the Python bindings.
makedepends=(
  'cmake'
  'git'
  'ninja'
  'swig'
  'python'
)
# Base runtime dependencies apply to ALL packages unless overridden
# in the package_* function. We only include essential shared libraries here.
depends=('gcc-libs' 'glibc')
# The provides array is empty here because the two virtual packages are defined 
# within their respective package_* functions.
provides=() 

# Source definition. Using git tags for the main project and its submodules.
# NOTE: The file "rapidyaml-python-bindings.patch" must be present 
# in the directory alongside this PKGBUILD, or defined as a URL.
source=(
  "rapidyaml::git+https://github.com/biojppm/rapidyaml.git#tag=v${pkgver}"
  "c4core::git+https://github.com/biojppm/c4core.git"
  "c4core-cmake::git+https://github.com/biojppm/cmake.git"
# "rapidyaml-python-bindings.patch" # Commented out due to "not found" error.
)
# Use SKIP for git sources; remember to run 'makepkg -g' if you switch to tarballs.
b2sums=('SKIP' 'SKIP' 'SKIP' # 'SKIP' for the patch file removed
# 'SKIP'
)

prepare() {
  # The git source clones are named after their definition in the source array
  cd rapidyaml

  # Configure and update the main submodule (c4core)
  git submodule init
  # FIX: Changed 'extern/c4core' to 'ext/c4core' to match the actual submodule path in v0.10.0
  git config submodule.ext/c4core.url "${srcdir}/c4core" 
  # protocol.file.allow=always is needed for makepkg to access the local clone
  git -c protocol.file.allow=always submodule update

  # Configure and update the nested submodule (c4core/cmake)
  # FIX: Changed 'extern/c4core' to 'ext/c4core'
  cd ext/c4core
  git submodule init
  git config submodule.cmake.url "${srcdir}/c4core-cmake"
  git -c protocol.file.allow=always submodule update

  cd ../..

  # Apply any necessary patch for the build system (e.g., Python pathing fixes)
  # NOTE: This patch command is commented out because makepkg failed to find the source file.
  # If the build fails without it, you must place 'rapidyaml-python-bindings.patch'
  # in the same directory as the PKGBUILD and uncomment these lines.
  # patch -p1 < "${srcdir}/rapidyaml-python-bindings.patch"
}

build() {
  # Standard CMake build setup for a release build
  cmake -B build -S rapidyaml -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DRYML_DEV=OFF \
    -DRYML_BUILD_API=ON \
    -DRYML_LANG_PYTHON=ON \
    -DRYML_DEFAULT_CALLBACKS=ON \
    -DRYML_DEFAULT_CALLBACK_USES_EXCEPTIONS=ON
  
  cmake --build build
}

# -----------------------------------------------------------------------------
# C++ Library Package
# -----------------------------------------------------------------------------
package_rapidyaml() {
  pkgdesc="A fast YAML parser and emitter for C++"
  # This package provides the base library and development headers
  provides=('rapidyaml' 'libryml.so')
  # Dependencies are inherited from the main 'depends' array (gcc-libs, glibc)
  
  DESTDIR="${pkgdir}" cmake --install build

  # FIX: The CMake install step incorrectly puts Python bindings into this C++ package.
  # We move them temporarily out of the C++ package's staging directory so that 
  # package_python-rapidyaml can collect them.
  # The files are installed directly to ${pkgdir}/usr/
  mv "${pkgdir}/usr/_ryml.so" "${srcdir}/_ryml.so"
  mv "${pkgdir}/usr/ryml.py" "${srcdir}/ryml.py"
  
  # Install license
  install -Dm644 rapidyaml/LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# -----------------------------------------------------------------------------
# Python Bindings Package
# -----------------------------------------------------------------------------
package_python-rapidyaml() {
  pkgdesc="Python bindings for rapidyaml (via SWIG)"
  
  # CRITICAL FIX: The Python package MUST depend on the C++ library package
  # to ensure the shared objects are present at runtime.
  depends=('python' 'rapidyaml') 
  provides=('python-rapidyaml')

  # Determine the Python site-packages directory
  _pyver=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  _pydir="${pkgdir}/usr/lib/python${_pyver}/site-packages/rapidyaml"

  # FIX: Retrieve the files that were temporarily moved out of the C++ package
  # in package_rapidyaml() and install them into the correct site-packages path.
  install -d "${_pydir}"
  
  # Check if temporary files exist (they should, if package_rapidyaml ran correctly)
  if [[ -f "${srcdir}/_ryml.so" && -f "${srcdir}/ryml.py" ]]; then
    mv "${srcdir}/_ryml.so" "${_pydir}/"
    mv "${srcdir}/ryml.py" "${_pydir}/"
    # Create a basic __init__.py for the package structure
    touch "${_pydir}/__init__.py"
  else
    # This error should now only occur if the first package function failed to move the files.
    echo "ERROR: Could not find Python binding files in temporary location."
    exit 1
  fi

  # Install license
  install -Dm644 rapidyaml/LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
