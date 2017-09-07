# Maintainer: dreieck <oid-maps -seznam:cz>
# Contributor: Steffen Weber <-boenki-gmx-de->

_pkgname=webkitfltk
pkgname="${_pkgname}-static-git"
_pkgver='latest'
pkgver=0.5.1+gg18b581304
pkgrel=2
pkgdesc="Port of Webkit to FLTK 1.3. Compiles static library (all external dependencies internalised)."
arch=('i686' 'x86_64')
url="http://fifth-browser.sourceforge.net/"
license=('GPL3')
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-git=${pkgver}"
)
replaces=("${_pkgname}<=${pkgver}")
conflicts=(
  "${_pkgname}"
  "${_pkgname}-git"
)
depends=()
makedepends=(
  'fltk' # Since we compile static libraries, we don't need it after compilation .. will be included.
  'gcc5'
  'gperf'
  'perl'
  'python2'
  'ruby'
  'sqlite'
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
  make -C Source/bmalloc/bmalloc
  make -C Source/WTF/wtf
  make -C Source/JavaScriptCore gen
  make -C Source/JavaScriptCore
  make -C Source/WebCore
  make -C Source/WebKit/fltk
}

package() {
  cd "${_pkgname}"
  make -C Source/WebKit/fltk DESTDIR="${pkgdir}" install
  for _docfile in README.asciidoc; do
    install -D -v -m 644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
}
