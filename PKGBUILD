# Maintainer: Chris Severance aur.severach AatT spamgourmet.com

set -u
_pyver="python"
_pybase='guzzle-sphinx-theme'
pkgname="${_pyver}-${_pybase}"
pkgver=0.7.11
pkgrel=2
pkgdesc='Sphinx theme used by Guzzle'
arch=('any')
url="https://github.com/guzzle/${_pybase//-/_}"
license=('custom') # Copyright (c) 2013 Michael Dowling <mtdowling@gmail.com>
_pydepends=( # See setup.py, README.rst, and requirements.txt for version dependencies
  "${_pyver}-sphinx>=1.1.3" #"python-sphinx<1.3"     # COM Arch is already newer. Documentation might not work.
)
makedepends=("${_pyver}" "${_pyver}-distribute") # same as python-setuptools
source=("${_pybase}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('be264736cfb0b19c00289e2ea4e5487a01df28ef8bf47df5dacd273d9d43412c')

if [ "${pkgname%-git}" != "${pkgname}" ]; then # this is easily done with case
  _srcdir="${_pybase}"
  makedepends+=('git')
  provides+=("${pkgname%-git}=${pkgver%%.r*}")
  conflicts+=("${pkgname%-git}")
  source=("${_srcdir}::git+${url}.git")
  :;sha256sums=('SKIP')
pkgver() {
  set -u
  cd "${_srcdir}"
  printf '%s.r%s.g%s' "$(sed -ne "s:__version__ = '\(.*\)'"'$:\1:p' 'botocore/__init__.py')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" # "
  set +u
}
else
  _srcdir="${_pybase//-/_}-${pkgver}"
  _verwatch=("${url}/releases" "${url#*github.com}/archive/\(.*\)\.tar\.gz" 'l')
fi

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
  depends=("${_pyver}" "${_pydepends[@]}")
  cd "${_srcdir}"
  ${_pyver} setup.py install --root="${pkgdir}" --optimize=1
  install -Dpm644 'README.rst' 'requirements.txt' -t "${pkgdir}/usr/share/doc/${pkgname%-git}/"
  install -Dpm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
