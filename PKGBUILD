# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/aws-cli-git/PKGBUILD

set -u
_pkgname='aws-cli'
pkgname="${_pkgname}-git"
_srcdir="${pkgname}"
pkgver=1.7.44.r1966.g45bb0b6
pkgrel=1
pkgdesc='Universal Command Line Interface for Amazon Web Services.'
arch=('any')
url='https://github.com/aws/aws-cli'
license=('Apache 2')
depends=(
  'python'
  'python-bcdoc'
  'python-botocore'
  'python-colorama'
  'python-docutils'
  'python-rsa'
  'python-jmespath'
  'python-mock'
  'python-nose'
  'python-six'
  'python-sphinx'
  'python-tox'
)
makedepends=('python-distribute' 'git') # same as python-setuptools
conflicts=('python2-aws-cli' 'python-aws-cli' 'awscli' "${_pkgname}")
replaces=(                   'python-aws-cli' 'awscli' "${_pkgname}")
provides=('awscli' "${_pkgname}")
options=('!emptydirs')
source=("${pkgname}::git://github.com/aws/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  local _gitver="$(git describe --long)"
  _gitver="${_gitver#*-}"
  _gitver="${_gitver//-/.}"
  local _changever="$(grep '^[0-9]\+\.[0-9]\+\.[0-9]\+$' 'CHANGELOG.rst'| head -n1)"
  echo "${_changever}.r${_gitver}"
  set +u
}

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
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
