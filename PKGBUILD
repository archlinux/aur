# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=imgui
pkgname="${_pkgname}-git"
pkgver=1.92.5+51.r9558.20251218.683f9160b
pkgrel=1
pkgdesc="Dear ImGui: Bloat-free Graphical User interface for C++ with minimal dependencies."
license=('MIT')
arch=(
  'x86_64'
  'i686'
  'aarch64'
  'armv6h'
  'armv7h'
)
url="https://github.com/ocornut/imgui"
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  'cmake'
  'git'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+${url}.git"
  "${_pkgname}_CMakeLists.txt::https://github.com/microsoft/vcpkg/raw/refs/heads/master/ports/imgui/CMakeLists.txt"
  "${_pkgname}_imgui-config.cmake.in::https://github.com/microsoft/vcpkg/raw/refs/heads/master/ports/imgui/imgui-config.cmake.in"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare () {
  cd "${srcdir}"

  cp "${_pkgname}_CMakeLists.txt"        "${_pkgname}/CMakeLists.txt"
  cp "${_pkgname}_imgui-config.cmake.in" "${_pkgname}/imgui-config.cmake.in"

  cd "${srcdir}/${_pkgname}"
  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
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
  cd "${_pkgname}"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -S. \
    -B cmake-build-shared
  cmake --build cmake-build-shared
}

package() {
  cd "${_pkgname}"
  make -C cmake-build-shared DESTDIR="$pkgdir" install

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"     git.log docs/*
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}

# vim:set ts=2 sw=2 et:
