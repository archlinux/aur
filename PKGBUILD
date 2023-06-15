# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Yaohan Chen <yaohan.chen@gmail.com>
pkgname=anura
pkgver=4.0.0
pkgrel=2
pkgdesc="A fully-featured game engine, the tech behind the spectacular Frogatto & Friends"
arch=('x86_64')
url="https://github.com/anura-engine/anura"
license=('GPL')
depends=('libgl' 'mesa' 'glew' 'cairo' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'libpng' 'boost-libs')
optdepends=('frogatto-git: the default game module'
            'box2d: box2d physics')
makedepends=('git' 'boost' 'glm')
source=("git+https://github.com/anura-engine/anura.git#tag=v$pkgver"
        'git+https://github.com/sweetkristas/imgui.git')
sha512sums=('SKIP'
            'SKIP')

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.imgui.url "$srcdir/imgui"
  git -c protocol.file.allow=always submodule update --init --recursive
  git submodule update
}

build() {
  cd $pkgname

  export CXXFLAGS="${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS} -Wno-error=return-type -Wno-error=dangling-reference -Wno-error=deprecated-declarations -Wno-error=odr"
  make anura
}

package() {
  cd $pkgname
  install -D -m755 anura $pkgdir/usr/lib/anura/anura

  _installdir=$pkgdir/usr/share/anura
  mkdir -p $_installdir
  cp -r data $_installdir
  cp -r images $_installdir
  cp -r music $_installdir
  cp -r modules $_installdir
}

# vim:set ts=2 sw=2 et:
