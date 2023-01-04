##
# Maintainer: pyamsoft <developer(dot)pyamsoft(at)gmail(dot)com>
##

_gitname=pstate-frequency
# shellcheck disable=SC2034
pkgname=pstate-frequency-git
# shellcheck disable=SC2034
pkgdesc="Easily control Intel p-state driver (git version)"
# shellcheck disable=SC2034
pkgver="3.13.0".r961.b22bd0e
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('i686' 'x86_64')
# shellcheck disable=SC2034
makedepends=('git')
# shellcheck disable=SC2034
depends=()
# shellcheck disable=SC2034
optdepends=()
# shellcheck disable=SC2034
provides=('pstate-frequency')
# shellcheck disable=SC2034
conflicts=('pstate-frequency')
# shellcheck disable=SC2034
license=('GPL2')
url="https://github.com/pyamsoft/pstate-frequency.git"

##
# The SHA256 is constantly changing since this is
# pulled from git so skip the verification check
##
# shellcheck disable=SC2034
source=(
        "${_gitname}::git+${url}#branch=main"
        "00-fix-prefix.patch")
# shellcheck disable=SC2034
sha256sums=('SKIP'
            'e5423df20c03ef19448a78a1ae39e630d90f63c6c4e0962296ad292665575f0d')

pkgver() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_gitname}" || {
        msg "Failed to cd into ${srcdir}/${_gitname}"
        return 1
  }

  printf "%s.r%s.%s" "$(awk -F '=' '{if (/^readonly __VERSION=/) {print $2}}' "${_gitname}")" \
                "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_gitname}" || {
        msg "Failed to cd into ${srcdir}/${_gitname}"
        return 1
  }

  # Apply patches
  patch -p1 -i "${srcdir}/00-fix-prefix.patch"

  # Disabled by default to conform to AUR packaging
  # best practices. It is highly recommended that you
  # enable the line to allow for editing the config.mk file
  #
  # make DESTDIR="${pkgdir}" edit
}

package() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_gitname}" || {
        msg "Failed to cd into ${srcdir}/${_gitname}"
        return 1
  }

  # shellcheck disable=SC2154
  make DESTDIR="${pkgdir}" install
}
