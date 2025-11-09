# Maintainer: dreieck

_pkgbase=python-prompt_toolkit
_pkgname="${_pkgbase}-doc"
pkgname="${_pkgname}-git"
_pkgver="latest"
pkgver=3.0.52_4+g01fb11f2
pkgrel=1
pkgdesc="Documentation for python package 'prompt_toolkit'."
makedepends=(
  'git'
  'python-sphinx'
)
provides=(
  "${_pkgname}=${pkgver}"
)
replaces=(
  "${_pkgname}<=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
arch=('any')
url='http://github.com/jonathanslenders/python-prompt-toolkit'
license=('BSD')
options=('emptydirs')
source=(
  'python-prompt-toolkit::git+http://github.com/jonathanslenders/python-prompt-toolkit.git'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/python-prompt-toolkit"
  _descr="$(git describe --tags --long)"
  _ver="$(echo "${_descr}" | awk -F '-' '{print $1}')"
  _rel="$(echo "${_descr}" | awk -F '-' '{print $2}')"
  _rev="$(echo "${_descr}" | awk -F '-' '{print $3}')"
  echo "${_ver}_${_rel}+${_rev}"  
}

build() {
  cd "${srcdir}/python-prompt-toolkit/docs"
  
  msg "Building info page ..."
  make info
  gzip -9 _build/texinfo/prompt_toolkit.info
  
  msg "Building manpage ..."
  make man
  
  msg "Building HTML documentation ..."
  make singlehtml
  
  msg "Building plaintext documentation ..."
  make text
}

package() {
  cd "${srcdir}/python-prompt-toolkit"
  
  _docdir="/usr/share/doc/${_pkgbase}/"
  _docpkgdir="${pkgdir}/${_docdir}"
  
  install -v -D -m644 "${srcdir}/python-prompt-toolkit/docs/_build/texinfo/prompt_toolkit.info.gz" "${pkgdir}/usr/share/info/prompt_toolkit.info.gz"
  
  install -v -D -m644 "${srcdir}/python-prompt-toolkit/docs/_build/man/prompt_toolkit.1" "${pkgdir}/usr/share/man/man1/prompt_toolkit.1"
  
  mkdir -p "${_docpkgdir}/docs"
  cp -rv "${srcdir}/python-prompt-toolkit/docs/_build"/{singlehtml,text} "${_docpkgdir}/docs/"
  cp -rv "${srcdir}/python-prompt-toolkit"/{examples,AUTHORS.rst,CHANGELOG,LICENSE,README.rst} "${_docpkgdir}/"
}
