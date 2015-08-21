# Maintainer: Chris Severance aur.severach AatT spamgourmet.com

set -u
_pkgname='guzzle-sphinx-theme'
pkgname="python-${_pkgname}"
pkgver=0.7.10
pkgrel=1
pkgdesc='Sphinx theme used by Guzzle'
arch=('any')
url="https://github.com/guzzle/${_pkgname//-/_}"
license=('custom') # Copyright (c) 2013 Michael Dowling <mtdowling@gmail.com>
depends=('python' # See setup.py, README.rst, and requirements.txt for version dependencies
  'python-sphinx>=1.1.3' #'python-sphinx<1.3'     # COM Arch is already newer. Documentation might not work.
)
makedepends=('python-distribute') # same as python-setuptools
conflicts=('python2-botocore')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('7be7a9d5b3f4235074f449e5f7e9f8f8432fb8e9e3896ee3f40d9b9165189943')

if [ "${pkgname%-git}" != "${pkgname}" ]; then # this is easily done with case
  _srcdir="${_pkgname}"
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
  _srcdir="${_pkgname//-/_}-${pkgver}"
  _verurl="${url}/releases"
  _versed="${url#*github.com}/archive/\(.*\)\.tar\.gz" # used with ^...$
  _veropt='l'
fi

build() {
  set -u
  cd "${_srcdir}"
  python setup.py build
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  python setup.py test --verbose
  set +u
}

package() {
  # set -u # not compatible with msg and makepkg --nocolor
  cd "${_srcdir}"

  python setup.py install --root="${pkgdir}" --optimize=1

  msg 'Install Documentation'
  install -Dpm644 'README.rst' 'requirements.txt' -t "${pkgdir}/usr/share/doc/${pkgname%-git}/"

  msg 'Install LICENSE.'
  install -Dpm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"

  # Do not include the tests/ generated from the install
  # rm -Rfv "${pkgdir}"/usr/lib/python*/site-packages/tests
  # set +u # not compatible with msg and makepkg --nocolor
}
set +u

# vim:set ts=2 sw=2 et:
