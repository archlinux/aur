# Maintainer: Lari Tikkanen <lartza@wippies.com>
# Contributor: Ian D. Scott <ian@perebruin.com>

# Use an alternative Qt backend to the SDL default. Fails to build with debugging enabled and may not fully work.
_use_qt_backend="0"

# Disable debugging even with SDL backend. Build errors should probably be reported upstream or to me instead.
_disable_debug="0"

pkgname=warzone2100-git
_gitname=warzone2100
pkgver=r13674.1cdd7bdb9
pkgrel=1
pkgdesc="3D realtime strategy game on a future Earth (Git version)"
arch=('i686' 'x86_64')
url="http://wz2100.net/"
license=('GPL')
depends=('qt5-script' 'sdl2' 'libtheora' 'openal' 'libvorbis' 'physfs' 'quesoglc' 'ttf-dejavu')
if [[ ${_use_qt_backend} == "1" ]]; then
    depends=( "${depends[@]}" qt5-x11extras )
fi
makedepends=('zip' 'unzip' 'git')
provides=('warzone' 'warzone2100' 'warzone-svn' 'warzone2100-beta')
conflicts=('warzone2100')
source=('git://github.com/Warzone2100/warzone2100.git'
        'physfs3.patch')
md5sums=('SKIP'
         '97c50bcd407fb90322c8a37523ee8e77')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"

  # Apply patch to fix PhysFS 3 deprecation warnings
  patch -Np1 -i "${srcdir}/physfs3.patch"
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh

  if [[ $_use_qt_backend == "1" ]]; then
    ./configure --prefix=/usr --with-backend=qt --disable-debug
  elif [[ $_disable_debug == "1" ]]; then
    ./configure --prefix=/usr --disable-debug
  else
    ./configure --prefix=/usr
  fi

  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}
