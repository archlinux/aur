# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Federico CInelli <cinelli@aur.archlinux.org>
# Contributor: Tom Wambold <tom5760@gmail.com>

pkgname=frogatto
arch=('x86_64')
pkgver=1.3.1
pkgrel=40
pkgdesc="An old-school 2d platformer game, starring a certain quixotic frog"
url="http://www.frogatto.com"
license=('GPL')
depends=('glew' 'sdl' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'libpng' 'boost-libs' 'frogatto-data' 'ttf-ubuntu-font-family')
makedepends=('mesa' 'boost')
source=("$pkgname-$pkgver.tgz::https://github.com/frogatto/frogatto/archive/$pkgver.tar.gz"
        launcher
        frogatto.desktop
        fbsd-fixes.patch
        frogatto-boost-1.70.patch
        rm_glBlendEquationOES.patch)
sha512sums=('bb1c5e765a456abedd7b80cce99b7be62734a6163c2e2beb9776c6a61eba779a916ea99a3c113be0626a4d238f10dcdf360d26f993f1d9ac4e381d711b27be23'
            'f10944f8b4c2e2704ceda533d6c6768c653f4c42b8628ccccffc035122f0f5b02e3dfa600dc251440f2f4245c6d1def309556d39ea11b7aa9b6ff58751d89c00'
            '7381f54bc8d406c7669bc1d36cd04c30f80d7eec03808ad69156317b811528830ae40a22e48a8a18e2a00e15cd0ee3f8b9a0248c08b2bce30bc8d8f57b5e6038'
            '10ddc0cdebe1abb4f28b3afd9c1c3b1e887f47262424aa73c2a61d09375aa69287c28e0206041de5bfc2534c498c73710b98432ed538f3b900ec220541f47062'
            '4c7f3a4bdb0fead85cb4d650761f4b8458a9f3fbe77f6e77d902a261efdae5f35808784f9ea85556b2f01d203dade9ca9224bc46c49fe38d27681e67e88a907a'
            'ea713507b60be9f035bb84bed2c79392eac7119696956d24a659f2a0b89cffa738e460b35a744ded3a0b35c52303a1d67ac911d9ddf7a4ee2484708342e66e2e')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../fbsd-fixes.patch
  patch -p0 -i ../frogatto-boost-1.70.patch # Fix build with boost 1.70 (freebsd)
  patch -p1 -i ../rm_glBlendEquationOES.patch # Fix crash when exiting first house
}

build() {
  cd "$pkgname-$pkgver"

  sed -i 's/-Werror //' Makefile
  sed -i 's/ccache //g' Makefile
  sed -i 's/-lprofiler//g' Makefile
  sed -i 's/\.io_service/\.get_io_service/g' src/server.cpp
  sed -i 's/\%lu\\n/\%zu\\n/g' src/server.cpp
  make CFLAGS='-DUSE_GLES2' game server
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 "game" "$pkgdir/opt/frogatto/game"
  install -Dm 755 "server" "$pkgdir/opt/frogatto/server"
  install -Dm 644 "src/LICENSE" "$pkgdir/usr/share/licenses/frogatto/LICENSE"
  install -Dm 755 "$srcdir/launcher" "$pkgdir/usr/bin/frogatto"
  install -Dm 644 "$srcdir/frogatto.desktop" "$pkgdir/usr/share/applications/frogatto.desktop"

  # Make level editor work (FS#37139)
  ln -s /usr/share/fonts/TTF/UbuntuMono-R.ttf "$pkgdir"/opt/frogatto/
}

# vim:set ts=2 sw=2 et:
