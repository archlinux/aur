# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
pkgname=anura-git
pkgver=r3950.16df0ba55
pkgrel=1
pkgdesc="A fully-featured game engine, the tech behind the spectacular Frogatto & Friends."
arch=(i686 x86_64)
url="https://github.com/anura-engine/anura"
license=('GPL')
depends=(libgl mesa glew cairo sdl2 sdl2_image sdl2_ttf sdl2_mixer libpng boost-libs)
optdepends=('frogatto-git: the default game module'
            'box2d: box2d physics')
makedepends=('git' 'boost' 'glm')
provides=("anura=$pkgver")
conflicts=('anura')
source=('git+https://github.com/anura-engine/anura.git'
        'git+https://github.com/sweetkristas/imgui.git'
        anura.sh)
md5sums=('SKIP'
         'SKIP'
         '15f4c03c2404bcfd7618b8f9e0c850ba')

_gitname=anura

prepare() {
  cd $_gitname
  git submodule init
  git config submodule.imgui.url "$srcdir/imgui"
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname

  # USE_CCACHE=no to honor makepkg's ccache setting.
  make -e USE_CCACHE=no CXXFLAGS='-Wno-error=return-type' anura
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
