# Maintainer:  dreieck

_gitname=libzippp
_pkgname="${_gitname}"
_pkgsource=git
pkgname="${_pkgname}-${_pkgsource}"
pkgver=7.1.1.10.1.12+r510.20251006.8992d60
pkgrel=2
pkgdesc="C++ wrapper for libzip."
url="https://github.com/ctabin/libzippp"
license=('BSD-3-Clause')
arch=(
  'i686'
  'x86_64'
  'armv7h'
  'armv8h'
  'aarch64'
)
depends=(
  'gcc-libs'
  'glibc'
  'libzip.so'
)
makedepends=(
  'cmake'
  'git'

  'bzip2'
  'libzip'
  'xz'
  'zlib'
  'zstd'
)
optdepends=()
options+=('emptydirs')
source=(
  "${_pkgname}::git+${url}.git"
)
provides=(
  "${_pkgname}=${pkgver}"
  "libzippp.so"
)
conflicts=(
  "${_pkgname}"
)
sha256sums=(
  'SKIP' # main source (git checkout)
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe  --tags | sed -E -e "s|${_gitname}.||" -e 's|^v||' -e 's|-[^-]*$||' | tr '-' '.')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}+r${_rev}.${_date}.${_hash}"
  fi

  mkdir -p "${srcdir}/build"
}


build() {
  cd "${srcdir}"

  cmake -S "${_pkgname}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DLIBZIPPP_BUILD_TESTS=ON \
    -DLIBZIPPP_CMAKE_CONFIG_MODE=ON \
    -DLIBZIPPP_ENABLE_ENCRYPTION=ON \
    -DLIBZIPPP_GNUINSTALLDIRS=OFF \
    -DLIBZIPPP_INSTALL=ON \
    -DLIBZIPPP_INSTALL_HEADERS=ON \
    -Wno-dev

  make -C build
}

check() {
  cd "${srcdir}"

  make -C build test
}

package() {
  cd "${srcdir}"

  make -C build DESTDIR="${pkgdir}/" install

  cd "${srcdir}/${_pkgname}"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"  git.log README.md
  install -Dvm644 "LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
