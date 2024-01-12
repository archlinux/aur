# Maintainer: Kacper Zybała <zyperpl at gmail dot com>

pkgname=ldtk
pkgver=1.5.2
pkgrel=1
pkgdesc="Modern and efficient 2D level editor with a strong focus on user-friendliness"
arch=('x86_64')
url="https://github.com/deepnight/ldtk"
license=('MIT')
makedepends=('haxe' 'git' 'nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/deepnight/$pkgname/archive/v$pkgver.tar.gz"
        "${pkgname}.desktop")
sha256sums=('931413fbb1aa0ac1bfa47bcf7f8dc95332e4e6ea756fd4b9015e602d36b6ea1c'
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
  haxelib git heaps https://github.com/deepnight/heaps.git c7d31f6a309dd24b17c86104b6eea01680e0df30 --always
  haxelib git hxnodejs https://github.com/HaxeFoundation/hxnodejs.git 504066dc1ba5ad543afa5f6c3ea019f06136a82b --always
  haxelib git electron https://github.com/deepnight/hxelectron.git fb67aaec7060ec57a7f20d246d17d8f1f45f72f3 --always
  haxelib git heaps-aseprite https://github.com/AustinEast/heaps-aseprite.git 479faba0cce24fa395582bfebb8630b122dcc9e6 --always
  haxelib git deepnightLibs https://github.com/deepnight/deepnightLibs.git b83b9e5d5c0911ec1dc9e5807e2dd0e9199c81bc --always
  haxelib git ldtk-haxe-api https://github.com/deepnight/ldtk-haxe-api.git a014b925f0c628c3f62c0ebdfc66eeb3ff2cd491 --always
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
