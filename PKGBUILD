# Maintainer: taotieren <admin@taotieren.com>

pkgbase=libtslitex-git
pkgname=(libtslitex-git python-libtslitex-git)
pkgver=0.0.1.alpha1.r74.gb2ddcbf
pkgrel=1
pkgdesc='This is a C library to interface with the LiteX Firmware on Thunderscope over PCIe'
arch=($CARCH)
url='https://github.com/EEVengers/libtslitex'
license=('BSD-2-Clause')
replaces=()
depends=(
  glibc
  json-c
  zlib
)
makedepends=(
  cmake
  git
  pkgconf

  cython
  python-numpy
  python-build
  python-installer
  python-wheel
  python-setuptools
  python-pipx
)
checkdepends=()
optdepends=()
source=("${pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgbase}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
  git -C "${srcdir}/${pkgbase}" clean -dfx
}

build() {
  cd "${srcdir}"/${pkgbase}/

  # see：https://wiki.archlinux.org/title/CMake_package_guidelines 
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -Wno-dev \
    -B build 

  cmake --build build

  cmake --build build -t PyBindings
}

# check() {
#   cd "${srcdir}"/${pkgbase}/
#   ctest --test-dir build --output-on-failure
# }

package_libtslitex-git() {
  # pkgdesc
  provides=(
    ${pkgname%-git}
  )
  conflicts=(
    ${pkgname%-git}
  )
  depends=(
    glibc
  )
  arch=($CARCH)

  cd "${srcdir}"/${pkgbase}
  install -vDm644 build/artifacts/libtslitex/libtslitex* -t "${pkgdir}/usr/lib/"
  install -vDm644 build/artifacts/libtslitex/include/* -t "${pkgdir}/usr/include/"
  install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_python-libtslitex-git() {
  pkgdesc+=" - python module"
  provides=(
    ${pkgname%-git}
  )
  conflicts=(
    ${pkgname%-git}
  )
  depends=(
    glibc
    json-c
    zlib
  )
  arch=($CARCH)

  cd "${srcdir}"/${pkgbase}/
  python -m installer --destdir="${pkgdir}" build/bindings/python/dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
