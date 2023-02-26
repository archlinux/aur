# Maintainer: dreieck
# Contributor: Tony Lambiris

_pkgname=nvtop
pkgname="${_pkgname}-nosystemd-git"
pkgver=3.0.1+29.r341.20230225.d3dddbd
pkgrel=1
pkgdesc="GPUs process monitoring for AMD, Intel and NVIDIA. Without systemd dependencies. Latest Git checkout."
arch=('x86_64')
url="https://github.com/Syllo/nvtop"
license=('GPL3')
depends=(
  'ncurses'
  'libdrm'
  'libudev'
  #'systemd-libs'
)
makedepends=(
  'cmake'
  'git'
  'gtest'
  'libdrm'
  #'systemd'
)
checkdepends=()
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-nosystemd=${pkgver}"
  "${_pkgname}-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+https://github.com/Syllo/nvtop.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

prepare() {
  cd "${_pkgname}"

  git log > "${srcdir}/git.log"
}

check() {
  cd "${_pkgname}"

  make test
  # ./tests/interfaceTests
}

build() {
  cd "${_pkgname}"

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DAMDGPU_SUPPORT=ON \
    -DINTEL_SUPPORT=ON \
    -DNVIDIA_SUPPORT=ON \
    -DUSE_LIBUDEV_OVER_LIBSYSTEMD=ON \
    -DSYSTEMD_INCLUDE_DIR= \
    -DSYSTEMD_LIBRARY= \
    .

  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR="${pkgdir}/" install

  for _docfile in "${srcdir}/git.log" README.markdown; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done

  install -Dvm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
