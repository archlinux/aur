# Maintainer: Kacper Zybała <zyperpl at gmail dot com>

pkgname=ldtk
pkgver=1.1.2
pkgrel=1
pkgdesc="Modern and efficient 2D level editor with a strong focus on user-friendliness"
arch=('x86_64')
url="https://github.com/deepnight/ldtk"
license=('MIT')
makedepends=('haxe' 'git' 'nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/deepnight/$pkgname/archive/v$pkgver.tar.gz"
        "${pkgname}.desktop")
sha256sums=('990c25ceed9993acb8d53d970c7b2960eb594fa2b6b77587871b19cd797df060'
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
  haxelib git heaps https://github.com/deepnight/heaps.git 7437586da49e7648333b4e8cc3852ddc01e65532 --always
  haxelib git hxnodejs https://github.com/HaxeFoundation/hxnodejs.git e37e79fce8a2a2177a0a73ce9d8eff2acdbcfa8b --always
  haxelib git electron https://github.com/tong/hxelectron.git 020cff6b8024f9f8a437cce1a756d5fb0ea42c3a --always
  haxelib git heaps-aseprite https://github.com/AustinEast/heaps-aseprite.git 81aee42a6c1548433003e3c589d58e9fdf01415e --always
  haxelib git deepnightLibs https://github.com/deepnight/deepnightLibs.git 3472a4d4d7eb093727ec52b1a5ef2928254767f7 --always
  haxelib git ldtk-haxe-api https://github.com/deepnight/ldtk-haxe-api.git ae8524e869e8443fae32ff4fbfe911ddd61daba1 --always
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
