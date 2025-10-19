# Maintainer: dreieck

_pkgname='wikidoc'
pkgname="${_pkgname}-git"
epoch=1
pkgver=r36.20220419.f71e0cd
pkgrel=1
pkgdesc='Python script allows to create nice looking PDF files from a github wiki. Requires mardown-formatted wiki.'
arch=('any')
# url='https://github.com/jobisoft/wikidoc' # Original Python2 version.
url='https://github.com/jpolton/wikidoc' # Python3 fork.
license=('GPL2')
depends=(
  'pandoc'
  #'python2'
  'python>=3'
  'wkhtmltopdf'
)
makedepends=(
  'git'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)


prepare() {
  cd "${srcdir}/${_pkgname}"
  #msg2 "Patching for python2 ..."
  #sed -e '1s|#![[:space:]]*/usr/bin/python[[:space:]]*$|#!/usr/bin/python2|' -i wikidoc.py
}

pkgver () {
  cd "${srcdir}/${_pkgname}"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Revision could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -v -m755 wikidoc.py "${pkgdir}/usr/bin/wikidoc"
  install -D -v -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.GPL3.txt"
}
