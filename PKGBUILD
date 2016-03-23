# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Rafal Michalski <plum.michalski@gmail.com>, Thomas Laroche <tho.laroche@gmail.com>

# https sites display mostly garbage, as they should. Try http sites.
# The XFCE Terminal is more tolerant of the control characters than PuTTY.

set -u
pkgname='justniffer'
pkgver='0.5.15'
pkgrel='1'
pkgdesc='TCP sniffer. It reassembles and reorders packets and displays the tcp flow in a customizable way.'
arch=('i686' 'x86_64')
url='http://justniffer.sourceforge.net'
license=('GPL')
depends=('python2>=2.4' 'libpcap' 'boost') # 'libnids' the package includes its own custom version of libnids
# I suspect python2 is a makedepends. No python code goes into the package.
_verwatch=('https://sourceforge.net/projects/justniffer/files/' "\s\+${pkgname}_\([0-9.]\+\)\.tar\.gz" 'f')
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}_${pkgver}.tar.gz")
sha256sums=('d1ad84933cceda842e6b9b2f34891daa69279b643bd346f9e4778910eba50bf6')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"

  rm -rf '.svn'
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
  autoreconf --force --install
  CPPFLAGS='-P' CXXFLAGS='-O2' CFLAGS='-O2' LDFLAGS='-Wl,-z,defs' \
  ./configure --enable-dependency-tracking --enable-python --prefix='/usr' --sbindir='/usr/bin' PYTHON='python2'
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  #local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  make -s # -j "${_nproc}" # Too small
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
