# Maintainer: Roboron <robertoms258 at gmail dot com>
#
# PKGBUILD adapted from Simutrans https://www.archlinux.org/packages/community/x86_64/simutrans/
# Simutrans Extended is in active development - this package is updated nightly

pkgname=simutrans-extended
pkgver=20201209
pkgrel=1
pkgdesc="Transportation simulation game - Extended Version"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
install="$pkgname.install"
depends=('gcc-libs' 'zlib' 'sdl2_mixer' 'bzip2' 'hicolor-icon-theme')
makedepends=('dos2unix' 'git')
optdepends=('fluidsynth: play MIDI music'
            'simutrans-extended-pak128.britain: High resolution graphics set for Simutrans Extended, with a British theme'
            'simutrans-extended-pak128.cs: High resolution graphics set for Simutrans Extended, with a czech theme'
            'simutrans-extended-pak128.sweden: High resolution graphics set for Simutrans Extended, with a swedish theme')
source=(git+https://github.com/jamespetts/simutrans-extended/
        https://raw.githubusercontent.com/aburch/simutrans/8593f5b1248d03f907a149f7abc41ae6512009e1/simutrans.svg
        settings-folder.patch
        path-for-game-data.patch
        config.patch
        simutrans-extended.desktop
        "How to add files and paksets.md")
sha256sums=('SKIP'
            'c0c2dd5da146f64901b00c6ee67e0818a166b983a81cee7897c4843aa9f21c81'
            '7ed69019ba97849b65e2b8ac5ad8bf2110a7f048e3590d67c76c9cfca8a10b8d'
            '30e5d7e4dc90048a3df03d72cf7edc0e983ad1ef1b8ddce37b0aadf52ce66de5'
            'e27c08194522e852385435b9c232bc378b058a3e9245df891787698a1c881ef4'
            '0efcf72d3670c53de99c44cb0d8f43f7e7663fda5df0f631ba6c687cc85967d3'
            '1707b5adff4174af173ac4d7a5cab1fbcda9245e55c0149ed5c3274e7bfc586c')

prepare() {
  # Some files are distributed in DOS format
  find . -type f -exec dos2unix -q '{}' \;
  cd $pkgname

  # Adjust paths
  patch -Np0 -i ../settings-folder.patch
  patch -Np0 -i ../path-for-game-data.patch

  # Configure the build process
  cp config.template config.default
  patch -Np0 -i ../config.patch
}

build() {
  cd $pkgname
  make
}

package() {
  #binary
  install -Dm755 $pkgname/build/default/$pkgname "$pkgdir/usr/bin/$pkgname"
  
  #data
  mkdir -p "$pkgdir/usr/share/games/$pkgname"
  cp -r $pkgname/simutrans/* "$pkgdir/usr/share/games/$pkgname"
  cp -r "How to add files and paksets.md" "$pkgdir/usr/share/games/$pkgname"

  #desktop file and icon
  install -Dm644 simutrans.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

  #license
  install -Dm644 $pkgname/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
