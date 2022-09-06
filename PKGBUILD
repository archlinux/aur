# Maintainer: Kacper Zybała <zyperpl at gmail dot com>

pkgname=ldtk
pkgver=1.1.3
pkgrel=2
pkgdesc="Modern and efficient 2D level editor with a strong focus on user-friendliness"
arch=('x86_64')
url="https://github.com/deepnight/ldtk"
license=('MIT')
makedepends=('haxe' 'git' 'nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/deepnight/$pkgname/archive/v$pkgver.tar.gz"
        "${pkgname}.desktop")
sha256sums=('469c69943da9af2f8b912b3abd5262d3ae1466a3e38eca99c81eb61dd2c1f7aa'
            '5f15970200f2b14fd79eaaac03347e0b2d4845403347cb6ecfa57ee17e6642c0')
options=('!strip' 'emptydirs' '!makeflags')

build() {
  haxelib deleterepo --quiet --always
  haxelib newrepo
  
  pushd "${pkgname}-${pkgver}"
  haxelib install ase --always
  haxelib install uuid --always
  haxelib install format --always
  haxelib git castle https://github.com/deepnight/castle 6f10ab76e8439b29849bd5174f56ff8f9365b435 --always
  haxelib git heaps https://github.com/deepnight/heaps.git dd0f74e7c00997c70c2a234285027c55b04c75a7 --always
  haxelib git hxnodejs https://github.com/HaxeFoundation/hxnodejs.git e37e79fce8a2a2177a0a73ce9d8eff2acdbcfa8b --always
  haxelib git electron https://github.com/tong/hxelectron.git 3074aa35e698016239e17923b3952decea4593cf --always
  haxelib git heaps-aseprite https://github.com/AustinEast/heaps-aseprite.git 81aee42a6c1548433003e3c589d58e9fdf01415e --always
  haxelib git deepnightLibs https://github.com/deepnight/deepnightLibs.git 22d2b54fa1507277e78bd594a3ad62ee5d0b930f --always
  haxelib git ldtk-haxe-api https://github.com/deepnight/ldtk-haxe-api.git 464418b5f92602fdde518e62f4861d87c7717567 --always
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
