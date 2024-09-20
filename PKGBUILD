# Maintainer: Maddie Mewmews <maddie at mewmews dot gay>
# Contributor: second2050 <aur at second2050 dot me>
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

_name=srb2kart-saturn
pkgname=${_name}-git
pkgver=r9224.cda74750
_dataver=1.6
pkgrel=1
pkgdesc="A SRB2Kart-Galaxy like Build for people that are missing some of its features."
arch=('i686' 'x86_64' 'aarch64')
license=('GPL2')
url='https://github.com/Indev450/SRB2Kart-Saturn'
depends=('sdl2' 'sdl2_mixer' 'libpng' 'libgme' "srb2kart-data>=$_dataver" 'curl' 'libbacktrace')
makedepends=('mesa' 'glu' 'git')
makedepends_i686=('nasm')

if [ "${_use_discordrpc}" = "y" ]; then
  depends+=('discord-rpc-git')
fi

options=(!buildflags)
provides=("${_name}")
conflicts=("${_name}")
source=("git+https://github.com/Indev450/SRB2Kart-Saturn.git"
        "srb2kart-saturn.desktop"
        "https://github.com/Indev450/SRB2Kart-Saturn/releases/download/v7/Just-Extra-Files.zip")
b2sums=('SKIP'
        '3faa48479e69064df03c260e8deecb0bd68eade36f20ea16d32688ea62dadf2c465a9c2fdd365e8a237855ebe8a32a349d908dc79b36822994e2128077b7ddd8'
        'c1cdfe28621bd4c08d71f170ba76c4036538d595eb3f41a10392507f40b35ca032bf0b3d70541caf6609f46bff1bb698c1c39f3031919e843399df5f0ede8e38')

pkgver() {
  cd "$srcdir"/SRB2Kart-Saturn
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/SRB2Kart-Saturn/src

  [ "$CARCH" == "x86_64" -o "$CARCH" == "aarch64" ] && _buildflags+="LINUX64=1 " || _buildflags+="LINUX=1 "

  if [ "${_use_discordrpc}" = "y" ]; then
    _buildflags+="HAVE_DISCORDRPC=1"
  fi

  echo "Build options: $_buildflags"
  make $_buildflags
}

package() {
  [ "$CARCH" == "x86_64" -o "$CARCH" == "aarch64" ] && IS64BIT="64" || IS64BIT=""
  install -Dm755 "$srcdir"/SRB2Kart-Saturn/bin/Linux$IS64BIT/Release/lsdl2srb2kart \
    "$pkgdir"/usr/bin/srb2kart-saturn

  # icon + .desktop
  install -Dm644 "$srcdir"/SRB2Kart-Saturn/src/sdl/SDL_icon.xpm \
    "$pkgdir"/usr/share/pixmaps/srb2kart-saturn.xpm
  install -Dm644 srb2kart-saturn.desktop "$pkgdir"/usr/share/applications/srb2kart-saturn.desktop
  install -Dm644 "$srcdir"/extra.kart "$pkgdir"/usr/share/games/SRB2Kart/extra.kart
  install -Dm644 "$srcdir"/extra2.kart "$pkgdir"/usr/share/games/SRB2Kart/extra2.kart
}

