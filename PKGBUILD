# Maintainer: HitCoder <hitcoder9768@gmail.com>

## Discord Rich Presence integration
## Required for game invites.
if [ -z ${_use_discordrpc+x} ]; then
    _use_discordrpc=n
fi

# Don't compress with UPX, don't dump symbols to speed up compiling
_buildflags="NOUPX=1 NOOBJDUMP=1 "

pkgname=srb2-uncapped-plus-git
pkgver=r12085.d4d1181ec
_dataver=2.2.9
pkgrel=1
pkgdesc="A Nightly/Rolling Release custom build of SRB2, with the latest community made features. Inspired on SRB2Kart Moe Mansion."
arch=('x86_64')
url="https://mb.srb2.org/addons/srb2-uncapped-plus.3248/"
license=('GPL2')
depends=('sdl2' 'sdl2_mixer' 'libpng' 'libgme' 'srb2' "srb2-data>=$_dataver")
makedepends=('mesa' 'glu' 'git')
makedepends_i686=('nasm')
source=("git+https://git.do.srb2.org/Fafabis/SRB2.git#branch=uncapped-plus"
        "srb2-uncapped-plus.desktop")
sha256sums=('SKIP'
            'e7cfd4775f15cacd191cef491ca4a604509a9cdac463cfd3d2387fa2625e004c')

if [ "${_use_discordrpc}" = "y" ]; then
    depends+=('discord-rpc-api')
fi

pkgver() {
    cd "$srcdir"/SRB2
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir"/SRB2/src

    [ "$CARCH" == "x86_64" ] && _buildflags+="LINUX64=1 " || _buildflags+="LINUX=1 "

    if [ "${_use_discordrpc}" = "y" ]; then
        _buildflags+="HAVE_DISCORDRPC=1"
    fi
	
    echo "Build options: $_buildflags"
    make $_buildflags
}

package() {

    [ "$CARCH" == "x86_64" ] && IS64BIT="64" || IS64BIT=""
    install -Dm755 "$srcdir"/SRB2/bin/lsdl2srb2 \
        "$pkgdir"/usr/bin/srb2-uncapped-plus

    # .desktop
    install -Dm644 "$srcdir"/srb2-uncapped-plus.desktop "$pkgdir"/usr/share/applications/srb2-uncapped-plus.desktop
}
