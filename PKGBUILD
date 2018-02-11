##
# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>
##

_gitname=dpm-query
# shellcheck disable=SC2034
pkgname=dpm-query-git
# shellcheck disable=SC2034
pkgdesc="DPM query tool and service to workaround bugs or save energy"
# shellcheck disable=SC2034
pkgver=r14.9bf8903
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('x86_64')
# shellcheck disable=SC2034
makedepends=('git')
# shellcheck disable=SC2034
depends=()
# shellcheck disable=SC2034
optdepends=()
# shellcheck disable=SC2034
provides=('dpm-query')
# shellcheck disable=SC2034
conflicts=('dpm-query')
# shellcheck disable=SC2034
license=('ISC')
url="https://github.com/illwieckz/dpm-query"

##
# The SHA256 is constantly changing since this is
# pulled from git so skip the verification check
##
# shellcheck disable=SC2034
source=("${_gitname}::git+${url}")
# shellcheck disable=SC2034
sha256sums=('SKIP')

pkgver() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_gitname}" || {
        msg "Failed to cd into ${srcdir}/${_gitname}"
        return 1
  }

  # From
  # https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
  # If there are no tags then use number of revisions since beginning of the history:
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_gitname}" || {
        msg "Failed to cd into ${srcdir}/${_gitname}"
        return 1
  }

  # Makefile doesn't respect a DESTDIR, we manually do this ourselves
  # shellcheck disable=SC2154

  # Make destination directories
	mkdir -p "${pkgdir}"/usr/bin
	mkdir -p "${pkgdir}"/etc/dpm-query
	mkdir -p "${pkgdir}"/usr/lib/systemd/system

  # Copy stuff over
  cp src/dpm-query "${pkgdir}"/usr/bin
  cp src/dpm-query-service "${pkgdir}"/usr/bin

	cp src/dpm.cfg "${pkgdir}"/etc/dpm-query
	cp src/service.cfg "${pkgdir}"/etc/dpm-query

	cp src/dpm-query.service "${pkgdir}"/usr/lib/systemd/system

  # Set bits
  chmod 755 "${pkgdir}"/usr/bin/dpm-query
  chmod 755 "${pkgdir}"/usr/bin/dpm-query-service
  chmod 644 "${pkgdir}"/etc/dpm-query/dpm.cfg
  chmod 644 "${pkgdir}"/etc/dpm-query/service.cfg
  chmod 644 "${pkgdir}"/usr/lib/systemd/system/dpm-query.service
}
