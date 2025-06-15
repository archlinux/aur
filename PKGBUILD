# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Rafal Michalski <plum.michalski@gmail.com>, Thomas Laroche <tho.laroche@gmail.com>

# https sites display mostly garbage, as they should. Try http sites.
# The XFCE Terminal is more tolerant of the control characters than PuTTY.

set -u
pkgname='justniffer'
pkgver='0.6.9'
pkgrel='1'
pkgdesc='TCP sniffer. It reassembles and reorders packets and displays the tcp flow in a customizable way.'
arch=('i686' 'x86_64')
url='http://justniffer.sourceforge.net'
_giturl='https://github.com/onotelli/justniffer'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'libpcap' 'boost-libs' 'python') # 'libnids' the package includes its own custom version of libnids
#depends+=('python')
# I suspect python2 is a makedepends. No python code goes into the package.
#_verwatch=('https://sourceforge.net/projects/justniffer/files/' "\s\+${pkgname}_\([0-9.]\+\)\.tar\.gz" 'f')
_patches=(
  #'0000-libnids-tcp-notify-struct-timeval.patch'
  '0001-io_service-to-io_context.patch'
)
_srcdir="justniffer-${pkgver}"
source=("${_srcdir//-/_}.tar.gz::${_giturl}/archive/refs/tags/v${pkgver}.tar.gz" "${_patches[@]}")
if [ "$(vercmp "${pkgver}" "0.6.0")" -ge 0 ]; then
  _srcdir+='/main'
fi
md5sums=('84edbd37226d9297bcde147060cee8fa'
         '53c7d7dd2f38aaf727fedc9236de8bff')
sha256sums=('593f278e9e97ab94d6c3d9c94902bbd70e32d40a9d9c60fb772c41cd00a3c5c8'
            '1c819bdb553f022fed906aece6d114de8c0bbdec8c4f6b7aa1a16c964fdb816e')

prepare() {
  set -u
  cd "${_srcdir%%/*}"

  rm -rf '.svn' '.git'

  local _pt _ptf=() _pts=()
  for _pt in "${_patches[@]}"; do
    set +u; msg2 "Patch ${_pt}"; set -u
    if patch -Nup1 --no-backup-if-mismatch -i "${srcdir}/${_pt}"; then
      _pts+=("${_pt}")
    else
      _ptf+=("${_pt}")
    fi
  done
  if [ "${#_ptf[@]}" -gt 0 ]; then
     if [ "${#_pts[@]}" -gt 0 ]; then
       printf 'Patch success %s\n' "${_pts[@]}"
       printf 'Warning: Some old patches may need to be removed even if they are successful\n'
     fi
     printf 'Patch failed %s\n' "${_ptf[@]}"
     set +x
     false
  fi
  #cd "${srcdir}"; cp -pr "${_srcdir%%/*}" 'a'; ln -s "${_srcdir%%/*}" 'b'; false
  #diff -pNaru5 'a' 'b' > "0000-$RANDOM.patch"

  cd "${srcdir}/${_srcdir}"
if ! :; then
  #Use python 2.x instead of 3.x
  sed -i -e 's/python/python2/' python/*.py
  sed -i -e 's/python/python2/' 'python/justniffer-grab-http-traffic.in'
  sed -i -e 's/do_subst = python/do_subst = python2/' python/Makefile.*

  # The behaviour of inline is no longer compatible with the included libnids so we take them out (0.5.12)
  sed -i -e 's/^inline int/int/g' 'lib/libnids-1.21_patched/src/'{util.c,util.h}
  # This fixes the i686 version
  sed -i -e 's/^inline / /g' 'lib/libnids-1.21_patched/src/checksum.c'

  #Unpatch the non working inline patch for GCC5 (0.5.14, 0.5.15)
  sed -i -e 's:__GNUC__>=5:0:g' 'lib/libnids-1.21_patched/src/util.h'
  sed -i -e 's:__GNUC__<5:1:g' 'lib/libnids-1.21_patched/src/util.c'

  sed -i -e '/^ACLOCAL_AMFLAGS =/d' 'Makefile.am'

  rm -rf 'm4/' # http://stackoverflow.com/questions/3096989/libtool-version-mismatch-error
  mkdir 'm4'
fi
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'configure' ]; then
    autoreconf --force --install
  fi
  if [ ! -s 'Makefile' ]; then
    CFLAGS+=' -std=gnu17 -Wno-incompatible-pointer-types'
    CFLAGS+=' -Wno-implicit-int -Wno-return-mismatch'
    #CPPFLAGS='-P' CXXFLAGS='-O2' CFLAGS='-O2' LDFLAGS='-Wl,-z,defs' \\
    local _conf=(
      --enable-dependency-tracking
      --disable-python
      --prefix='/usr'
      --sbindir='/usr/bin'
      # PYTHON='python2'
      # GCC='gcc-14'
      # CXX='g++-14'
    )
    ./configure "${_conf[@]}"
  fi
  nice make -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -j1 DESTDIR="${pkgdir}" install
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
