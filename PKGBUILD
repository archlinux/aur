# Maintainer: second2050 <aur at second2050 dot me>
# Contributor: steeltitanium <steeltitanium1 at gmail dot com>

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

_name=srb2kart-galaxy
pkgname=${_name}-git
pkgver=r7569.af46e4f6
_dataver=1.6
pkgrel=1
pkgdesc="A SRB2Kart-Moe-Mansion like Build for people that are missing some of its features."
arch=('i686' 'x86_64' 'aarch64')
license=('GPL2')
url='https://mb.srb2.org/addons/srb2kart-galaxy.4500/'
depends=('sdl2' 'sdl2_mixer' 'libpng' 'libgme' "srb2kart-data>=$_dataver" 'curl')
makedepends=('mesa' 'glu' 'git')
makedepends_i686=('nasm')

if [ "${_use_discordrpc}" = "y" ]; then
  depends+=('discord-rpc-git')
fi

options=(!buildflags)
provides=("${_name}")
conflicts=("${_name}")
source=("git+https://git.do.srb2.org/Galactice/Kart-Public.git"
        "srb2kart.desktop"
        "srb2kart-opengl.desktop")
sha256sums=('SKIP'
            '39dbfbd455da1ba18f3032dada55d2002ed1e30710b486ddd56adfbe45648c62'
            '794f5de70c3a43c7ac201251a669f00eb22fd7ad9dc4fbbf474bf8243cbe64e1')

pkgver() {
  cd "$srcdir"/Kart-Public
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/Kart-Public/src

  [ "$CARCH" == "x86_64" -o "$CARCH" == "aarch64" ] && _buildflags+="LINUX64=1 " || _buildflags+="LINUX=1 "

  if [ "${_use_discordrpc}" = "y" ]; then
    _buildflags+="HAVE_DISCORDRPC=1"
  fi

  echo "Build options: $_buildflags"
  make $_buildflags
}

package() {
  [ "$CARCH" == "x86_64" -o "$CARCH" == "aarch64" ] && IS64BIT="64" || IS64BIT=""
  install -Dm755 "$srcdir"/Kart-Public/bin/Linux$IS64BIT/Release/lsdl2srb2kart \
    "$pkgdir"/usr/bin/srb2kart-galaxy

  # icon + .desktop
  install -Dm644 "$srcdir"/Kart-Public/src/sdl/SDL_icon.xpm \
    "$pkgdir"/usr/share/pixmaps/srb2kart-galaxy.xpm
  install -Dm644 srb2kart.desktop "$pkgdir"/usr/share/applications/srb2kart-galaxy.desktop
  install -m644 srb2kart-opengl.desktop "$pkgdir"/usr/share/applications/srb2kart-galaxy-opengl.desktop
}

