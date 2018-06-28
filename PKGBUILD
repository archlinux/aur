# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Based on the pcre package
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

set -u
_pkgname='pcre'
pkgname="${_pkgname}-svn"
_srcdir="${pkgname}"
pkgver=8.43.r1736
pkgrel=1
pkgdesc='A regex library that implements Perl 5-style regular expressions, includes pcregrep'
arch=('i686' 'x86_64')
url='http://www.pcre.org/'
license=('BSD')
depends=('gcc-libs' 'readline' 'zlib' 'bzip2' 'bash')
makedepends=('subversion' 'libtool' 'patch')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
_verwatch=('ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/' 'pcre-\([0-9\.]\+\)\.tar\.bz2' 'f')
_archlink="@@@::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/@@@?h=packages/${_pkgname}"
source=("${_srcdir}::svn://vcs.exim.org/${_pkgname}/code/trunk"
        "${_archlink//@@@/01-seven-security-patches.patch}")
validpgpkeys=('45F68D54BBE23FB3039B46E59766E084FB0F43D8') # Philip Hazel
sha256sums=('SKIP'
            'c27607ae7907d0ecfa360c1a679618475b674541cb36c366d8b58c3571ec6a79')

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
  #patch -p1 < "${srcdir}/01-seven-security-patches.patch" # already in svn version
  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --enable-unicode-properties \
    --enable-pcre16 \
    --enable-pcre32 \
    --enable-jit \
    --enable-pcregrep-libz \
    --enable-pcregrep-libbz2 \
    --enable-pcretest-libreadline
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
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
  make -s DESTDIR="${pkgdir}" install

  install -Dpm644 'LICENCE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
