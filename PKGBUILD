# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: skottish <skottish97215 at gmail com>

set -u
_pkgname='mt-st'
pkgname="${_pkgname}-git"
pkgver=1.1.r6.gece9c03
pkgrel=1
pkgdesc='Utilities for managing magnetic tape storage devices'
arch=('i686' 'x86_64')
url="https://github.com/Distrotech/${_pkgname}"
license=('GPLv2')
depends=('tar')
makedepends=('git')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::${url//https/git}.git")
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_pkgname}"
  printf '%s.r%s.g%s' "$(sed -ne 's:^#define VERSION "\(.*\)"$:\1:p' "mt.c")" "$(git rev-list --count HEAD)" "$(git describe --always )" # '
  set +u
}

build() {
  set -u
  cd "${_pkgname}"
  make
  set +u
}

package() {
  set -u
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX='/usr' SBINDIR='/usr/bin' install
  set +u
  # Ensure there are no forbidden paths. Place at the end of package() and comment out as you find or need exceptions. (git-aurcheck)
  ! test -d "${pkgdir}/bin" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
  ! test -d "${pkgdir}/sbin" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! test -d "${pkgdir}/lib" || { echo "Line ${LINENO} Forbidden: /lib"; false; }
  ! test -d "${pkgdir}/share" || { echo "Line ${LINENO} Forbidden: /share"; false; }
  ! test -d "${pkgdir}/usr/sbin" || { echo "Line ${LINENO} Forbidden: /usr/sbin"; false; }
  ! test -d "${pkgdir}/usr/local" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  ! grep -lr "/sbin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! grep -lr "/usr/tmp" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/tmp"; false; }
  ! grep -lr "/usr/local" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  if command -v 'pcre2grep' >/dev/null 2>&1; then
    ! pcre2grep -Ilr "(?<!/usr)/bin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
  fi
}
set +u

# vim:set ts=2 sw=2 et:
