# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: James Feng Cao

_pyver="python2"
_pyverother='python python2 '
_pyverother="${_pyverother//${_pyver} /}"
_pyverother="${_pyverother// /}"
_pybase='pdfminer'
_pkgname="${_pyver}-${_pybase}"
pkgname="${_pybase}"
pkgver='20140328'
pkgrel='2'
pkgdesc='python2 utils to extract, analyze text data of PDF files. Includes pdf2txt, dumppdf, and latin2ascii'
arch=('any')
#url="https://pypi.python.org/pypi/${_pybase}/"
#url="https://github.com/euske/${_pybase}/"
url="http://www.unixuser.org/~euske/python/${_pybase}/"
license=('MIT/X')
makedepends=("${_pyver}" "${_pyver}-distribute") # same as python-setuptools
_srcdir="${_pybase}-${pkgver}"
_verwatch=("https://pypi.python.org/simple/${_pybase}/" "${_pybase}-\([0-9\.]\+\)\.tar\.gz" 't')
source=("http://pypi.python.org/packages/source/${_pybase: 0:1}/${_pybase}/${_pybase}-${pkgver}.tar.gz")
sha256sums=('ba187b93056586a14edd5e630cf63ae96b1cc84b611f55dcddbc997316d9f262')

build() {
  set -u
  cd "${_srcdir}"
  ${_pyver} setup.py build
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  # If pip is installed, some package tests download missing packages. We can't allow that.
  #${_pyver} setup.py test --verbose
  set +u
}

package() {
  set -u
  provides=("${_pkgname}=${pkgver}")
  conflicts=("${_pybase}" "${_pkgname}" "${_pyverother}-${_pybase}") # excessive for now, until we get a Python 3 compatible version
  depends=("${_pyver}") # "${_pydepends[@]}")

  cd "${_srcdir}"
  ${_pyver} setup.py install --root="${pkgdir}"
  local _bin
  for _bin in 'latin2ascii' 'pdf2txt' 'dumppdf'; do
    ln -sf "${_bin}.py" "${pkgdir}/usr/bin/${_bin}"
  done
  #install -Dpm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
