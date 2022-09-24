# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: skottish <skottish97215 at gmail com>

set -u
_pkgname='mt-st'
pkgname="${_pkgname}-git"
pkgver=1.4.r10.gfbfd923
pkgrel=1
pkgdesc='Utilities for managing magnetic tape storage devices'
arch=('i686' 'x86_64')
#url="https://github.com/Distrotech/${_pkgname}"
url="https://github.com/iustin/${_pkgname}"
license=('GPLv2')
depends=('tar')
makedepends=('git')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_pkgname}"
  #printf '%s.r%s.g%s' "$(sed -ne 's:^#define VERSION "\(.*\)"$:\1:p' "mt.c")" "$(git rev-list --count HEAD)" "$(git describe --always )" # '
  git describe --long | sed -E -e 's/^v//' -e 's/[^-]+-g/r&/' -e 's/-/./g'
  set +u
}

prepare() {
  set -u
  cd "${_pkgname}"
  #sed -e 's:^#include <sys/types.h>$:#include <sys/sysmacros.h>\n&:g' -i 'mt.c'
  sed -E \
    -e '/^SBINDIR=/ s:/sbin:/usr/bin:g' \
    -e '/^BINDIR=/ s:/bin:/usr/bin:g' \
    -e '/^COMPLETIONINSTALLDIR=/ s:/etc:/usr/share:g' \
    -i 'Makefile'
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
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/bin/"{mt,mt-st}
  mv "${pkgdir}/usr/share/man/man1/"{mt.1,mt-st.1}
  set +u
}
set +u
