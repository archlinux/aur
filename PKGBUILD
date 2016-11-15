##
# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>
##

_gitname=update-hosts
# shellcheck disable=SC2034
pkgname=update-hosts-git
# shellcheck disable=SC2034
pkgdesc="Generate a hosts file based on multiple sources (git)"
# shellcheck disable=SC2034
pkgver=r241.c77d733
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('any')
# shellcheck disable=SC2034
makedepends=('git')
# shellcheck disable=SC2034
depends=()
# shellcheck disable=SC2034
optdepends=(
  'curl: Default download client'
  'wget: Optional download client'
  'iprange: Helper to optimize ipset configuration'
  'ipset: Parse ip address sets as an extra blocklist'
  'sudo: Helper to run as a normal user'
)
# shellcheck disable=SC2034
provides=('update-hosts')
# shellcheck disable=SC2034
conflicts=('update-hosts')
# shellcheck disable=SC2034
license=('MIT')
url="https://github.com/pyamsoft/update-hosts.git"

##
# The SHA256 is constantly changing since this is
# pulled from git so skip the verification check
##
# shellcheck disable=SC2034
sha256sums=('SKIP')
# shellcheck disable=SC2034
source=("${_gitname}::git+${url}#branch=master")

###############################################################################

pkgver() {
  # shellcheck disable=SC2154
  cd "$srcdir/$_gitname" || {
        msg "Could not cd into $srcdir/$_gitname"
        return 1
  }
  # From
  # https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
  # If there are no tags then use number of revisions since beginning of the history:
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _timer="${_gitname}.timer"
  _service="${_gitname}.service"

  # shellcheck disable=SC2154
  cd "$srcdir/$_gitname" || {
        msg "Could not cd into $srcdir/$_gitname"
        return 1
  }

  # shellcheck disable=SC2154
  install -Dm 755 "${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
  install -Dm 644 "${_timer}" "${pkgdir}/usr/lib/systemd/system/${_timer}"
  install -Dm 644 "${_service}" "${pkgdir}/usr/lib/systemd/system/${_service}"

  # systemd needs absolute paths
  sed -i "s#${_gitname}#/usr/bin/${_gitname}#g" \
        "${pkgdir}/usr/lib/systemd/system/${_service}"

  unset _timer _service
}

