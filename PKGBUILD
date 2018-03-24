# Maintainer: Lari Tikkanen <lartza@wippies.com>
# Contributor: Ian D. Scott <ian@perebruin.com>

# Use an alternative Qt backend to the SDL default. May not fully work, report issues upstream.
_use_qt_backend="0"

pkgname=warzone2100-git
_gitname=warzone2100
pkgver=r14106.52089c899
pkgrel=1
pkgdesc="3D realtime strategy game on a future Earth (Git version)"
arch=('i686' 'x86_64')
url="http://wz2100.net/"
license=('GPL')
depends=('qt5-script' 'sdl2' 'libtheora' 'openal' 'libvorbis' 'physfs' 'ttf-dejavu' 'glew' 'fribidi' 'xorg-xrandr')
if [[ ${_use_qt_backend} == "1" ]]; then
    depends+=('qt5-x11extras')
fi
makedepends=('zip' 'unzip' 'git' 'gawk' 'flex' 'asciidoc')
provides=('warzone' 'warzone2100' 'warzone-svn' 'warzone2100-beta')
conflicts=('warzone2100')
source=('git+https://github.com/Warzone2100/warzone2100.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh

  if [[ $_use_qt_backend == "1" ]]; then
    ./configure --prefix=/usr --with-backend=qt --disable-debug
  else
    ./configure --prefix=/usr --disable-debug
  fi

  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}
