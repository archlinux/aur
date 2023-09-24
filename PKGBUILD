# Maintainer: Alex Poilrouge < alexandre dot hurstel at mailoo dot org >

# Variables which can be customized at build time. Use env or export to set

## Discord Rich Presence integration
## Required for game invites.
if [ -z ${_use_discordrpc+x} ]; then
  # Automatically enable discord rpc integration if `discord-rpc-git` is installed
  if (pacman -Q discord-rpc-git >/dev/null); then
    _use_discordrpc=y
  else
    _use_discordrpc=n
  fi
fi
# Don't compress with UPX, don't dump symbols to speed up compiling
_buildflags="NOUPX=1 NOOBJDUMP=1 "

_name=srb2kart-galaxy_azerty
pkgname=${_name}-git
pkgver=r7610.4056c402
_dataver=1.6
pkgrel=1
pkgdesc="Source code modification of Sonic Robo Blast 2 with kart racing elements for AZERTY french keyboard layout"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL3')
url='https://mb.srb2.org/threads/srb2kart-1-6-azerty-french-keyboard-layout.28474/'
depends=('sdl2' 'sdl2_mixer' 'libpng' 'libgme' "srb2kart-data>=$_dataver" 'curl')
makedepends=('mesa' 'glu' 'git')
makedepends_i686=('nasm')

if [ "${_use_discordrpc}" = "y" ]; then
  depends+=('discord-rpc-git')
fi

options=(!buildflags)
provides=("${_name}")
conflicts=("${_name}")
source=("git+https://github.com/AlexPoilrouge/Kart-Public_azerty.git"
  "srb2kart.desktop"
  "srb2kart-opengl.desktop"
  "srb2kart_ogl.xpm")
sha256sums=('SKIP'
            '17f9d878d365c98f1d31bb895426f0b49378c49c87921f5ecfa01bd803a36591'
            '292af9ebd2973597fcdfa901a6c90f138d22fae79797a1a067a50d7a193eda40'
            '9f1f0a4ffbd0d85748c241290232e0c87189ab1ab201df04c0c0bfce881a28b7')


build() {
  cd "$srcdir"/Kart-Public_azerty/src
  git checkout Galaxy-Redux_azerty

  [ "$CARCH" == "x86_64" -o "$CARCH" == "aarch64" ] && _buildflags+="LINUX64=1 " || _buildflags+="LINUX=1 "

  if [ "${_use_discordrpc}" = "y" ]; then
    _buildflags+="HAVE_DISCORDRPC=1"
  fi

  echo "Build options: $_buildflags"
  make $_buildflags
}

package() {
  [ "$CARCH" == "x86_64" -o "$CARCH" == "aarch64" ] && IS64BIT="64" || IS64BIT=""
  install -Dm755 "$srcdir"/Kart-Public_azerty/bin/Linux$IS64BIT/Release/lsdl2srb2kart \
    "$pkgdir"/usr/bin/srb2kart

  # icon + .desktop
  install -Dm644 "$srcdir"/Kart-Public_azerty/src/sdl/SDL_icon.xpm \
    "$pkgdir"/usr/share/pixmaps/srb2kart.xpm
  install -Dm644 srb2kart_ogl.xpm  "$pkgdir"/usr/share/pixmaps/srb2kart_ogl.xpm
  install -Dm644 srb2kart.desktop "$pkgdir"/usr/share/applications/srb2kart.desktop
  install -m644 srb2kart-opengl.desktop "$pkgdir"/usr/share/applications
}
