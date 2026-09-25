# Maintainer:  dreieck

_gitname=liblouisutdml
_pkgname="${_gitname}"
_pkgsource=git
pkgname="${_pkgname}-${_pkgsource}"
pkgver=2.12.0+48.r845.20260903.071cf89
pkgrel=1
pkgdesc="Library providing complete braille transcription services for xml, html and text documents."
url="https://github.com/liblouis/liblouisutdml"
# url="https://liblouis.io/"
license=(
  'LGPL-3.0-or-later'
  'GPL-3.0-or-later'
)
arch=(
  'i686'
  'x86_64'
  'armv7h'
  'armv8h'
  'aarch64'
)
depends=(
   'glibc'
  'liblouis'
  'libxml2.so'
)
makedepends=(
  'git'
  'libxml2'
  #'java-environment'
)
optdepends=()
options+=('emptydirs')
source=(
  "${_pkgname}::git+https://github.com/liblouis/liblouisutdml.git"
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-static=${pkgver}"
  "file2brl=${pkgver}"
  "liblouisutdml.a"
  "liblouisutdml.so"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-static"
  "file2brl"
  "liblouisutdml.a"
  "liblouisutdml.so"
)
sha256sums=(
  'SKIP' # main source (git checkout)
)
options+=('staticlibs')

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log

  ./autogen.sh
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe  --tags | sed -E -e "s|${_gitname}.||" -e 's|^v||' -e 's|-[^-]*$||' | tr '-' '+')"
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

  CFLAGS+=" -Wno-stringop-overflow -Wno-deprecated-declarations -Wno-incompatible-pointer-types"

  ./configure --prefix=/usr \
    --enable-shared \
    --enable-static \
    --enable-cxx-stdlib \
    --enable-java-bindings

  make all
}

check() {
  cd "${srcdir}/${_pkgname}"

  make check
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}/" install

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log ANNOUNCEMENT AUTHORS NEWS README.md ChangeLog
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING.LIB COPYING
}
