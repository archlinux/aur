# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: b4283 <b4283 at gmail>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=insanerzshooter-svn
pkgver=30
pkgrel=1
pkgdesc="Old school 2D shoot 'em up game"
url='http://insanerzshooter.googlepages.com/'
license=('GPL3')
arch=('x86_64' 'i686')
depends=('sdl_image' 'sdl_ttf' 'sdl_mixer' 'sdl_gfx' 'ttf-bitstream-vera' 'gcc-libs')
makedepends=('setconf' 'subversion' 'gendesk')
provides=('insanerzshooter-svn')
conflicts=('insanerzshooter')
install='insanerzshooter.install'
source=('svn+http://insanerzshooter.googlecode.com/svn/trunk/')
md5sums=('SKIP')

prepare() {
  cd 'trunk'

  gendesk -n --pkgname "${pkgname/-svn}" --pkgdesc "$pkgdesc"

  sed -i "s:data:/usr/share/${pkgname/-svn}:" main.cpp
  sed -i "s:TTF_RenderText_Solid:TTF_RenderText_Blended:g" main.cpp
  #tail -c+2 MakefilePC > Makefile
}

build() {
  cd 'trunk'

  g++ *.cpp -lSDLmain `pkg-config sdl --libs` -lSDL_image -lSDL_ttf \
    -lSDL_mixer -lSDL_gfx -Wno-write-strings ${CXXFLAGS} -o "${pkgname/-svn}"
  #make
}

package() {
  cd 'trunk'

  # executables
  install -d "$pkgdir/usr/bin"
  install -Dm755 "${pkgname/-svn}" "$pkgdir/usr/bin/$_svnmod"

  # resources
  install -d "$pkgdir/usr/share/${pkgname/-svn}"
  install -Dm644 data/{*.wav,*.png} "$pkgdir/usr/share/${pkgname/-svn}/"
  ln -s /usr/share/fonts/TTF/VeraBd.ttf \
    "$pkgdir/usr/share/${pkgname/-svn}/FreeSans_bold.ttf"

  # desktop shortcut and icon
  install -Dm644 "${pkgname/-svn}.desktop" \
    "$pkgdir/usr/share/applications/${pkgname/-svn}.desktop"
  install -Dm644 "icon0.png" "$pkgdir/usr/share/pixmaps/${pkgname/-svn}.png"
}

# vim:set ts=2 sw=2 et:
