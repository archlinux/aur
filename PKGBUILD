# Maintainer: shrik3 <i AT shrik3 DOT com>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=libkazv
pkgname="${_pkgname}-git"
pkgver=0.8.0+1.r493.20241202.3477cd6
pkgrel=1
pkgdesc="A matrix client sdk built upon lager and the value-oriented design it enables."
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)
license=('AGPL-3.0-or-later')
url="https://lily-is.land/kazv/libkazv"
backup=()
depends=(
  #'boost-libs'
  'crypto++'
  'gcc-libs'
  'glibc'
  'vodozemac-bindings-cpp-kazv>=0.2.0'
)
makedepends=(
  #'boost'
  'cmake'
  # 'cpr' # Currently (2023-08-25) this makes build errors, so disabling.
  'git'
  'immer'
  'lager'
  'libhttpserver'
  'nlohmann-json'
  'zug'
)
## Disabled until we re-enable `check()`.
# checkdepends=(
#   'catch2>=3.4.0'
# )
optdepends=(
  # 'cpr: for kazvjob.' # Currently (2023-08-25) this makes build errors, so disabling.
  'libhttpserver: For examples.'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)


prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}


pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|-g[0-9a-f]+$||' | tr '-' '+')"
  # _ver_major="$(grep -Em1 '^[^#]*set\(libkazv_VERSION_MAJOR' CMakeLists.txt | sed -E 's|.*libkazv_VERSION_MAJOR[[:space:]]+([^\)]*)\).*|\1|')"
  # _ver_minor="$(grep -Em1 '^[^#]*set\(libkazv_VERSION_MINOR' CMakeLists.txt | sed -E 's|.*libkazv_VERSION_MINOR[[:space:]]+([^\)]*)\).*|\1|')"
  # _ver_patch="$(grep -Em1 '^[^#]*set\(libkazv_VERSION_PATCH' CMakeLists.txt | sed -E 's|.*libkazv_VERSION_PATCH[[:space:]]+([^\)]*)\).*|\1|')"
  # _ver="${_ver_major}.${_ver_minor}.${_ver_patch}"
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
  cd "${srcdir}/${_pkgname}"

  mkdir -p build
  cd build

  ## KAZVJOB: Currently (2023-08-25) this makes build errors related to cpr, so disabling.
  #  TESTS, EXAMPLES: Depend on KAZVJOB.
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Dlibkazv_BUILD_EXAMPLES=OFF \
    -Dlibkazv_BUILD_KAZVJOB=OFF \
    -Dlibkazv_BUILD_TESTS=OFF \
    -Dlibkazv_ENABLE_COVERAGE=OFF \
    -Dlibkazv_INSTALL_HEADERS=ON \
    -Dlibkazv_OUTPUT_LEVEL=20 \
    ..

  make
}


# check() {
## Disabled since currently TESTS are disabled.
#   cd "${srcdir}/${_pkgname}/build"
# }


package() {
  cd "${srcdir}/${_pkgname}/build"

  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/${_pkgname}"

  for _docfile in 'git.log' 'README.md' 'CHANGELOG.md'; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  for _licensefile in COPYING; do
    install -Dvm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_licensefile}"
  done
}
