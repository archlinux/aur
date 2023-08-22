# Maintainer: Kacper Zybała <zyperpl at gmail dot com>

pkgname=ldtk
pkgver=1.3.4
pkgrel=1
pkgdesc="Modern and efficient 2D level editor with a strong focus on user-friendliness"
arch=('x86_64')
url="https://github.com/deepnight/ldtk"
license=('MIT')
makedepends=('haxe' 'git' 'nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/deepnight/$pkgname/archive/v$pkgver.tar.gz"
        "${pkgname}.desktop")
sha256sums=('876abc187db5678f8cc23f95a2b4ac3330c6f8c88623886da598817f8f9534c5'
            '5f15970200f2b14fd79eaaac03347e0b2d4845403347cb6ecfa57ee17e6642c0')
options=('!strip' 'emptydirs' '!makeflags')

build() {
  haxelib deleterepo --quiet --always
  haxelib newrepo

  pushd "${pkgname}-${pkgver}"
  haxelib install ase --always
  haxelib install uuid --always
  haxelib install format --always
  haxelib git castle https://github.com/deepnight/castle d21c6243320643f1b0f6ef8e82c4d12731379b5c --always
  haxelib git heaps https://github.com/deepnight/heaps.git 506ab3a5c1beae5c8438e67558f0b061728c2124 --always
  haxelib git hxnodejs https://github.com/HaxeFoundation/hxnodejs.git 504066dc1ba5ad543afa5f6c3ea019f06136a82b --always
  haxelib git electron https://github.com/deepnight/hxelectron.git 17a3bbb146422de782c30be8960b23faa272e855 --always
  haxelib git heaps-aseprite https://github.com/AustinEast/heaps-aseprite.git 479faba0cce24fa395582bfebb8630b122dcc9e6 --always
  haxelib git deepnightLibs https://github.com/deepnight/deepnightLibs.git c8404fe6cae97987b7c7eef590d07f3d6be097aa --always
  haxelib git ldtk-haxe-api https://github.com/deepnight/ldtk-haxe-api.git fcfcfa5c80b11f288561be74c819b4231fbbc69a --always
  haxelib list
  
  pushd app
  npm cache clean --force --cache "${srcdir}/npm-cache"
  npm install --cache "${srcdir}/npm-cache"
  npm run pack-prepare --cache "${srcdir}/npm-cache"
  npm run pack-linux-x86 --cache "${srcdir}/npm-cache"
  popd
  popd
}

package() {
  pushd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "app/assets/appIcon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  
  pushd app/redist/linux-unpacked
  install -Dm644 LICENSE.electron.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSES.chromium.html "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  find * -type f -exec install -Dm755 {} "${pkgdir}/usr/share/${pkgname}/{}" \;
  install -dm755 "${pkgdir}/usr/bin/"
  ln -sf "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin"
  popd
  
  popd
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
