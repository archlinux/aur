# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Gustavo Lopes <mail@geleia.net>

set -u
_pkgname='riofs'
pkgname="${_pkgname}-git"
_srcdir="${pkgname}"
pkgver=0.6.r47.gc6d8e8e
pkgrel=1
pkgdesc='FUSE userspace filesystem for Amazon AWS S3 buckets'
arch=('i686' 'x86_64')
url="https://github.com/skoobe/${_pkgname}"
license=('GPL3')
depends=('fuse' 'glib2' 'libevent' 'libxml2' 'openssl')
makedepends=('pkg-config' 'git')
_verwatch=("${url}/releases" "${url#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
source=("${_srcdir}::git+${url}.git") # #commit=${pkgver##*.g}
sha256sums=('SKIP')
conflicts="${_pkgname}"
provides="${_pkgname}=${pkgver%.r*}"

pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long --tags | sed -e 's/^v//g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  ./autogen.sh
  ./configure --prefix='/usr' --includedir='/usr/include/riofs'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -s -j $(nproc)
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s DESTDIR="${pkgdir}" install
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
  ! pcre2grep -Ilr "(?<!/usr)/bin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
}
set +u

# vim:set ts=2 sw=2 et:
