# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Evert Vorster <evorster@gmail.com>

pkgname=vegastrike-engine
pkgver=0.9.1
pkgrel=3
pkgdesc="A spaceflight simulator in massive universe"
arch=(x86_64)
url="https://www.vega-strike.org/"
license=(GPL-3.0-or-later)
depends=(boost-libs python freeglut gtk3 libvorbis openal sdl2 glu

         # namcap implicit depends
         glibc gcc-libs glib2 zlib libpng libglvnd expat libjpeg-turbo)
makedepends=(git cmake boost gtest)
source=("git+https://github.com/vegastrike/Vega-Strike-Engine-Source#tag=v${pkgver}"
        vegastrike-engine-boost-1.89.patch
		vegastrike-engine-Add-missing-header.patch)
sha256sums=('602cb322ba7ffa07885e00631892083592ecad8d9687d136734029187dd2dce5'
            'ce05dc2123c496a77d91c68c14d7f23288295ef2ea6b94924689a69fb0124fda'
            'beb8280fcf695de4d420ea271d3bfff0d9780127bc2c13b8b9cc5fd6deb4038d')

prepare() {
  cd Vega-Strike-Engine-Source
  patch -Np1 -i ../vegastrike-engine-Add-missing-header.patch
  patch -Np1 -i ../vegastrike-engine-boost-1.89.patch # remove boost_system
}

build(){
  # buildtype None, enable ffmpeg, ogre will fail, not supported
  # https://github.com/vegastrike/Vega-Strike-Engine-Source/issues/777#issuecomment-1763235378

  local _flags=(
    #-DINSTALL_GTEST=ON  #fail to build using system's gtest
    -DUSE_GTEST=ON
	-DENABLE_PIE=ON
  )

  cmake -B build -S "Vega-Strike-Engine-Source/engine" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # remove bundled gtest,gmock
  rm -rf ${pkgdir}/usr/include
  rm -rf ${pkgdir}/usr/lib
}
