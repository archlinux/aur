# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Fabio Loli <fabio.loli@disroot.org>

pkgname=kronos
pkgver=2.3.1
pkgrel=3
pkgdesc='Sega Saturn emulator'
arch=('i686' 'x86_64' 'pentium4')
url="https://fcare.github.io"
_repo='https://github.com/FCare/Kronos'
license=('GPL2')
provides=('kronos')
depends=('freeglut'
	 'glew'
	 'openal'
         'qt5-base'
         'qt5-multimedia'
	 'sdl2')
makedepends=("cmake"
	     "git")
source=("${pkgname}::git+${_repo}.git#tag=${pkgver}_official_release")
md5sums=('SKIP')

prepare() {
    cd "${pkgname}/yabause" || exit
    
    if [[ -d build ]]; then
        rm -rf build
    fi
    mkdir -p build
}

build() {
    export CFLAGS+=" -Wno-format -Wno-format-security"
    export CXXFLAGS="${CFLAGS}"
    cd "${pkgname}/yabause/build" || exit
    cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE='Release' \
      -DYAB_USE_QT5=ON
    make
}

package() {
    cd "${pkgname}/yabause/build"
    make DESTDIR="$pkgdir/" install
}
