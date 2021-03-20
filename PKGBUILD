# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Created to use LibrePlanet 2021 server which is using older version
# Removed "server" from this as you should be using a new version of the server
# Previous Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Previous Contributor: Konsta Kokkinen <kray@tsundere.fi>

_pkgname=minetest
pkgname=('minetest4' 'minetest4-common')
pkgver=0.4.17.1
pkgrel=1
_gamever=0.4.17
arch=('x86_64')
url='http://minetest.net/'
license=('GPL')
conflicts=('minetest' 'minetest-common')
makedepends=('sqlite' 'freetype2' 'leveldb' 'openal' 'libvorbis' 'curl' 'irrlicht'
             'hicolor-icon-theme' 'cmake' 'hiredis' 'luajit')
source=($_pkgname-$pkgver.tar.gz::https://github.com/minetest/minetest/archive/${pkgver}.tar.gz
        $_pkgname-data-$pkgver.tar.gz::https://github.com/minetest/minetest_game/archive/${_gamever}.tar.gz)
sha256sums=('cd25d40c53f492325edabd2f6397250f40a61cb9fe4a1d4dd6eb030e0d1ceb59'
            'f0ab07cb47c1540b2016bf76a36e2eec28b0ea7827bf66fc5447e0c5e5d4495d')

prepare() {
  install -d build-client
}

build() {
  cd "$srcdir"/build-client
  cmake ../$_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_CLIENT=1 \
    -DENABLE_GETTEXT=1 \
    -DENABLE_FREETYPE=1 \
    -DENABLE_LEVELDB=0 \
    -DENABLE_REDIS=0
  make
}

package_minetest4() {
  pkgdesc='Multiplayer infinite-world block sandbox game'
  depends=('minetest4-common' 'irrlicht' 'curl' 'libvorbis' 'sqlite'
           'openal' 'hicolor-icon-theme' 'desktop-file-utils' 'xdg-utils'
           'freetype2' 'luajit')

  cd build-client
  make DESTDIR="$pkgdir" install
  cp -r locale "$pkgdir"/usr/share/

  rm -rf "$pkgdir"/usr/share/{minetest,doc}
}

package_minetest4-common() {
  pkgdesc='Common data files for minetest and minetest-server'

  #cd $pkgbase-$pkgver
  cd $_pkgname-$pkgver
  install -d "$pkgdir"/usr/share/minetest

  cp -r games builtin client fonts textures "$pkgdir"/usr/share/minetest/
  cp -r "$srcdir"/minetest_game-$_gamever "$pkgdir"/usr/share/minetest/games/minetest
  rm "$pkgdir"/usr/share/minetest/games/minetest/.gitignore

  for file in doc/{fst_api,lua_api,menu_lua_api,protocol,world_format}.txt; do
    install -Dm644 $file "$pkgdir"/usr/share/minetest/doc/$(basename $file)
  done
}
