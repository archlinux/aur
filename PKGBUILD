# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname='gpm'
pkgname="lib32-${_pkgname}"
pkgver='1.20.7.r38.ge82d1a6'
pkgrel='2'
_commit='e82d1a653ca94aa4ed12441424da6ce780b1e530'
pkgdesc='A mouse server for the console and xterm (32 bit)'
arch=('x86_64')
url='https://www.nico.schottelius.org/software/gpm/'
license=('GPL')
depends=('lib32-ncurses' "${_pkgname}")
makedepends=('git')
options=('!makeflags')
_srcdir="${_pkgname}"
source=(
  "git+https://github.com/telmich/gpm.git#commit=${_commit}"
  'https://www.linuxfromscratch.org/patches/blfs/13.0/gpm-1.20.7-gcc15_fixes-1.patch'
)
md5sums=('92b67ec28ce0c2f0a42bc45a1511becc'
         'd9978705320563da2a8353cfbe6825c3')
sha256sums=('7db4089030c128d9ee5fb1afb08251d328f8f8835e4716ff41c6c08c1a90bed2'
            'ce5421d566d16105d042a9715aecfb70e6d5df669ec605ff4a6399cb31fc8d27')

pkgver() {
  cd "${_srcdir}"

  GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"
  printf '%s.r%s.g%s' \
    "${GITTAG}" \
    "$(git rev-list --count ${GITTAG}..)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_srcdir}"

  patch -Np1 -i "${srcdir}/gpm-1.20.7-gcc15_fixes-1.patch"
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${_srcdir}"
  ./autogen.sh
  ./configure --prefix='/usr' --sysconfdir='/etc' --sbindir='/usr/bin' --libdir='/usr/lib32'
  make
}

package() {
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}" install

# library fixes
  cd "${pkgdir}/usr/lib32/"
  ln -s libgpm.so.2.* 'libgpm.so'
  chmod 755 "${pkgdir}"/usr/lib32/libgpm.so.*

  rm -rf "${pkgdir}"/usr/{bin,include,share} "${pkgdir}/etc"
}
