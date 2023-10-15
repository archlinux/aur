# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Evert Vorster <evorster@gmail.com>

pkgname=vegastrike-engine
pkgver=0.8.0
pkgrel=2
pkgdesc="A spaceflight simulator in massive universe"
arch=(x86_64)
url="https://www.vega-strike.org/"
license=(GPL2)
depends=(boost-libs python freeglut gtk3 libvorbis openal sdl glu

         # namcap implicit depends
         glibc gcc-libs glib2 zlib libpng libglvnd expat libjpeg-turbo)
makedepends=(git cmake boost gcc12)
source=("git+https://github.com/vegastrike/Vega-Strike-Engine-Source#tag=v${pkgver}"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/vegastrike-delete-include-eval.h.patch"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/vegastrike-std-cerr-fix.patch")
sha256sums=('SKIP'
            '6f2f6ea1fef1710e7bc696bc0bb7b30749d48949090ddcf7f60d6d9db78c699b'
            '792561d17407c684e5d05656bdd75d57f9d736b852c461dd2338c765b2fa6521')

prepare(){
  cd Vega-Strike-Engine-Source
  patch -Np1 -i ../vegastrike-delete-include-eval.h.patch
  patch -Np1 -i ../vegastrike-std-cerr-fix.patch
}

build(){
  # buildtype None, enable ffmpeg, ogre will fail, not supported
  # https://github.com/vegastrike/Vega-Strike-Engine-Source/issues/777#issuecomment-1763235378

  export CC=/usr/bin/gcc-12 CXX=/usr/bin/g++-12
  cmake -B build -S "Vega-Strike-Engine-Source/engine" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -rf ${pkgdir}/usr/include
  rm -rf ${pkgdir}/usr/lib
}
