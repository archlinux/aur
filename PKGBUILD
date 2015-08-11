# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/aws-cli-git/PKGBUILD

# This package is designed so that PKGBUILD for aws-cli & aws-cli-git are easy to keep in sync

set -u
_pkgname='aws-cli'
pkgname="${_pkgname}-git"
pkgver=1.7.44.r2695.g45bb0b6
pkgrel=1
pkgdesc='Universal Command Line Interface for Amazon Web Services.'
arch=('any')
url="https://github.com/aws/${_pkgname}"
license=('Apache 2')
depends=(# See setup.py, README.rst, and requirements.txt for version dependencies
  'python'
  'python-bcdoc<0.15.0'
  # We must depend on the git version because of a pacman bug between provides=('foo') in a git package and depends=('foo>=0.0') in another package
  'python-botocore-git>=1.1.7' # == can't work with the long git version string.
  'python-colorama>=0.2.5' 'python-colorama<=0.3.3'
  'python-docutils>=0.10'
  'python-rsa>=3.1.2' # 'python-rsa<=3.1.4' # We're already at 3.2
  #'python-rsa<3.2.0' # Arch can't fulfill this since 3/17/2015. Let's hope it's fixed!
  'python-jmespath'
  'python-tox>=1.4'
  'python-sphinx>=1.1.3'
  'python-nose>=1.3.0'
  'python-mock>=1.0.1'
  'python-wheel>=0.24.0'
  'python-six' # This is all over the code but not found in the requirements
)
makedepends=('python-distribute') # same as python-setuptools
conflicts=('python2-aws-cli' 'python-aws-cli' 'awscli')
replaces=(                   'python-aws-cli' 'awscli')
provides=('awscli')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('7f3b6778ea526af1dbcf21007f98b375fadc69e342114be5dc5a7d5cf5f5b097')
options=('!emptydirs')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  _srcdir="${pkgname}"
  makedepends+=('git')
  conflicts+=("${_pkgname}")
  replaces+=("${_pkgname}")
  provides+=("${_pkgname}")
  source=("${_srcdir}::${url/https:/git:}.git")
  :;sha256sums=('SKIP')
pkgver() {
    set -u
    cd "${_srcdir}"
    printf '%s.r%s.g%s' "$(sed -ne "s:__version__ = '\(.*\)'"'$:\1:p' 'awscli/__init__.py')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" # "
    set +u
  }
else
  _srcdir="${pkgname}-${pkgver}"
  # Return sorted list of all version numbers available (used by git-aurcheck)
_version() {
    local LC_ALL=C # for sort
    curl -s -l "${url}/releases" | _getlinks | sed -ne "s:^/aws/${_pkgname}/archive/"'\(.*\)\.tar\.gz$:\1:p' | tr '.' ':' | sort -n | tr ':' '.'
  }
fi

package() {
  set -u
  cd "${_srcdir}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  msg 'Install zsh completion script.'
  install -Dpm644 'bin/aws_zsh_completer.sh' "${pkgdir}/etc/zsh/aws_complete.zsh"

  msg 'Install requirements.txt.'
  install -Dpm644 'requirements.txt' -t "${pkgdir}/usr/share/doc/${_pkgname}/"

  msg 'Install LICENSE.'
  install -Dpm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -Dpm644 <(cat << EOF
# ${pkgname} ${pkgver} bash completion script
# http://aur.archlinux.org/
complete -C aws_completer aws
EOF
) "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"

  set +u
}
set +u

# vim:set ts=2 sw=2 et:
