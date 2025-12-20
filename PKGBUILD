##
# Maintainer: pyamsoft <developer(dot)pyamsoft(at)gmail(dot)com>
##

_listjails=listjails
_gitname=jail
# shellcheck disable=SC2034
pkgname=jail-git
# shellcheck disable=SC2034
pkgdesc="Temporarily grant ACLs and environment to a secondary user for the duration of a command"
# shellcheck disable=SC2034
pkgver="0.0.4".r2.8d25ab1
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('any')
# shellcheck disable=SC2034
makedepends=('git')
# shellcheck disable=SC2034
depends=('bubblewrap' 'coreutils' 'grep' 'awk')
# shellcheck disable=SC2034
optdepends=()
# shellcheck disable=SC2034
provides=('jail')
# shellcheck disable=SC2034
conflicts=('jail')
# shellcheck disable=SC2034
license=('GPL2')
url="https://github.com/pyamsoft/jail.git"

##
# The SHA256 is constantly changing since this is
# pulled from git so skip the verification check
##
# shellcheck disable=SC2034
source=("${_gitname}::git+${url}#branch=main")
# shellcheck disable=SC2034
sha256sums=('SKIP')

pkgver() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_gitname}" || {
    msg "Failed to cd into ${srcdir}/${_gitname}"
    return 1
  }

  printf "%s.r%s.%s" "$(awk -F '=' '{if (/^readonly VERSION=/) {print $2}}' "${_gitname}")" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_gitname}" || {
    msg "Failed to cd into ${srcdir}/${_gitname}"
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

  # Install scripts
  cp "${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
  cp "${_listjails}" "${pkgdir}/usr/bin/${_listjails}"

  cp "LICENSE" "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
  cp "README.md" "${pkgdir}/usr/share/doc/${_gitname}/README.md"
}
