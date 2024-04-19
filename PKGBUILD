# Maintainer: Aryan Ghasemi -- <aryangh1379@gmail.com>

pkgname=supermariowar-git
_pkgname=supermariowar
pkgver=r1476.a781c755
pkgrel=3
pkgdesc='Super Mario War multiplayer game.'
url='https://github.com/mmatyas/supermariowar'
arch=('i686' 'x86_64')
license=('GPL')
depends=('enet' 'yaml-cpp' 'sdl2_image' 'sdl2_mixer' 'sdl2' 'zlib')
makedepends=('git' 'cmake')
provides=('smw' 'smw-server' 'smw-leveledit' 'smw-worldedit')
conflicts=("${_pkgname}-bin")
source=("git+${url}.git"
"git+${url}-data.git")
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
    git submodule init data
    git config submodule.data.url "$srcdir/${_pkgname}-data"
    git -c protocol.file.allow=always submodule update
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
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
