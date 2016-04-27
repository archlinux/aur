# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Contributor: Alper KANAT <alperkanat@raptiye.org>
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/aws-cli/PKGBUILD

# This package is designed so that these PKGBUILD are easy to sync with Midnight Commander:
#  aws-cli & aws-cli-git
#  python-botocore & python-botocore-git

# Use mcdiff to watch for changes
_fn_foobar() {
local _foobar="
#requirements-docs.txt
Sphinx==1.1.3
#requirements.txt
tox>=2.3.1,<3.0.0
docutils>=0.10
# botocore and the awscli packages are typically developed
# in tandem, so we're requiring the latest develop
# branch of botocore when working on the awscli.
-e git://github.com/boto/botocore.git@develop#egg=botocore
-e git://github.com/boto/s3transfer.git@develop#egg=s3transfer
-e git://github.com/boto/jmespath.git@develop#egg=jmespath
nose==1.3.0
colorama>=0.2.5,<=0.3.3
mock==1.3.0
rsa>=3.1.2,<=3.3.0
wheel==0.24.0

#setup.py
import awscli


requires = ['botocore==1.4.14',
            'colorama>=0.2.5,<=0.3.3',
            'docutils>=0.10',
            'rsa>=3.1.2,<=3.3.0',
            's3transfer==0.0.1']
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
pkgver=1.10.23.r3557.g85d8482
# Generally when this version changes, the version of botocore also changes
pkgrel=1
pkgdesc='Universal Command Line Interface for Amazon Web Services awscli'
arch=('any')
url="https://github.com/aws/${_pybase}"
license=('Apache') # Apache License 2.0
_pydepends=( # See setup.py, README.rst, and requirements.txt for version dependencies
  "${_pyver}-bcdoc"           # AUR
  "${_pyver}-botocore>=1.4.14" # AUR == would make upgrades from AUR impossible. See below.
  "${_pyver}-colorama>=0.2.5" #,"<=0.3.3"}   # COM requested by phw
  "${_pyver}-rsa>=3.2" # ','<=3.3.0'}        # COM requested by supermario & jsteel
  "${_pyver}-s3transfer>=0.0.1" # AUR

  ### These are from python-botocore
  "${_pyver}-wheel>=0.24.0"   # AUR ==
  "${_pyver}-jmespath>=0.7.1" # AUR == is possible for repositories. Makes upgrades impossible in AUR.
  "${_pyver}-tox"{'>=2.3.1','<3.0.0'} # COM
  "${_pyver}-dateutil"{">=2.1","<3.0.0"} # COM
  "${_pyver}-nose>=1.3.0"     # COM ==
  "${_pyver}-mock>=1.3.0"     # COM ==
  "${_pyver}-docutils>=0.10"  # COM
  "${_pyver}-six>=1.1.0"      # COM This is in the sources but I'm not sure where the version comes from.
  # requirements-docs.txt
  #"${_pyver}-sphinx>=1.1.3" #"${_pyver}-sphinx"{>=1.1.3,<1.3}     # COM Arch is already newer. Documentation might not work.
  "${_pyver}-guzzle-sphinx-theme"{'>=0.7.10','<0.8'}
)
if [ "${_pyver}" = 'python2' ]; then
  _pydepends+=('python2-futures')
fi
depends=("${_pyver}" "${_pydepends[@]}")
makedepends=("${_pyver}" "${_pyver}-distribute") # same as python-setuptools
options=('!emptydirs' '!strip')
source=("${_pybase}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('debb45280dacf2e8109a5367eeb97ed12f400b834a2701eed67b8fd9f3c9919e')

if [ "${pkgname%-git}" != "${pkgname}" ]; then # this is easily done with case
  _srcdir="${_pybase}"
  makedepends+=('git')
  _vcsprovides=("${pkgname%-git}=${pkgver%%.r*}")
  _vcsconflicts=("${pkgname%-git}")
  source=("${_srcdir}::${url//https:/git:}.git")
  :;sha256sums=('SKIP')
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
  provides=("${_pybase//-/}=${pkgver%%.r*}" "${_vcsprovides[@]}")
  conflicts=("${_pyverother}-aws-cli" "${_pyver}-aws-cli" "${_pybase//-/}" "${_vcsconflicts[@]}")
  set -u
  #depends=("${_pyver}" "${_pydepends[@]}")
  #replaces=("${_pyver}-aws-cli" "${_pybase//-/}")

  cd "${_srcdir}"
  ${_pyver} setup.py install --root="${pkgdir}" --optimize=1
  install -Dpm644 'bin/aws_zsh_completer.sh' "${pkgdir}/etc/zsh/aws_complete.zsh" # someone dropped an s. I don't know if I can change it safely.

  install -Dpm644 <(cat << EOF
# ${pkgname} ${pkgver} bash completion script
# http://aur.archlinux.org/
complete -C aws_completer aws
EOF
) "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-git}"

  install -Dpm644 'README.rst' 'requirements.txt' -t "${pkgdir}/usr/share/doc/${pkgname%-git}/"
  install -Dpm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  set +u
}
set +u
# vim:set ts=2 sw=2 et:
