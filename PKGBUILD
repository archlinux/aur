# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: sgar < swhaat at github >

_pkgname=libcapi
pkgname="${_pkgname}"-git
pkgver=3.2.3+5.r23.20210508.947e35b
pkgrel=1
pkgdesc="Modular libcapi20"
arch=(
  'aarch64'
  'x86_64'
  'i686'
  'pentium4'
  'armv5h'
  'armv6h'
  'armv7h'
)
url="https://gitlab.com/tabos/libcapi"
license=('GPL-2.0-only')
conflicts=("isdn4k-utils")
depends=(
  'glibc'
)
makedepends=(
  'git'
  'meson'
  'ninja'
  'pkgconfig'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "libcapi20.so"
)
conflicts=(
  "${_pkgname}"
  "libcapi20.so"
)
options+=('!emptydirs')
# options+=('!lto' 'debug')

source=(
  "git+https://gitlab.com/tabos/${_pkgname}.git"
)
sha256sums=(
  'SKIP'  # Upstream source.
)

_CFLAGSADDITIONS="-w"

prepare() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cd "${srcdir}"

  arch-meson "${_pkgname}" build --reconfigure

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
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cd "${srcdir}"

  ninja -v -j1 -C "build"
}

check() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cd "${srcdir}"

  ninja -v -C "build" test
}

package() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cd "${srcdir}"

  DESTDIR="${pkgdir}" ninja -v -C "build" install

  cd "${srcdir}/${_pkgname}"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log README.md COPYING.LIB
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING.LIB
}
