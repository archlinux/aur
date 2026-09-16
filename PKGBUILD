# Maintainer: Jeff Cook <jeff@jeffcook.io>

pkgname=bosphorus-git
_pkgname=bosphorus
pkgver=3.2.0.r5.g52d0f19
pkgrel=1
pkgdesc='ANF simplifier and solver, and ANF-to-CNF converter'
arch=('x86_64')
url='https://github.com/meelgroup/bosphorus'
license=('MIT')
depends=('boost-libs' 'brial' 'cryptominisat' 'gcc-libs' 'glibc' 'm4ri')
makedepends=('boost' 'cmake' 'git' 'pkgconf' 'python')
checkdepends=('llvm')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+https://github.com/meelgroup/bosphorus.git"
  'cnf-utils::git+https://github.com/msoos/cnf-utils.git'
  'OutputCheck::git+https://github.com/msoos/OutputCheck.git'
)
b2sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --always \
    | sed -E 's#^release/##; s/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git submodule init
  git config submodule.utils/cnf-utils.url "${srcdir}/cnf-utils"
  git config submodule.utils/OutputCheck.url "${srcdir}/OutputCheck"
  git -c protocol.file.allow=always submodule update
}

build() {
  # cryptominisat5_DIR must be set: empty means FetchContent of GitHub master.
  # CMAKE_BUILD_TYPE=None keeps makepkg CFLAGS/CXXFLAGS; skip install RPATH so
  # we do not ship the old extra package's broken RUNPATH of /usr/lib/libz.so.
  cmake -B build -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Dcryptominisat5_DIR=/usr \
    -DENABLE_TESTING=ON \
    -DCMAKE_SKIP_INSTALL_RPATH=ON \
    -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON \
    -DPython3_EXECUTABLE=/usr/bin/python \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_pkgname}"/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
