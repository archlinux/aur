# Maintainer: dreieck <oid-maps -seznam:cz>
# Contributor: Steffen Weber <-boenki-gmx-de->

_pkgname=webkitfltk
pkgname="${_pkgname}-static-git"
pkgver=0.5.1+29.r11877.20220906.7c630b0d6
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

  _ver="$(git describe --tags | sed 's|^[vV]||' | sed 's|-[^-]*$||' | tr '-' '+')"
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
