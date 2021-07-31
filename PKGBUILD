# Maintainer: Kacper Zybała <zyperpl at gmail dot com>

pkgname=ldtk
pkgver=0.9.3
pkgrel=2
pkgdesc="Modern and efficient 2D level editor with a strong focus on user-friendliness"
arch=('x86_64')
url="https://github.com/deepnight/ldtk"
license=('MIT')
makedepends=('haxe' 'git' 'nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/deepnight/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8dcd179fcc932495d948e37bae99060aa89cf63bd9fae10faa06dff942102df4')
options=('!strip' 'emptydirs' '!makeflags')

build() {
  haxelib newrepo
  haxe -version
  
  pushd "${pkgname}-${pkgver}"
  haxelib git castle https://github.com/deepnight/castle dcf41f6c9fc88f0bfbd87a4ad01568d07a1597b5 --always
  haxelib git heaps https://github.com/deepnight/heaps.git 7c578975b47bc71dd5212edba40298a6cf0aeab8 --always
  haxelib git hxnodejs https://github.com/HaxeFoundation/hxnodejs.git d2d871c5b4d4589fa4ccb6e2031f982e172f8860 --always
  haxelib git electron https://github.com/tong/hxelectron.git e801c88a2a69f2554178d40dc4b75edaea050993 --always
  haxelib git heaps-aseprite https://github.com/AustinEast/heaps-aseprite.git 445ee834fd84386e8de413ca4ed15334a07fadcf --always
  haxelib git ldtk-haxe-api https://github.com/deepnight/ldtk-haxe-api.git 1ea2a42f71371d4c983bc922aa2b81b4209e8ced --always
  haxelib git deepnightLibs https://github.com/deepnight/deepnightLibs.git e554a034ce656ccbdfc6f57511dcabc8b22fff50 --always
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
  pushd app/redist/linux-unpacked
  install -Dm644 LICENSE.electron.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSES.chromium.html "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  find * -type f -exec install -Dm755 {} "${pkgdir}/usr/share/${pkgname}/{}" \;
  install -dm755 "${pkgdir}/usr/bin/"
  ln -sf "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin"
  popd
  popd
}
