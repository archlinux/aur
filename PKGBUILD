# Maintainer: dreieck

_pkgname='bdelta'
pkgname="${_pkgname}-git"
epoch=1
pkgver=0.3.1+56.r172.20260624.cbffacc
pkgrel=1
pkgdesc="A tool to create diffs of binary files. A sophisticated sequence matching library bundled with a delta creator and patch tool."
# url='https://github.com/jjwhitney/BDelta'  # Original
url="https://github.com/Deamhan/BDelta"    # Fork, as of 2026: Maintained.
arch=(
  'i686'
  'x86_64'
  'arm'
  'aarch64'
)
license=("MPL-2.0")
depends=(
  'glibc'
)
makedepends=(
  "git"
  "cmake"
  "ninja"
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "libbdelta=${pkgver}"
  "libbdelta-git=${pkgver}"
  "libbdelta-static=${pkgver}"
  "libbdelta.so"
  "libbdelta.a"
)
replaces=()
conflicts=(
  "${_pkgname}"
  "libbdelta"
  "libbdelta-static"
  "libbdelta.so"
  "libbdelta.a"
)
options+=('staticlibs')

_giturl="${url}.git"

source=(
  "${_pkgname}::git+${_giturl}"
)

sha256sums=(
  'SKIP'
)

prepare() {
  cd "${_pkgname}"

  git log > git.log
}

pkgver() {
  cd "${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    echo "$0: Error: Could not determine version." > /dev/stderr
    false
    return 1
  fi

  if [ -z "${_rev}" ]; then
    echo "$0: Error: Could not determine revision." > /dev/stderr
    false
    return 1
  fi

  printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
}

build() {
  cmake -S "${_pkgname}/makefiles" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CONFIGURATION_TYPES=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCXX17=ON \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -Wno-dev -Wno-author -Wno-deprecated

  cmake --build build
}

package() {
  cd build

  install -Dvm755 -t "${pkgdir}/usr/bin" bdelta bpatch
  install -Dvm755 -t "${pkgdir}/usr/lib" libbdelta.so
  install -Dvm644 -t "${pkgdir}/usr/lib" libbdelta.a

  cd "${srcdir}/${_pkgname}"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log README
}
