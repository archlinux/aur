# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
pkgname=anura-git
pkgver=0.0.700.g84ac3cd
pkgrel=1
pkgdesc="A fully-featured game engine, the tech behind the spectacular Frogatto & Friends."
arch=(i686 x86_64)
url="https://github.com/anura-engine/anura"
license=('GPL')
depends=(libgl mesa glew glm sdl2 sdl2_image sdl2_ttf sdl2_mixer libpng boost-libs)
optdepends=('frogatto-git: the default game module'
            'box2d: box2d physics')
makedepends=(git boost)
source=(git+https://github.com/anura-engine/anura.git
        anura.sh)
md5sums=('SKIP'
         '15f4c03c2404bcfd7618b8f9e0c850ba')
install=anura.install

_gitname=anura

pkgver() {
  cd $_gitname
  if _tag=$(git describe 2>/dev/null)
  then
    # Use the tag of the last commit
    echo $_tag | sed 's|-|.|g'
  else
    # The project currently has no tags yet
    echo 0.0.$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
  fi
}

prepare() {
  cd $_gitname

  sed -i -e 's/-lSDL2main//' Makefile
}

build() {
  cd $_gitname

  # USE_CCACHE=no to honor makepkg's ccache setting.
  make USE_CCACHE=no
}

package() {
  install -D -m755 anura.sh $pkgdir/usr/bin/anura-git
  cd $_gitname

  install -D -m755 anura $pkgdir/usr/lib/anura-git/anura

  _installdir=$pkgdir/usr/share/anura-git
  mkdir -p $_installdir
  cp -r data $_installdir
  cp -r images $_installdir
  cp -r music $_installdir
  cp -r modules $_installdir
}

# vim:set ts=2 sw=2 et:
