# Maintainer: HitCoder <hitcoder9768@gmail.com>

# Don't compress with UPX, don't dump symbols to speed up compiling
_buildflags="NOUPX=1 NOOBJDUMP=1 "

pkgname=srb2-uncapped-git
pkgver=r12702.649b89bbd
_dataver=2.2.10
pkgrel=1
pkgdesc="Custom SRB2 build that uses interpolation to achieve over 35fps."
arch=('x86_64')
url="https://mb.srb2.org/addons/srb2-uncapped.3040/"
license=('GPL2')
depends=('sdl2' 'sdl2_mixer' 'libpng' 'libgme' 'srb2' "srb2-data>=$_dataver")
makedepends=('mesa' 'glu' 'git')
makedepends_i686=('nasm')
source=("git+https://git.do.srb2.org/katsy/SRB2.git#branch=uncapped"
        "srb2-uncapped.desktop")
sha256sums=('SKIP'
            'f78909e066b0341d1289c0f9c6a6c46c2da325a7bc390e4b2a37d4799cdb2bd1')


pkgver() {
    cd "$srcdir"/SRB2
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir"/SRB2/src

    [ "$CARCH" == "x86_64" ] && _buildflags+="LINUX64=1 " || _buildflags+="LINUX=1 "
	
    echo "Build options: $_buildflags"
    make $_buildflags
}

package() {

    [ "$CARCH" == "x86_64" ] && IS64BIT="64" || IS64BIT=""
    install -Dm755 "$srcdir"/SRB2/bin/lsdl2srb2 \
        "$pkgdir"/usr/bin/srb2-uncapped

    # .desktop
    install -Dm644 "$srcdir"/srb2-uncapped.desktop "$pkgdir"/usr/share/applications/srb2-uncapped.desktop
}
