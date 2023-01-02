# Maintainer: Kacper Zybała <zyperpl at gmail dot com>

pkgname=ldtk
pkgver=1.2.0
pkgrel=1
pkgdesc="Modern and efficient 2D level editor with a strong focus on user-friendliness"
arch=('x86_64')
url="https://github.com/deepnight/ldtk"
license=('MIT')
makedepends=('haxe' 'git' 'nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/deepnight/$pkgname/archive/v$pkgver.tar.gz"
        "${pkgname}.desktop"
        "ldtk.app.min.css::https://raw.githubusercontent.com/deepnight/ldtk/ce782669ed09a2a9274b1a31461a517d237ad37c/app/assets/css/app.min.css")
sha256sums=('ad116b86555a5dd06e8a35aaf3ef2a28a9ad97dbf1a8253a6bf6291946e76815'
            '5f15970200f2b14fd79eaaac03347e0b2d4845403347cb6ecfa57ee17e6642c0'
            'SKIP')
options=('!strip' 'emptydirs' '!makeflags')

build() {
  haxelib deleterepo --quiet --always
  haxelib newrepo

  # hack, because app.min.css is missing
  install -m644 ldtk.app.min.css "${pkgname}-${pkgver}/app/assets/css/app.min.css"

  pushd "${pkgname}-${pkgver}"
  haxelib install ase --always
  haxelib install uuid --always
  haxelib install format --always
  haxelib git castle https://github.com/deepnight/castle 4a807524e75a482ccbe093899cfe96c7e9732bb2 --always
  haxelib git heaps https://github.com/deepnight/heaps.git 3d21405c5e37e7212b4d52234917f8759e3d42e7 --always
  haxelib git hxnodejs https://github.com/HaxeFoundation/hxnodejs.git e37e79fce8a2a2177a0a73ce9d8eff2acdbcfa8b --always
  haxelib git electron https://github.com/tong/hxelectron.git f409a6117214f52ddf1cc39977a711e2c0622247 --always
  haxelib git heaps-aseprite https://github.com/AustinEast/heaps-aseprite.git 81aee42a6c1548433003e3c589d58e9fdf01415e --always
  haxelib git deepnightLibs https://github.com/deepnight/deepnightLibs.git ec934134814ca1626960adbde39247a7704027cb --always
  haxelib git ldtk-haxe-api https://github.com/deepnight/ldtk-haxe-api.git 9e15250b9ae6549f4b4154e9827c0b88920ad173 --always
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
