# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Evert Vorster <evorster@gmail.com>

pkgname=vegastrike-engine-release-git
pkgver=0.9.1.r0.gf648e2c99
pkgrel=1
pkgdesc="A spaceflight simulator in massive universe"
arch=(x86_64)
url="https://www.vega-strike.org/"
license=(GPL-3.0-or-later)
depends=(boost-libs python freeglut gtk3 libvorbis openal sdl glu

         # namcap implicit depends
         glibc gcc-libs glib2 zlib libpng libglvnd expat libjpeg-turbo)
makedepends=(git cmake boost)
provides=(vegastrike-engine)
conflicts=(vegastrike-engine)
source=("git+https://github.com/vegastrike/Vega-Strike-Engine-Source#branch=0.9.x"
		vegastrike-engine-Add-missing-header.patch)
sha256sums=('SKIP'
            'beb8280fcf695de4d420ea271d3bfff0d9780127bc2c13b8b9cc5fd6deb4038d')

prepare() {
  cd Vega-Strike-Engine-Source
  patch -Np1 -i ../vegastrike-engine-Add-missing-header.patch
}

pkgver() {
  cd Vega-Strike-Engine-Source
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  # buildtype None, enable ffmpeg, ogre will fail, not supported
  # https://github.com/vegastrike/Vega-Strike-Engine-Source/issues/777#issuecomment-1763235378

  local _flags=(
    #-DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-error=format-security"
    -DENABLE_PIE=ON
  )

  cmake -B build -S "Vega-Strike-Engine-Source/engine" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  rm -rf ${pkgdir}/usr/include
  rm -rf ${pkgdir}/usr/lib
}
