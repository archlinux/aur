# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Contributor: Alper KANAT <alperkanat@raptiye.org>
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/aws-cli/PKGBUILD

# This package is designed so that these PKGBUILD are easy to sync with Midnight Commander:
#  aws-cli & aws-cli-git
#  python-botocore & python-botocore-git

# TODO: Can we move to bcdoc 0.16. Is the bug fixed in 0.15?
# TODO: When will we be able to move to the new rsa?

set -u
_pkgname='aws-cli'
pkgname="${_pkgname}" # Add -git for the git package
pkgver=1.7.45
pkgrel=1
pkgdesc='Universal Command Line Interface for Amazon Web Services.'
arch=('any')
url="https://github.com/aws/${_pkgname}"
license=('Apache') # Apache License 2.0
depends=('python' # See setup.py, README.rst, and requirements.txt for version dependencies
  'python-bcdoc<0.15.0'
  'python-botocore>=1.1.8' # Using = would make upgrades impossible. This package will advance the version!
  'python-colorama>=0.2.5' 'python-colorama<=0.3.3'
  'python-docutils>=0.10'
  'python-rsa-3.1.2>=3.1.2' 'python-rsa-3.1.2<=3.1.4' # See AUR for this version
  #'python-rsa>=3.1.2' 'python-rsa<=3.1.4'
  'python-wheel>=0.24.0'

  ### These are from python-botocore
  'python-jmespath>=0.7.1'
  'python-tox>=1.4'
  'python-sphinx>=1.1.3'
  'python-nose>=1.3.0'
  'python-mock>=1.0.1'
  # six is all over the code but not found in the requirements
  'python-six>=1.1.0'
)
makedepends=('python-distribute') # same as python-setuptools
conflicts=('python2-aws-cli' 'python-aws-cli' 'awscli')
replaces=(                   'python-aws-cli' 'awscli')
provides=('awscli')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('eaaeef9c6baa1268aeeacd7e8910410e5a0a4fe0794d67d4af601e1ec452b8da')
options=('!emptydirs')

if [ "${pkgname%-git}" != "${pkgname}" ]; then # this is easily done with case
  _srcdir="${_pkgname}"
  makedepends+=('git')
  provides+=("${pkgname%-git}=${pkgver%%.r*}")
  conflicts+=("${pkgname%-git}")
  source=("${_srcdir}::${url//https:/git:}.git")
  :;sha256sums=('SKIP')
pkgver() {
  set -u
  cd "${_srcdir}"
  printf '%s.r%s.g%s' "$(sed -ne "s:__version__ = '\(.*\)'"'$:\1:p' 'awscli/__init__.py')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" # "
  set +u
}
else
  _srcdir="${pkgname}-${pkgver}"
  _verurl="${url}/releases"
  _versed="${url#*github.com}/archive/\(.*\)\.tar\.gz" # used with ^...$
  _veropt='l'
# Return sorted list of all version numbers available (used by git-aurcheck)
_version() {
  curl -s -l "${_verurl}" | _getlinks "${_veropt}" | sed -ne "s:^${_versed}"'$:\1:p' | tr '.' ':' | LC_ALL=C sort -n | tr ':' '.' # 1>&2
}
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
  set -u
  cd "${_srcdir}"

  python setup.py install --root="${pkgdir}" --optimize=1

  msg 'Install zsh completion script.'
  install -Dpm644 'bin/aws_zsh_completer.sh' "${pkgdir}/etc/zsh/aws_complete.zsh" # someone dropped an s. I don't know if I can change it safely.

  msg 'Install bash completion script.'
  install -Dpm644 <(cat << EOF
# ${pkgname} ${pkgver} bash completion script
# http://aur.archlinux.org/
complete -C aws_completer aws
EOF
) "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-git}"

  msg 'Install Documentation'
  install -Dpm644 'README.rst' 'requirements.txt' -t "${pkgdir}/usr/share/doc/${pkgname%-git}/"

  msg 'Install LICENSE.'
  install -Dpm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"

  # Do not include the tests/ generated from the install
  # rm -Rfv "${pkgdir}"/usr/lib/python*/site-packages/tests
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
