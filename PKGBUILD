# Maintainer: Aryan Ghasemi -- <aryangh1379@gmail.com>

pkgname=smw-git
_pkgname=supermariowar
pkgver=r1476.a781c755
pkgrel=2
pkgdesc='Super Mario War multiplayer game.'
url='https://github.com/mmatyas/supermariowar'
arch=('i686' 'x86_64')
license=('GPL')
depends=('enet' 'yaml-cpp' 'sdl2_image' 'sdl2_mixer' 'sdl2' 'zlib')
makedepends=('git' 'cmake')
provides=('smw' 'smw-server' 'smw-leveledit' 'smw-worldedit')
conflicts=('smw-bin')
source=('git+https://github.com/mmatyas/supermariowar.git'
'git+https://github.com/mmatyas/supermariowar-data.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
# Git, no tags available
    cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
     # init submodules and disable the ones we don't need, we want our system libraries instead
    cd "$_pkgname"
    echo git submodule init
    git submodule init data
    git config submodule.data.url "$srcdir/${_pkgname}-data"
	echo git submodule update
    git config --global protocol.file.allow always
	git submodule update
}

build() {
    cmake -B build -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX:path="/usr/" \
    -DSMW_BINDIR:path="bin" \
    -DSMW_DATADIR:path="/var/lib/smw" \
    -DSMW_DOCDIR:path="share/doc/smw/" \
    -DBUILD_STATIC_LIBS=OFF \
    -Wno-dev
    cmake --build build
	#make
}

package() {
    DESTDIR="$pkgdir" cmake --install build
	sed -i 's/\(--datadir[[:space:]]\)[^[:space:]]*/\1\/var\/lib\/smw/' "$pkgdir/usr/share/applications/supermariowar.desktop"
	sed -i 's/\(--datadir[[:space:]]\)[^[:space:]]*/\1\/var\/lib\/smw/' "$pkgdir/usr/share/applications/supermariowar-leveleditor.desktop"
	sed -i 's/\(--datadir[[:space:]]\)[^[:space:]]*/\1\/var\/lib\/smw/' "$pkgdir/usr/share/applications/supermariowar-worldeditor.desktop"

}
