# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Maintainer: Ainola
# Contributor: Chris Fordham

# This package is designed so that these PKGBUILD are easy to sync with Midnight Commander:
#  aws-cli & aws-cli-git
#  python-botocore & python-botocore-git

# Note: the primary use of this package is with aws-cli

# Use mcdiff to watch for changes
_fn_foobar() {
local _foobar="
#requirements-docs.txt
docutils>=0.10,<0.16
Sphinx>=1.1.3,<1.3
guzzle_sphinx_theme>=0.7.10,<0.8

#requirements.txt
tox>=2.5.0,<3.0.0
nose==1.3.7
mock==1.3.0
wheel==0.24.0
behave==1.2.5
jsonschema==2.5.1

#setup.py
requires = [
    'jmespath>=0.7.1,<1.0.0',
    'python-dateutil>=2.1,<3.0.0',
]


if sys.version_info[:2] == (3, 4):
    # urllib3 dropped support for python 3.4 in point release 1.25.8
    requires.append('urllib3>=1.25.4,<1.25.8')
else:
    requires.append('urllib3>=1.25.4,<1.27')
"
}
unset -f _fn_foobar

set -u
_pyver="python2"
_pybase='botocore'
pkgname="${_pyver}-${_pybase}"
pkgver=1.19.35
pkgrel=1
pkgdesc='A low-level interface to a number of Amazon Web Services. This is the foundation for the AWS CLI as well as boto3'
arch=('any')
url="https://github.com/boto/${_pybase}"
license=('Apache') # Apache License 2.0
_pydepends=( # See setup.py, README.rst, and requirements.txt for version dependencies
  # setup.py
  "${_pyver}-dateutil"'>=2.1' #,'<3.0.0'}
  "${_pyver}-jmespath"'>=0.7.1' #,'<1.0.0'}
  #"${_pyver}-docutils>=0.10"  #,'0.16'}
  "${_pyver}-urllib3"'>=1.25.4' #,'<1.27'}

  # requirements.txt
  "${_pyver}-tox"'>=2.5.0' #,'<3.0.0'}
  "${_pyver}-nose>=1.3.7"
  "${_pyver}-mock>=1.3.0"
  "${_pyver}-wheel>=0.24.0"
  "${_pyver}-docutils"'>=0.10' #,'<0.16'}
  "${_pyver}-behave>=1.2.5"
  "${_pyver}-jsonschema>=2.5.1"

  # requirements-docs.txt
  "${_pyver}-sphinx"'>=1.1.3' # ,'<1.3'}
  "${_pyver}-guzzle-sphinx-theme"'>=0.7.10' #,'<0.8'}

  # old but still required
  #"${_pyver}-bcdoc<0.15.0"
  "${_pyver}-six>=1.1.0"
)
depends=("${_pyver}" "${_pydepends[@]}")
makedepends=("${_pyver}" "${_pyver}-distribute") # same as python-setuptools
options=('!strip')
source=("${_pybase}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('511f6efe69d9589cf32034f9ea3040ea')
sha256sums=('94097e76158c6f7db0c6575cd8e4aae021a5bed8bd6a5a29f0cb8d46a98b30e9')

if [ "${pkgname%-git}" != "${pkgname}" ]; then # this is easily done with case
  _srcdir="${_pybase}"
  makedepends+=('git')
  provides+=("${pkgname%-git}=${pkgver%%.r*}")
  conflicts+=("${pkgname%-git}")
  source=("${_srcdir}::git+${url}.git")
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
pkgver() {
  set -u
  cd "${_srcdir}"
  printf '%s.r%s.g%s' "$(sed -ne "s:__version__ = '\(.*\)'"'$:\1:p' 'botocore/__init__.py')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" # "
  set +u
}
else
  _srcdir="${_pybase}-${pkgver}"
#  _verwatch=("${url}/releases" "${url#*github.com}/archive/\(.*\)\.tar\.gz" 'l')
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
  #depends=("${_pyver}" "${_pydepends[@]}")
  cd "${_srcdir}"
  ${_pyver} setup.py install --root="${pkgdir}" --optimize=1
  install -Dpm644 'README.rst' 'requirements.txt' -t "${pkgdir}/usr/share/doc/${pkgname%-git}/"
  install -Dpm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
