# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=winexe-git
_gitname=winexe-waf
pkgver=1.1.r234.b787d2a
pkgrel=1
pkgdesc="Remotely execute commands on Windows NT/2000/XP/2003 systems"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/winexe/"
license=('GPL3')
depends=('smbclient')
makedepends=('mingw-w64-gcc' 'python2')
provides=('winexe')
conflicts=('winexe')
options=('!buildflags')
source=("git://git.code.sf.net/p/winexe/${_gitname}"
        "samba4.patch")
md5sums=('SKIP'
         '09379f3349f9ebefe2d11b90222110ad')

pkgver() {
  cd "${_gitname}/source"
  VERSION_MAJOR="$(sed -ne 's/^#define VERSION_MAJOR \([0-9]*\)$/\1/p' winexesvc.h)"
  VERSION_MINOR="$(sed -ne 's/^#define VERSION_MINOR \([0-9]*\)$/\1/p' winexesvc.h)"
  printf "${VERSION_MAJOR}.${VERSION_MINOR}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_gitname}/source"
  patch -Np2 -i "${srcdir}/samba4.patch"
}

build() {
  cd "${_gitname}/source"
  python2 waf configure build --prefix="${pkgdir}/usr" --samba-inc-dirs=/usr/include/samba-4.0 --samba-lib-dirs=/usr/lib/samba
}

package() {
  cd "${_gitname}/source"
  python2 waf install
}

# vim:set ts=2 sw=2 et:
