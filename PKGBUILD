# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Contributor: Alper KANAT <alperkanat@raptiye.org>
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/aws-cli/PKGBUILD

# This package is designed so that these PKGBUILD are easy to sync with Midnight Commander:
#  aws-cli & aws-cli-git
#  python-botocore & python-botocore-git

# TODO: put tox back into depends

# Use mcdiff to watch for changes
_fn_foobar() {
local _foobar="
#requirements-docs.txt
docutils>=0.10,<0.16
Sphinx==1.1.3
-e .

#requirements.txt
tox>=2.3.1,<3.0.0
# botocore and the awscli packages are typically developed
# in tandem, so we're requiring the latest develop
# branch of botocore and s3transfer when working on the awscli.
-e git://github.com/boto/botocore.git@develop#egg=botocore
-e git://github.com/boto/s3transfer.git@develop#egg=s3transfer
nose==1.3.7
mock==1.3.0
# TODO: this can now be bumped
# 0.30.0 dropped support for python2.6
# remove this upper bound on the wheel version once 2.6 support
# is dropped from aws-cli
wheel>0.24.0,<0.30.0

#setup.py

install_requires = [
    'botocore==1.19.35',
    'docutils>=0.10,<0.16',
    's3transfer>=0.3.0,<0.4.0',
]


if sys.version_info[:2] == (3, 4):
    install_requires.append('PyYAML>=3.10,<5.3')
    install_requires.append('colorama>=0.2.5,<0.4.2')
    install_requires.append('rsa>=3.1.2,<=4.0.0')
else:
    install_requires.append('PyYAML>=3.10,<5.4')
    install_requires.append('colorama>=0.2.5,<0.4.4')
    install_requires.append('rsa>=3.1.2,<=4.5.0')


"
}
unset -f _fn_foobar

set -u
_pyver="python"
_pybase='aws-cli'
if [ "${_pyver}" = 'python' ]; then
pkgname="${_pybase}-git"
_pyverother='python2'
else
pkgname="${_pyver}-${_pybase}-git"
_pyverother='python'
fi
pkgver=1.18.195.r8866.g280e35ef3
# Generally when this version changes, the version of botocore also changes
pkgrel=1
pkgdesc='Universal Command Line Interface for Amazon Web Services awscli'
arch=('any')
url="https://github.com/aws/${_pybase}"
license=('Apache') # Apache License 2.0
_pydepends=( # See setup.py, README.rst, and requirements.txt for version dependencies
  # setup.py
  "${_pyver}-botocore>=1.19.35" # COM ==
  "${_pyver}-docutils"'>=0.10' # ,'<0.16'} # COM
  "${_pyver}-rsa"'>=3.1.2' #,'<=4.5.0'}
  #"${_pyver}-cryptography"'>=2.8.0' # ,'<=2.9.0'}
  "${_pyver}-s3transfer"'>=0.3.0' # ,'<0.4.0'} # COM
  "${_pyver}-yaml"">=3.10" #"<=5.4"} # COM
  #"${_pyver}-ruamel-yaml"'>=0.15.0' #,'<0.16.0'} # COM
  #"${_pyver}-prompt_toolkit"'>=2.0.0' #,'<3.0.0'} # COM
  "${_pyver}-colorama>=0.2.5" #,"<=0.4.4"}   # COM requested by phw

  # requirements.txt
  "${_pyver}-tox"'>=2.3.1' #,'<3.0.0'} # COM
  "${_pyver}-nose>=1.3.7"     # COM ==
  "${_pyver}-mock>=1.3.0"     # COM ==
  "${_pyver}-wheel>=0.24.0" #,'<0.30.0'} # COM

  # previous requirements still found in source
  #"${_pyver}-bcdoc"           # AUR
  "${_pyver}-dateutil"">=2.1" #,"<3.0.0"} # COM (found)

  # requirements-docs.txt
  "${_pyver}-sphinx"'>=1.1.3' #,'<1.3'}     # COM Arch is already newer. Documentation might not work.
  #"${_pyver}-guzzle-sphinx-theme"{'>=0.7.10','<0.8'}

  # Old
  #"${_pyver}-jmespath>=0.7.1" # COM ==
  #"${_pyver}-six>=1.1.0"      # COM This was in the sources but I'm not sure where the version comes from.
)
if [ "${_pyver}" = 'python2' ]; then
  _pydepends+=('python2-futures')
fi
depends=("${_pyver}" "${_pydepends[@]}")
makedepends=("${_pyver}" "${_pyver}-distribute") # same as python-setuptools
options=('!emptydirs' '!strip')
source=("${_pybase}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('e3207f83e0e6b603ec2b9e9aadadbe32')
sha256sums=('94262c494dc33d2c7518f062385184af6f8459484e83a48326d7ef7c1c1ce7a3')

if [ "${pkgname%-git}" != "${pkgname}" ]; then # this is easily done with case
  _srcdir="${_pybase}"
  makedepends+=('git')
  _vcsprovides=("${pkgname%-git}=${pkgver%%.r*}")
  _vcsconflicts=("${pkgname%-git}")
  source=("${_srcdir}::${url//https:/git:}.git")
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
pkgver() {
  set -u
  cd "${_srcdir}"
  printf '%s.r%s.g%s' "$(sed -ne "s:__version__ = '\(.*\)'"'$:\1:p' 'awscli/__init__.py')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" # "
  set +u
}
else
  _srcdir="${_pybase}-${pkgver}"
  _verwatch=("${url}/releases" "${url#*github.com}/archive/\(.*\)\.tar\.gz" 'l')
  _vcsprovides=()
  _vcsconflicts=()
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
  set +u
  provides=("${_pybase}=${pkgver%%.r*}" "${_vcsprovides[@]}")
  conflicts=("${_pyverother}-aws-cli" "${_pyver}-aws-cli" "${_pybase}" "${_vcsconflicts[@]}")
  set -u
  #depends=("${_pyver}" "${_pydepends[@]}")
  #replaces=("${_pyver}-aws-cli" "${_pybase//-/}")

  cd "${_srcdir}"
  ${_pyver} setup.py install --root="${pkgdir}" --optimize=1
  install -Dpm644 'bin/aws_zsh_completer.sh' "${pkgdir}/etc/zsh/aws_complete.zsh" # someone dropped an s. I don't know if I can change it safely.

  install -Dpm644 <(cat << EOF
# ${pkgname} ${pkgver} bash completion script
# https://aur.archlinux.org/
complete -C aws_completer aws
EOF
) "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-git}"

  install -Dpm644 'README.rst' 'requirements.txt' -t "${pkgdir}/usr/share/doc/${pkgname%-git}/"
  install -Dpm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  set +u
}
set +u
# vim:set ts=2 sw=2 et:
