# Maintainer: linrs <LinRs at users.noreply.github.com>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Jacob Emmert-Aronson <jacob at mlaronson dot com>
# Contributor: Rene Schoebel <schoebel.r at gmail dot com>
# Contributor: ZekeSulastin <zekesulastin@gmail.com>
# Contributor: Mr_Robotic_Evil <mr.robotic.evil@googlemail.com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>

# This PKGBUILD only generates the engine binary.
# The retail Freespace 2 data is required to play the
# original game and most mods.  You can use a non-AUR/pacman'd
# copy, but you'll be on your own as far as running the game
# and mods are concerned.
# Check the AUR package 'fs2_open-data' for details.

pkgname=fs2_open
pkgver=23_2_0_RC1
pkgrel=1
pkgdesc="An enhancement of the FreeSpace 2 engine, need game data"
url="https://scp.indiegames.us/"
arch=(i686 x86_64)
license=('custom:fs2_open')
depends=(libjpeg libpng freetype2 ffmpeg sdl2 lua51 openal jansson)
makedepends=(git cmake doxygen)
optdepends=('fs2_open-mediavps: extensive audiovisual enhancements'
            'fs2_open-data: extensive retail data'
            'wxlauncher: cross-platform fs2 launcher')
install=$pkgname.install
source=("fs2open::git+https://github.com/scp-fs2open/fs2open.github.com.git#tag=release_${pkgver}"
        "asarium-cmake-modules::git+https://github.com/asarium/cmake-modules.git"
        "git+https://github.com/asarium/libRocket.git"
        'fs2_open.sh'
        'fs2_open.desktop'
        'options')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'b79e907883949e7fe3a9b10ca3053d87b3e7f393deb41ecd905a823ef60d77e1'
            'cac8914fb96eb4f09d8dec0005ccb3626499ab9f3f4c5f64c11bd8d2e913e372'
            'c593dacd19705f1aaf23170d7b65b4621945200d3a496e256f77e3f1f0279741')

prepare() {
  cd "fs2open"
  git submodule init
  git config submodule.cmake/external/rpavlik-cmake-modules.url "${srcdir}/asarium-cmake-modules"
  git config submodule.lib/libRocket.url "${srcdir}/libRocket"
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -B build -S "fs2open" -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo

  cmake --build build
}

package() {
  #this don't play nice with make/cmake install
  binary=`find build/bin/fs2_open*`
  install -Dm755 ${binary} "$pkgdir/opt/$pkgname/fs2_open"

  install -Dm644 fs2open/Copying.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 fs2_open.desktop "$pkgdir/usr/share/applications/fs2_open.desktop"
  install -Dm644 options "$pkgdir/usr/share/$pkgname/options"
  install -Dm755 fs2_open.sh "$pkgdir/usr/bin/fs2_open"
}
