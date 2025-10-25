# Maintainer: dreieck

_pkgname=libenvpp
pkgname=${_pkgname}-git
pkgver=1.5.1+2.r203.20251025.c60ebe4
pkgrel=1
pkgdesc='Modern C++ Library for Handling Environment Variables.'
arch=(
  'i686'
  'x86_64'
  'aarch64'
  'armv7h'
  'armv8h'
)
url="https://github.com/ph3at/libenvpp"
license=('Apache-2.0')
source=(
  "${_pkgname}::git+${url}.git#branch=cmake-reuse-deps"
)
depends=(
  'gcc-libs'
  'glibc'
  'libfmt.so'
)
makedepends=(
  'cmake'
  'git'
  'catch2'
  'fmt'
)
optdepends=()
sha256sums=(
  'SKIP'
)
conflicts=(
  "${_pkgname}"
  "libenvpp.so"
)
provides=(
  "${_pkgname}=${pkgver}"
  "libenvpp.so"
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|-g[0-9a-f]+$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}"

  cmake -B build -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_COLOR_MAKEFILE=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=ON \
    -DFETCHCONTENT_BASE_DIR="${srcdir}/build/_deps" \
    -DFETCHCONTENT_QUIET=OFF \
    -DFETCHCONTENT_UPDATES_DISCONNECTED=ON \
    -DLIBENVPP_EXAMPLES=ON \
    -DLIBENVPP_INSTALL=ON \
    -DLIBENVPP_TESTS=ON \
    -DFMT_INSTALL=OFF \
    -Wno-dev

  make -C build
}

check() {
  cd "${srcdir}"

  make -C build test
}

package() {
  cd "${srcdir}"

  DESTDIR="${pkgdir}" cmake --install build

  ### Clean up 'fmt' stuff that is installed but should not
  #rm -r "${pkgdir}/usr/include/fmt" "${pkgdir}/usr/lib"/libfmt.* "${pkgdir}/usr/lib/cmake/fmt" "${pkgdir}/usr/lib/pkgconfig"/fmt.*

  cd "${srcdir}/${_pkgname}"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      'git.log' 'NOTICE' 'README.md'
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  'LICENSE'
}
