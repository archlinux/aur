# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Based on the pcre2 package
# Maintainer: Mateusz 'mrlemux' Lemusisk mrlemux at gmail dotcom
# Based on the pcre package
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

set -u
_pkgname='pcre2'
pkgname="${_pkgname}-svn"
_srcdir="${pkgname}"
pkgver=10.21.r344
pkgrel=1
pkgdesc='A regex library that implements Perl 5-style regular expressions, 2nd version, includes pcregrep'
arch=('i686' 'x86_64')
url='http://www.pcre.org/'
license=('BSD')
depends=('gcc-libs' 'readline' 'zlib' 'bzip2' 'bash')
makedepends=('subversion' 'libtool')
validpgpkeys=('45F68D54BBE23FB3039B46E59766E084FB0F43D8') # Philip Hazel
_verurl='ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/'
_versed='pcre2-\([0-9\.]\+\)\.tar\.bz2'
_veropt='f'
source=("${_srcdir}::svn://vcs.exim.org/${_pkgname}/code/trunk")
sha256sums=('SKIP')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")

pkgver() {
  set -u
  cd "${_srcdir}/"
  local _version="$(sed -ne 's:^Version\s\([0-9]\+\.[0-9]\+\)\s.*$:\1:p' 'ChangeLog' | head -n1)"
  _version="${_version//-/.}.r$(svnversion | tr -d 'a-zA-z')"
  echo "${_version}"
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --enable-pcre2-16 \
    --enable-pcre2-32 \
    --enable-jit \
    --enable-pcre2grep-libz \
    --enable-pcre2grep-libbz2 \
    --enable-pcre2test-libreadline
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -s -j $(nproc)
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  make -s -j $(nproc) check
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s DESTDIR="${pkgdir}" install

  install -Dpm644 'LICENCE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
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
  #! grep -lr "/usr/local" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  #! pcre2grep -Ilr "(?<!/usr)/bin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /bin"; false; } # 1 script has /bin/sh
}
set +u

# vim:set ts=2 sw=2 et:
