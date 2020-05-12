# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: steeltitanium <steeltitanium1 at gmail dot com>

pkgname=srb2kart
pkgver=1.2
_dataver=1.2
_patchver=1.2
pkgrel=1
pkgdesc='A kart racing mod based on the 3D Sonic the Hedgehog fangame Sonic Robo Blast 2, based on a modified version of Doom Legacy.'
arch=('i686' 'x86_64')
license=('GPL2')
url='https://mb.srb2.org/showthread.php?t=43708'
depends=('sdl2' 'sdl2_mixer' 'libpng' 'libgme' "srb2kart-data>=$_dataver")
makedepends=('mesa' 'glu' 'git')
makedepends_i686=('nasm')
options=(!buildflags) 
source=("git+https://github.com/STJr/Kart-Public.git#tag=v$pkgver"
"https://github.com/STJr/Kart-Public/releases/download/v$pkgver/srb2kart-v${_patchver//./}-patch.zip"
        "srb2kart.desktop"
        "srb2kart-opengl.desktop")
sha256sums=('SKIP'
            '0ed388a17e822c608e5528572a4c8723dbf3677c239019d239ead2df4bc0fb9e'
            'fe154805cea950fc792faa266ef7d303cbccab893f802c2a85a2afdd0af51bc6'
            '8082c8bad5bdf102d111d4e4d2eb8c73e9f30c1e54935091cd83f4928b3fc3dd')

prepare() {
  # Remove mdls directory or it will fail to be removed later on
  find "$srcdir"/mdls -type d -exec chmod 755 {} \;
  rm -r "$srcdir"/mdls
}

build() {
  cd "$srcdir"/Kart-Public/src

  [ "$CARCH" == "x86_64" ] && IS64BIT="64" || IS64BIT=""
  # Don't compress with UPX
  make NOUPX=1 LINUX$IS64BIT=1
}

package() {
  [ "$CARCH" == "x86_64" ] && IS64BIT="64" || IS64BIT=""
  install -Dm755 "$srcdir"/Kart-Public/bin/Linux$IS64BIT/Release/lsdl2srb2kart \
    "$pkgdir"/usr/bin/srb2kart

  # icon + .desktop
  install -Dm644 "$srcdir"/Kart-Public/src/sdl/SDL_icon.xpm \
    "$pkgdir"/usr/share/pixmaps/srb2kart.xpm
  install -Dm644 srb2kart.desktop "$pkgdir"/usr/share/applications/srb2kart.desktop
  install -m644 srb2kart-opengl.desktop "$pkgdir"/usr/share/applications
}
