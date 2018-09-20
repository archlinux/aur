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
pkgver=10.33_RC1.r1015
pkgrel=1
pkgdesc='A regex library that implements Perl 5-style regular expressions, 2nd version, includes pcregrep'
arch=('i686' 'x86_64')
url='http://www.pcre.org/'
license=('BSD')
depends=('gcc-libs' 'readline' 'zlib' 'bzip2' 'bash')
makedepends=('subversion' 'libtool')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
_verwatch=('ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/' 'pcre2-\([0-9\.]\+\)\.tar\.bz2' 'f')
source=("${_srcdir}::svn://vcs.exim.org/${_pkgname}/code/trunk")
validpgpkeys=('45F68D54BBE23FB3039B46E59766E084FB0F43D8') # Philip Hazel
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}/"
  local _ver="$(sed -ne 's:^Version\s\([^\s]\+\)\s.*$:\1:p' 'ChangeLog' | sed -e 's:\.\([A-Z]\):_\1:' -e 's:-:_:' | head -n1)"
  local _rev="$(svnversion | tr -d 'a-zA-z')"
  printf '%s.r%s' "${_ver}" "${_rev}"
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    ./autogen.sh
    ./configure \
      --prefix='/usr' \
      --enable-pcre2-16 \
      --enable-pcre2-32 \
      --enable-jit \
      --enable-pcre2grep-libz \
      --enable-pcre2grep-libbz2 \
      --enable-pcre2test-libreadline
  fi
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -s -j "${_nproc}"
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  make -s -j1 check
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 DESTDIR="${pkgdir}" install

  install -Dpm644 'LICENCE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
