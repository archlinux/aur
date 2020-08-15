_pkgname='desmume'
pkgname="$_pkgname-git"
_pkgver='0.9.11'
_lastrelease='ccbf85ed42e4350af415d56b1465e83614c85ef8'
pkgver=0.9.11.r1384.316103d2
pkgrel=1
pkgdesc="Nintendo DS emulator"
arch=('i686' 'x86_64')
url="https://desmume.org/"
license=('GPL2')
provides=('desmume')
conflicts=('desmume')
depends=('gtk2' 'soundtouch' 'zlib' 'zziplib' 'libpcap' 'glib2' 'glu' 'openal' 'sdl' 'libpng' 'libgl')
makedepends=('autoconf' 'automake' 'pkg-config' 'git' 'gtk2' 'zlib' 'intltool' 'glu' 'sdl' 'zziplib' 'soundtouch' 'libpcap' 'glib2' 'sdl' 'desktop-file-utils' 'openal' 'libpng' 'libgl')
source=("$_pkgname::git+https://github.com/TASVideos/desmume.git")
sha512sums=('SKIP')

optdepends=('agg: to enable the HUD, requires --enable-hud at build time')

_builddir="$_pkgname/src/frontend/posix"

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "$_pkgver.r$(git rev-list --count $_lastrelease..HEAD).$(git rev-parse --short HEAD)"

}

prepare(){
  cd "${srcdir}/$_pkgname"
  git submodule init
  git submodule update --init --recursive

  cd "${srcdir}/${_pkgname}/${_builddir}"
  ./autogen.sh


  CFLAGS="-O2 -minline-all-stringops" \
  CXXFLAGS=$CFLAGS \
  ./configure \
    --prefix=/usr \
    --enable-openal \
    --enable-wifi #\
#    --enable-hud  #requires https://aur.archlinux.org/packages/agg/
}

build() {
  cd "${srcdir}/${_pkgname}/${_builddir}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}/${_builddir}"

  make DESTDIR="${pkgdir}" install
}
