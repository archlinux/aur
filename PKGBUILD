##
# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>
##

pkgname=update-hosts-git
_gitname=update-hosts
pkgdesc="Generate a hosts file based on multiple sources (git)"
pkgver=r162.3a6cc03
pkgrel=1
arch=('any')
makedepends=('git')
depends=()
optdepends=('curl: Default download client' 'wget: Optional download client')
provides=('update-hosts')
conflicts=('update-hosts')
license=('MIT')
url="https://github.com/pyamsoft/update-hosts.git"

##
# The SHA256 is constantly changing since this is
# pulled from git so skip the verification check
##
sha256sums=('SKIP')
source=("${_gitname}::git+${url}#branch=master")

###############################################################################

pkgver() {
  cd "$srcdir/$_gitname"
  # From
  # https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
  # If there are no tags then use number of revisions since beginning of the history:
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local _timer="${_gitname}.timer"
  local _service="${_gitname}.service"
  cd "$srcdir/$_gitname"

  install -Dm 755 "${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
  install -Dm 644 "${_timer}" "${pkgdir}/usr/lib/systemd/system/${_timer}"
  install -Dm 644 "${_service}" "${pkgdir}/usr/lib/systemd/system/${_service}"

  # systemd needs absolute paths
  sed -i "s#${_gitname}#/usr/bin/${_gitname}#g" \
        "${pkgdir}/usr/lib/systemd/system/${_service}"

  unset _timer _service
}

