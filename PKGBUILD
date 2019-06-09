# Maintainer: Lari Tikkanen <lartza@wippies.com>
# Contributor: Ian D. Scott <ian@perebruin.com>

pkgname=warzone2100-git
_gitname=warzone2100
pkgver=r14767.de9d91905
pkgrel=1
pkgdesc="3D realtime strategy game on a future Earth (Git version)"
arch=('i686' 'x86_64')
url="http://wz2100.net/"
license=('GPL')
depends=('qt5-script' 'sdl2' 'libtheora' 'openal' 'libvorbis' 'physfs' 'ttf-dejavu' 'glew' 'fribidi' 'xorg-xrandr')
makedepends=('zip' 'unzip' 'git' 'asciidoc')
provides=('warzone' 'warzone2100' 'warzone-svn' 'warzone2100-beta')
conflicts=('warzone2100')
source=('git+https://github.com/Warzone2100/warzone2100.git'
        'git+https://github.com/g-truc/glm.git'
        'git+https://github.com/miniupnp/miniupnp.git'
        'git+https://github.com/BrianGladman/sha.git'
        'git+https://github.com/JuliaStrings/utf8proc.git'
        'git+https://github.com/nemtrif/utfcpp.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"

  git submodule init
  git config submodule.3rdparty/glm.url "$srcdir/glm"
  git config submodule.3rdparty/miniupnp.url "$srcdir/miniupnp"
  git config submodule.3rdparty/sha.url "$srcdir/sha"
  git config submodule.3rdparty/utf8proc.url "$srcdir/utf8proc"
  git config submodule.3rdparty/utfcpp.url "$srcdir/utfcpp"
  git submodule update
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr --disable-debug

  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}
