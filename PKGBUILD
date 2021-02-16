# Maintainer: Kacper Zybała <zyperpl at gmail dot com>

pkgname=ldtk
pkgver=0.7.2
pkgrel=1
pkgdesc="Modern and efficient 2D level editor"
arch=('x86_64')
url="https://github.com/deepnight/ldtk"
license=('MIT')
depends=('npm' 'electron')
makedepends=('gcc' 'haxe' 'git' 'nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/deepnight/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('be8f25381e40e9cc91604d89555ad897642aeed11ad8af6b1eb9663e61fe32ba')
options=('!strip' 'emptydirs' '!makeflags')

prepare() {
    cat << EOF > "${pkgname}"
#!/usr/bin/env sh
pushd /usr/share/${pkgname}/app
npm run start "\$@"
popd
EOF
}

build() {
  haxelib newrepo
  haxelib --always git heaps https://github.com/HeapsIO/heaps.git
  haxelib --always git hxnodejs https://github.com/HaxeFoundation/hxnodejs.git
  haxelib --always git electron https://github.com/tong/hxelectron.git
  haxelib --always git deepnightLibs https://github.com/deepnight/deepnightLibs.git
  haxelib --always git ldtk-haxe-api https://github.com/deepnight/ldtk-haxe-api.git
  haxelib --always git castle https://github.com/ncannasse/castle.git
	cd "$pkgname-$pkgver"
  pushd app
  npm install --production --cache "${srcdir}/npm-cache"
  popd
  haxe main.hxml || true
  haxe renderer.hxml || true
}

package() {
  install -dm755 "${pkgdir}/usr/bin/"
  install -m755 "$pkgname" "$pkgdir/usr/bin/"
  pushd "${pkgname}-${pkgver}"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  find app/* -type f -exec install -Dm755 {} "${pkgdir}/usr/share/${pkgname}/{}" \;
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  popd
}
