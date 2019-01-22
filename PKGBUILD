# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: steeltitanium <steeltitanium1 at gmail dot com>

pkgname=srb2kart
pkgver=1.0.2
_dataver=1.0.2
_patchver=1.0.2
pkgrel=2
pkgdesc='A kart racing mod based on the 3D Sonic the Hedgehog fangame Sonic Robo Blast 2, based on a modified version of Doom Legacy.'
arch=('i686' 'x86_64')
license=('GPL')
url='https://mb.srb2.org/showthread.php?t=43708'
depends=('lib32-sdl2' 'lib32-sdl2_mixer' 'lib32-libpng' 'lib32-libgme' 
"srb2kart-data=$_dataver")
makedepends=('mesa' 'glu' 'nasm')
makedepends_i686=('nasm')
source=("git+https://github.com/STJr/Kart-Public.git#tag=v$pkgver"
        
"https://github.com/STJr/Kart-Public/releases/download/v$pkgver/srb2kart-v${_patchver//./}-patch.zip"
        "srb2kart.desktop"
        "srb2kart-opengl.desktop")
sha256sums=('SKIP'
            
'eaeb4455aeb83f0e792dd9e4da5f7bc35e509058aeb3ab2c75d89a1118153105'
            
'fe154805cea950fc792faa266ef7d303cbccab893f802c2a85a2afdd0af51bc6'
            
'8082c8bad5bdf102d111d4e4d2eb8c73e9f30c1e54935091cd83f4928b3fc3dd')

prepare() {
  cd Kart-Public/src
  # disable Animated PNG saving support, allows build with libpng16
  sed 's|#define USE_APNG|/* & */|' -i m_misc.c
}

build() {
  cd Kart-Public/src

  # clear out CPPFLAGS ( -D_FORTIFY_SOURCE doesn't like kart )
  CPPFLAGS=""

  # do not use upx binary (optional: show warnings, be verbose)
  CC="cc -m32" make LINUX=1 NOUPX=1 #WARNINGMODE=1 #ECHO=1
}

package() {
  install -Dm755 Kart-Public/bin/Linux/Release/lsdl2srb2kart "$pkgdir"/usr/bin/srb2kart

  # data patch
  install -Dm644 patch.kart "$pkgdir"/usr/share/games/SRB2Kart/patch.kart

  # icon + .desktop
  install -Dm644 Kart-Public/src/sdl/SDL_icon.xpm "$pkgdir"/usr/share/pixmaps/srb2kart.xpm
  install -Dm644 srb2kart.desktop "$pkgdir"/usr/share/applications/srb2kart.desktop
  install -m644 srb2kart-opengl.desktop "$pkgdir"/usr/share/applications/srb2kart-opengl.desktop 
}
