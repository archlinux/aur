# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Arthus Belliqueux <contact@arthus.net>
# Contributor: Campbell Barton <ideasman42@gmail.com>

export GIT_LFS_SKIP_SMUDGE=1
export GIT_CLONE_PROTECTION_ACTIVE=false

pkgname=tahoma2d-git
pkgver=1.5.r0.gce378cbd6
pkgrel=1
pkgdesc="Software for producing a 2D animation"
arch=(x86_64)
url="https://tahoma2d.org/"
license=(BSD-3-Clause)
depends=(cblas ffmpeg freeglut glew hicolor-icon-theme libmypaint qt5-multimedia qt5-script qt5-svg qt5-serialport superlu opencv)
makedepends=(git git-lfs boost cmake qt5-tools)
provides=(tahoma2d)
conflicts=(tahoma2d)
options=(!lto)
source=("git+https://github.com/tahoma2d/tahoma2d.git#branch=v1.5"
         0001-cmake-fix.patch)
sha256sums=('SKIP'
            '238d8e73554cc6751bbcb50ba054f3a335b767277cfbf36adae4c8bb73c6a10b')

pkgver() {
  cd tahoma2d
  git describe --long --tags --exclude nightly | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  [[ -d build ]] || mkdir build

  cd tahoma2d
  # Specify path for ffmpeg
  #sed -i 's|"ffmpegPath", QMetaType::QString, ""|"ffmpegPath", QMetaType::QString, "/usr/bin"|' toonz/sources/toonzlib/preferences.cpp

  # https://github.com/tahoma2d/tahoma2d/issues/1600#issuecomment-2408657568
  patch -Np1 -i ../0001-cmake-fix.patch
}

build() {
  #export CFLAGS+=" -w"
  #export CXXFLAGS+=" -w"

  pushd  "tahoma2d/thirdparty/tiff-4.2.0"
  ./configure --with-pic --disable-jbig --disable-webp
  make
  popd

  # substitute binaries names to be non-conflicting with opentoonz https://github.com/tahoma2d/tahoma2d/issues/1032

  sed -i 's/(tcleanup/(tdcleanup/g'                 tahoma2d/toonz/sources/tcleanupper/CMakeLists.txt
  sed -i 's/(tcomposer/(tdcomposer/g'               tahoma2d/toonz/sources/tcomposer/CMakeLists.txt
  sed -i 's/(tconverter/(tdconverter/g'             tahoma2d/toonz/sources/tconverter/CMakeLists.txt
  sed -i 's/(tfarmcontroller/(tdfarmcontroller/g'   tahoma2d/toonz/sources/toonzfarm/tfarmcontroller/CMakeLists.txt
  sed -i 's/(tfarmserver/(tdfarmserver/g'           tahoma2d/toonz/sources/toonzfarm/tfarmserver/CMakeLists.txt

  sed -i 's/(lzocompress/(tdlzocompress/g'      tahoma2d/thirdparty/lzo/driver/CMakeLists.txt
  sed -i 's/(lzodecompress/(tdlzodecompress/g'  tahoma2d/thirdparty/lzo/driver/CMakeLists.txt

  sed -i 's/TARGET_FILE:tcleanup/TARGET_FILE:tdcleanup/g; s/TARGET_FILE:tcomposer/TARGET_FILE:tdcomposer/g; s/TARGET_FILE:tconverter/TARGET_FILE:tdconverter/g; s/TARGET_FILE:tfarmcontroller/TARGET_FILE:tdfarmcontroller/g; s/TARGET_FILE:tfarmserver/TARGET_FILE:tdfarmserver/g; s/TARGET_FILE:lzocompress/TARGET_FILE:tdlzocompress/g; s/TARGET_FILE:lzodecompress/TARGET_FILE:tdlzodecompress/g' tahoma2d/toonz/sources/toonz/CMakeLists.txt

  cd build
  cmake -G "Unix Makefiles" ../tahoma2d/toonz/sources -Wno-dev \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=YES \
    -DWITH_TRANSLATION=OFF

  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../tahoma2d/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
