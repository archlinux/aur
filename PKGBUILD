# Maintainer: taotieren <admin@taotieren.com>

pkgbase=openarm-can
pkgname=(openarm-can python-openarm-can)
pkgver=1.2.7
pkgrel=1
pkgdesc='A C++ library for CAN communication with OpenArm robotic hardware, supporting Damiao motors over CAN/CAN-FD interfaces.'
arch=($CARCH)
url='https://github.com/enactic/openarm_can'
license=('Apache-2.0')
replaces=()
depends=(
  sh
  libgcc
  libstdc++
  glibc
  python
  python-can
  python-numpy
)
makedepends=(
  cmake
  git
  gtest
  ninja
  pkgconf

  nanobind
  python-build
  python-installer
  python-wheel
  python-scikit-build-core
  python-setuptools
)
checkdepends=()
optdepends=()
source=("${pkgbase}::git+${url}.git#tag=${pkgver}")
sha256sums=('4c87689f99b9deb2ad55db464ef8c44c688923e267c715b1944f738d343cf43c')

prepare() {
  git -C "${srcdir}/${pkgbase}" clean -dfx
}

build() {
  cd "${srcdir}"/${pkgbase}/

  # see：https://wiki.archlinux.org/title/CMake_package_guidelines 
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -Wno-dev \
    -B build \
    -G Ninja

  ninja -C build
  cd "${srcdir}/${pkgbase}/python"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "${srcdir}"/${pkgbase}/
#   ctest --test-dir build --output-on-failure
# }

package_openarm-can() {
  # pkgdesc
  provides=(
    ${pkgname}
  )
  conflicts=(
    ${pkgname}
  )
  depends=(
    sh
    libgcc
    libstdc++
    glibc
    python
    python-can
    python-numpy
    python-openarm-can
  )
  arch=($CARCH)

  cd "${srcdir}"/${pkgbase}
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_python-openarm-can() {
  pkgdesc="This is the Python bindings of OpenArm CAN library."
  provides=(
    ${pkgname}
  )
  conflicts=(
    ${pkgname}
  )
  depends=(
    libgcc
    libstdc++
    glibc
  )
  arch=($CARCH)

  cd "${srcdir}/${pkgbase}/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
