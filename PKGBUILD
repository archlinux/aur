# Maintainer: Kacper Zybała <zyperpl at gmail dot com>

pkgname=ldtk
pkgver=1.3.0
pkgrel=1
pkgdesc="Modern and efficient 2D level editor with a strong focus on user-friendliness"
arch=('x86_64')
url="https://github.com/deepnight/ldtk"
license=('MIT')
makedepends=('haxe' 'git' 'nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/deepnight/$pkgname/archive/v$pkgver.tar.gz"
        "${pkgname}.desktop")
sha256sums=('2c164ea74248f4c38cb160e94c88d45a667a0512b0ed6ab4352b8635d67c9a93'
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
  haxelib git hxnodejs https://github.com/HaxeFoundation/hxnodejs.git 14bc6880d4557d70e567a21ed50dff5587083f21 --always
  haxelib git electron https://github.com/tong/hxelectron.git c47f68fad5c24cf81cd30426bf9e9d1b7c5cf843 --always
  haxelib git heaps-aseprite https://github.com/AustinEast/heaps-aseprite.git 81aee42a6c1548433003e3c589d58e9fdf01415e --always
  haxelib git deepnightLibs https://github.com/deepnight/deepnightLibs.git 7a7f7f24f49972a35d4d8a4c4c92c393ea596865 --always
  haxelib git ldtk-haxe-api https://github.com/deepnight/ldtk-haxe-api.git 34a7e057e05b513f564e2d6f1279fbd154e9f02c --always
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
