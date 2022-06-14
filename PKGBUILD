# Maintainer: HitCoder <hitcoder9768@gmail.com>

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

pkgname=srb2-uncapped-plus-git
pkgver=r12808.c9d40cb59
_dataver=2.2.10
pkgrel=4
pkgdesc="A Nightly/Rolling Release custom build of SRB2, with the latest community made features. Inspired on SRB2Kart Moe Mansion."
arch=('x86_64')
url="https://mb.srb2.org/addons/srb2-uncapped-plus.3248/"
license=('GPL2')
depends=('sdl2' 'sdl2_mixer' 'libpng' 'libgme' "srb2-data>=$_dataver")
makedepends=('mesa' 'glu' 'git')
makedepends_i686=('nasm')
_reponame="SRB2-modified"
source=("git+https://git.do.srb2.org/X.organic/$_reponame.git#branch=uncapped-plus"
        "srb2-uncapped-plus.desktop")
sha256sums=('SKIP'
            '9858fddd0a59473d4ea9b3648e70f009fc6a27ccc035b37d2377a093915dcc5b')

if [ "${_use_discordrpc}" = "y" ]; then
    depends+=('discord-rpc-git')
fi

pkgver() {
    cd "$srcdir"/"$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir"/"$_reponame"/src

    [ "$CARCH" == "x86_64" ] && _buildflags+="LINUX64=1 " || _buildflags+="LINUX=1 "

    if [ "${_use_discordrpc}" = "y" ]; then
        _buildflags+="HAVE_DISCORDRPC=1"
    fi
	
    echo "Build options: $_buildflags"
    make $_buildflags
}

package() {

    [ "$CARCH" == "x86_64" ] && IS64BIT="64" || IS64BIT=""
    install -Dm755 "$srcdir"/"$_reponame"/bin/lsdl2srb2 \
        "$pkgdir"/usr/bin/srb2-uncapped-plus

    # icon + .desktop
    install -Dm644 "$srcdir"/"$_reponame"/src/sdl/SDL_icon.xpm \
      "$pkgdir"/usr/share/pixmaps/srb2-uncapped-plus.xpm
    install -Dm644 "$srcdir"/srb2-uncapped-plus.desktop \
      "$pkgdir"/usr/share/applications/srb2-uncapped-plus.desktop
}
