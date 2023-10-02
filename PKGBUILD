##
# shellcheck shell=bash
#
# Maintainer: pyamsoft <developer(dot)pyamsoft(at)gmail(dot)com>
##

_gitname=git-ssh
# shellcheck disable=SC2034
pkgname=git-ssh-git
# shellcheck disable=SC2034
pkgdesc="An SSH key manager for git"
# shellcheck disable=SC2034
pkgver=r298.e28d095
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('any')
# shellcheck disable=SC2034
makedepends=('git')
# shellcheck disable=SC2034
depends=('git')
# shellcheck disable=SC2034
optdepends=(
  "socat: For use with HTTP proxies"
)
# shellcheck disable=SC2034
provides=('git-ssh')
# shellcheck disable=SC2034
conflicts=('git-ssh')
# shellcheck disable=SC2034
license=('GPLv2')
# shellcheck disable=SC2034
url="https://github.com/pyamsoft/git-ssh.git"

##
# The SHA256 is constantly changing since this is
# pulled from git so skip the verification check
##
# shellcheck disable=SC2034
sha256sums=('SKIP')
# shellcheck disable=SC2034
source=("${_gitname}::git+${url}#branch=main")

###############################################################################

pkgver() {
  # shellcheck disable=SC2154
  cd "$srcdir/$_gitname" || {
    msg "Error couldn't cd into $srcdir/$_gitname"
    return 1
  }

  # From
  # https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
  # If there are no tags then use number of revisions since beginning of the history:
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname" || {
    msg "Error couldn't cd into $srcdir/$_gitname"
    return 1
  }

  # Open up the umask in case you are running something more restrictive
  umask 0022

  # Mark the script executable
  chmod 755 "${_gitname}"

  # shellcheck disable=SC2154
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/doc/${_gitname}"
  mkdir -p "${pkgdir}/usr/share/licenses/${_gitname}"
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"

  cp "${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
  cp "LICENSE" "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
  cp "README.md" "${pkgdir}/usr/share/doc/${_gitname}/README.md"
  cp "res/shell/bash/bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_gitname}"
}
