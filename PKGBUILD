# Maintainer: Roboron <robertoms258 at gmail dot com>

pkgname=simutrans-extended-git
pkgver=r21048.1617e2caa
pkgrel=1
pkgdesc="Transportation simulation game - Extended Version - Nightly build from git"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
depends=('gcc-libs' 'zstd' 'zlib' 'sdl2' 'hicolor-icon-theme' 'freetype2' 'miniupnpc' 'fluidsynth')
makedepends=('pkgconf' 'git' 'cmake')
optdepends=('soundfont-fluid: Default MIDI soundfont for music'
			'soundfont-realfont: recommended MIDI soundfont'
            'simutrans-extended-pak128.britain: High resolution graphics set for Simutrans Extended, with a British theme'
            'simutrans-extended-pak128.cs: High resolution graphics set for Simutrans Extended, with a czech theme'
            'simutrans-extended-pak128.sweden: High resolution graphics set for Simutrans Extended, with a swedish theme'
            'simutrans-extended-pak256: Highest resolution graphics set for Simutrans Extended')
conflicts=('simutrans-extended')
source=($pkgname::git+https://github.com/jamespetts/simutrans-extended/
        settings-folder.patch
        path-for-game-data.patch
        simutrans-extended.desktop
        "How to add files and paksets.md")
sha256sums=('SKIP'
            '7ed69019ba97849b65e2b8ac5ad8bf2110a7f048e3590d67c76c9cfca8a10b8d'
            'd1609eb40c9bbcdb6f13e10d1150f7995700249053aaa56da8b4a0aaf24f7260'
            '0efcf72d3670c53de99c44cb0d8f43f7e7663fda5df0f631ba6c687cc85967d3'
            '1707b5adff4174af173ac4d7a5cab1fbcda9245e55c0149ed5c3274e7bfc586c')

prepare() {
  cd $pkgname

  # Adjust paths
  patch -Np0 -i ../settings-folder.patch
  patch -Np0 -i ../path-for-game-data.patch
}

build() {
  cd $pkgname
  cmake -S . -B build 
  cmake build -DCMAKE_BUILD_TYPE=Release
  cmake --build build -j$(nproc) --target simutrans-extended
}

package() {
  #binary
  install -Dm755 $pkgname/build/simutrans/simutrans-extended "$pkgdir/usr/bin/simutrans-extended"
  rm $pkgname/build/simutrans/simutrans-extended
  
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans-extended"
  cp -r $pkgname/simutrans/* "$pkgdir/usr/share/games/simutrans-extended"

  #desktop file and icon
  install -Dm644 $pkgname/simutrans.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/simutrans-extended.svg"
  install -Dm644 simutrans-extended.desktop "$pkgdir/usr/share/applications/simutrans-extended.desktop"

  #license
  install -Dm644 $pkgname/LICENSE.txt "$pkgdir/usr/share/licenses/simutrans-extended/license.txt"
  
  install -Dm644 "How to add files and paksets.md" "$pkgdir/usr/share/games/simutrans-extended/How to add files and paksets.md"
}

pkgver() {
    cd $pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
