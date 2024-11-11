# Maintainer: Popolon <popolon@popolon.org>
# Contributor: MaryJaneInChain <maryjaneinchain@gmail.com>

pkgname=tic-80-lovebyte-git
pkgver=0.90.1723.r3.g1c9a631e
pkgrel=1
pkgdesc='TIC-80 tiny computer emulator'
arch=('any')
url="https://tic80.com/"
license=('MIT')
depends=('gtk3' 'glu' 'freeglut>=3.0.0' 'libglvnd' 'lua53-sdl2' 'gtk4')
makedepends=('git' 'cmake')
provides=(tic-80)

_gitname=TIC-80
_launcher_dir=tic80-lovebyte_tools

source=("git+https://github.com/nesbox/TIC-80.git#branch=lovebyte"
        "git+https://framagit.org/popolon/tic80-lovebyte_tools.git"
	"tic80showdown.desktop"
	"tic80showdown.png"
        "string.patch")

sha256sums=('SKIP'
            'SKIP'
            '6a94b7463c93a82ac9c0b365f99f8e1d5257f0b90d7f7a12ab2e100e9d8d6d33'
            '471d7e10dc26d08afa90b14e2dbdd4cb123e9b31c1dd73a7503aff71f97252c6'
            '6d1e48000a8c14f03ba92462b618de43bf4797ac4d17fdf7dbf671d6dd09fe5a')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
   
}

prepare() {
    cd "$srcdir/$_gitname"
    git submodule update --init --recursive
    patch -p1 <../string.patch
}

build() {
    cd "$srcdir/$_gitname/build/"
    cmake ..
    make -j4
    cd "../../$_launcher_dir/"
    gcc $( pkg-config --cflags gtk4 ) -o gshowdown_chooser gshowdown_chooser.c $( pkg-config --libs gtk4 )
}

package() {
    install -Dm644 tic80showdown.png -t "${pkgdir}/usr/share/icons/"
    install -Dm644 tic80showdown.desktop -t "${pkgdir}/usr/share/applications/"
    cd "$_gitname/build"
    install -Dm755 bin/tic80 "${pkgdir}/usr/bin/tic80showdown"
    cd "../../$_launcher_dir/"
    install -Dm755 gshowdown_chooser "${pkgdir}/usr/bin/gshowdown_chooser"
}

