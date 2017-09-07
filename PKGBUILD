# Maintainer: dreieck <oid-maps -seznam:cz>
# Contributor: Steffen Weber <-boenki-gmx-de->

_pkgname=fifth
pkgname="${_pkgname}-git"
_pkgver=latest
pkgver=0.5+ggfcad9c2
pkgrel=2
pkgdesc="Browser that carries the best features from Opera."
arch=('i686' 'x86_64')
url="http://fifth-browser.sourceforge.net/"
license=('GPL3')
provides=("${_pkgname}=${pkgver}")
replaces=("${_pkgname}<=${pkgver}")
conflicts=("${_pkgname}")
depends=(
  'webkitfltk'
  'fltk'
  'sqlite'
  'liburlmatch'
  'physfs'
  'libxslt'
  'curl'
  'harfbuzz-icu'
  'libjpeg-turbo'
  'cairo'
)
makedepends=(
  "gcc5"
)
optdepends=()
source=(
  "${_pkgname}::git+https://github.com/clbr/${_pkgname}.git"
)

sha256sums=(
  'SKIP'
)

# options+=('ccache')

pkgver() {
  cd "${_pkgname}"

  _descr="$(git describe --tags --long)"
  _ver="$(echo "${_descr}" | awk -F '-' '{print $1}' | sed 's|^v||')"
  _rev="$(echo "${_descr}" | awk -F '-' '{print $3}')"
  
  if [ -z "${_ver}" ]; then
    msg "Error while executing function pkgver: Could not determine version of software. Aborting." > /dev/stderr
    exit 11
  fi
  
  if [ -z "${_rev}" ]; then
    msg "Error while executing function pkgver: Could not determine VCS-revision of current checkout. Aborting." > /dev/stderr
    exit 12
  fi
  
  echo "${_ver}+g${_rev}"
}

build() {
  cd "${_pkgname}"
  CXXFLAGS+=" -DNDEBUG"
  export CXXFLAGS
  CC=gcc-5
  export CC
  CXX=c++-5
  export CXX
  autoreconf -i
  ./configure --prefix=/usr
  make
}

check() {
  cd "${_pkgname}"
  make check
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
  for _docfile in BACKGROUND COPYING DESIGN README.asciidoc TODO WEBKITBUGS logo.pov; do
    install -D -v -m 644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  cd "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -sv "/usr/share/${_pkgname}/" more-doc
}
