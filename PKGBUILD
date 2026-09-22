# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Arthus Belliqueux <contact@arthus.net>
# Contributor: Campbell Barton <ideasman42@gmail.com>

export GIT_LFS_SKIP_SMUDGE=1
export GIT_CLONE_PROTECTION_ACTIVE=false

pkgname=tahoma2d
pkgver=1.6.3
pkgrel=1
pkgdesc="Software for producing a 2D animation"
arch=(x86_64)
url="https://github.com/tahoma2d/tahoma2d"
license=(BSD-3-Clause)
depends=(
    cblas
    ffmpeg
    freeglut
    glew
    glibc
    glu
    hicolor-icon-theme
    libdeflate
    libgcc
    libglvnd
    libjpeg-turbo
    libmypaint
    libpng
    libstdc++
    lz4
    lzo
    opencv
    qt5-base
    qt5-multimedia
    qt5-script
    qt5-serialport
    qt5-svg
    sh
    superlu
    xz
    zlib
    )
makedepends=(
    boost
    cmake
    git
    git-lfs
    qt5-tools
    )
source=("git+https://github.com/tahoma2d/tahoma2d.git#commit=dce140a86050e6d7795eb97cdc38385c8ded19c4")
sha256sums=('b7ed81a5833d00cfb2a0a300fb6cf58a4b4daca491f00ca53230a55928fd615d')

prepare() {
  cd tahoma2d
  # Specify path for ffmpeg
  #sed -i 's|"ffmpegPath", QMetaType::QString, ""|"ffmpegPath", QMetaType::QString, "/usr/bin"|' toonz/sources/toonzlib/preferences.cpp
}

pkgver() {
  cd tahoma2d
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  # This disable showing all warning which are quite a lot for this project
  export CFLAGS+=" -w"
  export CXXFLAGS+=" -w"

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

  local _flags=(
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DCMAKE_SKIP_RPATH=YES
    -DWITH_TRANSLATION=OFF
    -G "Unix Makefiles"
  )

  cmake -B build -S "tahoma2d/toonz/sources" -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 tahoma2d/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
