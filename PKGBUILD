# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Contributor: Alper KANAT <alperkanat@raptiye.org>
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/aws-cli/PKGBUILD

# This package is designed so that these PKGBUILD are easy to sync with Midnight Commander:
#  aws-cli & aws-cli-git
#  python-botocore & python-botocore-git

# TODO: Can we move to bcdoc 0.16. Is the bug fixed in 0.15?
# TODO: When will we be able to move to the new rsa?
# TODO: Do we need split packages for python2 (see python-wheel for example)

set -u
_pkgname='aws-cli'
pkgname="${_pkgname}" # Add -git for the git package
pkgver=1.8.0
# Change the version and you must also change the version of botocore below
pkgrel=1
pkgdesc='Universal Command Line Interface for Amazon Web Services.'
arch=('any')
url="https://github.com/aws/${_pkgname}"
license=('Apache') # Apache License 2.0
depends=('python' # See setup.py, README.rst, and requirements.txt for version dependencies
  'python-bcdoc<0.15.0'    # AUR
  'python-botocore>=1.1.11' # AUR == would make upgrades from AUR imposible. See below.
  'python-colorama'{'>=0.2.5','<=0.3.3'}  # COM
  'python-rsa-3.1.2'{'>=3.1.2','<=3.1.4'} # AUR It would be nice to move to the newer version.
  #'python-rsa'{'>=3.1.2','<=3.1.4'}      # COM

  ### These are from python-botocore
  'python-wheel>=0.24.0'   # AUR ==
  'python-jmespath>=0.7.1' # AUR == is possible for repositories. Makes upgrades impossible in AUR.
  'python-tox>=1.4'        # COM == is possible because this is from a repository. Unfortunatley Arch isn't the primary dev environment for botocore/aws so our packages are likely to be newer.
  'python-dateutil'{'>=2.1','<3.0.0'} # COM
  'python-nose>=1.3.0'     # COM ==
  'python-mock>=1.0.1'     # COM ==
  'python-docutils>=0.10'  # COM
  'python-six>=1.1.0'      # COM This is in the sources but I'm not sure where the version comes from.
  # requirements-docs.txt
  'python-sphinx>=1.1.3' #'python-sphinx'{>=1.1.3,<1.3}     # COM Arch is already newer. Documentation might not work.
  'python-guzzle-sphinx-theme'{'>=0.7.10','<0.8'}
)
makedepends=('python-distribute') # same as python-setuptools
conflicts=('python2-aws-cli' 'python-aws-cli' 'awscli')
replaces=(                   'python-aws-cli' 'awscli')
provides=('awscli')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('77865ab084faec7e10d51a3b024ab1d07acc380c5b45804355ddbd03d120b57f')
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
  # set +u # not compatible with msg and makepkg --nocolor
}
set +u

# vim:set ts=2 sw=2 et:
