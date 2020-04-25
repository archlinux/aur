# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Federico CInelli <cinelli@aur.archlinux.org>
# Contributor: Tom Wambold <tom5760@gmail.com>

pkgname='frogatto'
arch=('x86_64')
pkgver=1.3.1
pkgrel=30
pkgdesc="An old-school 2d platformer game, starring a certain quixotic frog"
url="http://www.frogatto.com"
license=('GPL')
depends=('git' 'glew' 'sdl' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'libpng' 'boost-libs' 'frogatto-data' 'ttf-ubuntu-font-family')
makedepends=('mesa' 'boost')
source=("$pkgname-$pkgver.tgz::https://github.com/frogatto/frogatto/archive/$pkgver.tar.gz"
        launcher
        frogatto.desktop
        fbsd-fixes.patch
        frogatto-boost-1.70.patch)
md5sums=('f3206fbe1395ea2878092fbd4ed2c591'
         '9ed2c9ea59e95fe3c0b3ad49e58f8890'
         'e31563b04748a39292a59aaad633ff58'
         'f3a4cb8492ce71a9d8895ce9d15b0714'
         'c7c5a084ac3915a446fc26389a714289')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../fbsd-fixes.patch
  patch -p0 -i ../frogatto-boost-1.70.patch # Fix build with boost 1.70 (freebsd)
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's/-Werror //' Makefile
  sed -i 's/ccache //g' Makefile
  sed -i 's/-lprofiler//g' Makefile
  sed -i 's/\.io_service/\.get_io_service/g' src/server.cpp
  sed -i 's/\%lu\\n/\%zu\\n/g' src/server.cpp
  make game server
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm 755 "game" "$pkgdir/opt/frogatto/game"
  install -Dm 755 "server" "$pkgdir/opt/frogatto/server"
  install -Dm 644 "src/LICENSE" "$pkgdir/usr/share/licenses/frogatto/LICENSE"
  install -Dm 755 "$srcdir/launcher" "$pkgdir/usr/bin/frogatto"
  install -Dm 644 "$srcdir/frogatto.desktop" "$pkgdir/usr/share/applications/frogatto.desktop"

  # Make level editor work (FS#37139)
  ln -s /usr/share/fonts/TTF/UbuntuMono-R.ttf ${pkgdir}/opt/frogatto/
}

# vim:set ts=2 sw=2 et:
