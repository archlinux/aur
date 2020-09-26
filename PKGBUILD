_pkgname='desmume'
pkgname="$_pkgname-git"
_pkgver='0.9.11'
_lastrelease='ccbf85ed42e4350af415d56b1465e83614c85ef8'
pkgver=0.9.11.r1431.8aaabb9b0
pkgrel=1
pkgdesc="Nintendo DS emulator"
arch=('i686' 'x86_64')
url="https://desmume.org/"
license=('GPL2')
provides=('desmume')
conflicts=('desmume')
depends=('glib2' 'sdl' 'zlib' 'libgl' 'openal' 'gtk3' 'libpcap' 'libpng')
makedepends=('meson' 'pkg-config' 'intltool' 'desktop-file-utils' 'git' 'glib2' 'sdl' 'zlib' 'libgl' 'openal' 'gtk3' 'libpcap' 'libpng')
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

  meson setup ../../../build/ \
        --prefix=/usr \
        --buildtype=release \
        --optimization=2 \
        --strip \
        -Dc_args='-minline-all-stringops -D_FORTIFY_SOURCE=2' \
        -Db_pie=true \
        -Dopenal=true \
        -Dwifi=true

  meson configure ../../../build/
}

build() {
  cd "${srcdir}/${_pkgname}/${_pkgname}/build"
  ninja -C ./
}

package() {
  cd "${srcdir}/${_pkgname}/${_pkgname}/build"
  DESTDIR="${pkgdir}" meson install
}
