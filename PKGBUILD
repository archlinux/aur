# Maintainer: Roboron <robertoms258 at gmail dot com>
#
# PKGBUILD adapted from Simutrans https://www.archlinux.org/packages/community/x86_64/simutrans/
# Simutrans Extended is in active development - this package is updated nightly

pkgname=simutrans-extended
pkgver=20200316
pkgrel=1
pkgdesc="Transportation simulation game - Extended Version"
arch=('x86_64')
url="https://www.simutrans.com/"
license=('custom:Artistic')
depends=('gcc-libs' 'zlib' 'sdl_mixer' 'bzip2' 'hicolor-icon-theme')
makedepends=('dos2unix')
optdepends=('timidity++: play MIDI music'
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
            'eda4cc07461c77b5af211ea40dc0a400b045b088c50c442b34e6e762974629da'
            '28c6f1b652de1b1979407c5b764774f4a342035a933945f1b82da1e1d92d02b4'
            'd38e01738dbdd02ab52b600cec5019d9465b4f177b0f61b249e01de5e85631f4'
            '0efcf72d3670c53de99c44cb0d8f43f7e7663fda5df0f631ba6c687cc85967d3'
            '18444d02d9212938abc26bec60dda401dfeb24579c89be72274ec0da3c5d271d')

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
  install -Dm644 $pkgname/simutrans/license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
