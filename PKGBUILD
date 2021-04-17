# Maintainer: Kacper Zybała <zyperpl at gmail dot com>

pkgname=ldtk
pkgver=0.9.1
pkgrel=1
pkgdesc="Modern and efficient 2D level editor with a strong focus on user-friendliness"
arch=('x86_64')
url="https://github.com/deepnight/ldtk"
license=('MIT')
makedepends=('haxe' 'git' 'nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/deepnight/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('23f0d3098f93de38b7d6f5664db43642ecc4c3c17c3f4c6d89a827dc1dae7b97')
options=('!strip' 'emptydirs' '!makeflags')

build() {
  haxelib newrepo
  haxelib --always git castle https://github.com/ncannasse/castle
  haxelib --always git heaps https://github.com/deepnight/heaps.git
  haxelib --always git hxnodejs https://github.com/HaxeFoundation/hxnodejs.git
  haxelib --always git electron https://github.com/tong/hxelectron.git
  haxelib --always git ldtk-haxe-api https://github.com/deepnight/ldtk-haxe-api.git
  haxelib --always git deepnightLibs https://github.com/deepnight/deepnightLibs.git
  
  pushd "${pkgname}-${pkgver}"
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
