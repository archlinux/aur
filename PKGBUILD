# Maintainer: Thomas Schneider <maxmusterm@gmail.com>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=play-emu-ninja-git
_gitname=Play-Build
pkgver=r4796.8e366838
pkgrel=1
pkgdesc="Play! is an experimental Playstation 2 emulator. (build using ninja)"
arch=('i686' 'x86_64')
url="https://github.com/jpd002"
license=('GPL')
makedepends=('git' 'ninja')
conflicts=('play-emu-git')
replaces=('play-emu-git')
depends=('cmake' 'glew' 'mysql++' 'openal' 
	 'qt5-base' 'zlib')
source=('Play-Build::git+https://github.com/jpd002/Play-Build.git'
	'play-emu.desktop'
	'play.png')
md5sums=('SKIP'
	 '59e7114de681f2f96730697cde4f4595'
	 '2c6db31d8119437e5af6fa95b4c1fb8f')

pkgver() {
  cd $_gitname/Play
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
    cd $_gitname
    git submodule update -q --init --recursive
    git submodule foreach "git checkout -q master"
    cd Dependencies
    git submodule update --init
}

build() {
    cd $_gitname/Play/
    mkdir -p build
    cd build
    cmake .. -G"Ninja"
    cmake --build . --config Release
}

package() {
    install -d $pkgdir/usr/bin
    install -d $pkgdir/usr/share/pixmaps
    install -d $pkgdir/usr/share/applications
    install -m755 $srcdir/$_gitname/Play/build/Source/ui_qt/Play $pkgdir/usr/bin/play-emu
    install -m755 play.png $pkgdir/usr/share/pixmaps/play.png
    install -m755 play-emu.desktop $pkgdir/usr/share/applications/play-emu.desktop
}
