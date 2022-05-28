# Maintainer: second2050 <aur at second2050 dot me>
# Contributor: steeltitanium <steeltitanium1 at gmail dot com>

# Variables which can be customized at build time. Use env or export to set

## Discord Rich Presence integration
## Required for game invites.
if [ -z ${_use_discordrpc+x} ]; then
  # Automatically enable discord rpc integration if `discord-rpc-git` is installed
  if ( pacman -Q discord-rpc-git >/dev/null ); then
    _use_discordrpc=y
  else
    _use_discordrpc=n
  fi
fi

# Don't compress with UPX, don't dump symbols to speed up compiling
_buildflags="NOUPX=1 NOOBJDUMP=1 "

pkgname=srb2kart-moe-mansion-git
pkgver=r7384.4849fb5c
_dataver=1.3
pkgrel=1
pkgdesc="A rolling release/nightly version of srb2kart 1.3 based on birdhouse with a couple other changes."
arch=('i686' 'x86_64')
license=('GPL2')
url='https://mb.srb2.org/threads/srb2kart-1-3-moe-mansion.29473/'
depends=('sdl2' 'sdl2_mixer' 'libpng' 'libgme' "srb2kart-data>=$_dataver")
makedepends=('mesa' 'glu' 'git')
makedepends_i686=('nasm')
conflicts=('srb2kart-moe-mansion')

if [ "${_use_discordrpc}" = "y" ]; then
  depends+=('discord-rpc-git')
fi

options=(!buildflags)
source=("git+https://gitlab.com/himie/kart-public.git"
        "srb2kart-moe-mansion.desktop"
        "srb2kart-moe-mansion-opengl.desktop")
sha256sums=('SKIP'
            '751f8fb2695f75efcd13c94769a01a3cfba3d3e97b029180d0c4e26214bf1280'
            '1772173d005de0502ded847316456104561e5a8e22934b0f5a5b9c91ae44ca79')

pkgver() {
  cd "$srcdir"/kart-public
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/kart-public/src

  [ "$CARCH" == "x86_64" ] && _buildflags+="LINUX64=1 " || _buildflags+="LINUX=1 "
  
  if [ "${_use_discordrpc}" = "y" ]; then
    _buildflags+="HAVE_DISCORDRPC=1"
  fi
  
  echo "Build options: $_buildflags"
  make $_buildflags
}

package() {
  [ "$CARCH" == "x86_64" ] && IS64BIT="64" || IS64BIT=""
  install -Dm755 "$srcdir"/kart-public/bin/Linux$IS64BIT/Release/lsdl2srb2kart \
    "$pkgdir"/usr/bin/srb2kart-moe-mansion

  # icon + .desktop
  install -Dm644 "$srcdir"/kart-public/src/sdl/SDL_icon.xpm "$pkgdir"/usr/share/pixmaps/srb2kart-moe-mansion.xpm
  install -Dm644 srb2kart-moe-mansion.desktop "$pkgdir"/usr/share/applications/srb2kart-moe-mansion.desktop
  install -m644 srb2kart-moe-mansion-opengl.desktop "$pkgdir"/usr/share/applications/
}
