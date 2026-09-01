# Maintainer: Aryan Ghasemi -- <aryangh1379@gmail.com>

pkgname=supermariowar-git
_pkgname=supermariowar
pkgver=r1777.1971b11c
pkgrel=1
pkgdesc='Super Mario War multiplayer game.'
url='https://github.com/mmatyas/supermariowar'
arch=('i686' 'x86_64')
license=('GPL')
depends=('enet' 'sdl3' 'sdl3_image' 'sdl3_mixer')
makedepends=('git' 'cmake' 'pkgconf' 'enet' 'sdl3' 'sdl3_image' 'sdl3_mixer' 'toml11' 'zlib')
provides=('smw' 'smw-server' 'smw-leveledit' 'smw-worldedit')
conflicts=("${_pkgname}-bin")
source=("git+${url}.git"
"git+${url}-data.git"
"fix-enet-zlib-findpackage.patch")
sha256sums=('SKIP'
            'SKIP'
            '5df4a766181f399f3741b3afc1800789f573425405dfe176f9a97c0a200dea44')

pkgver() {
# Git, no tags available
    cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
    # init submodules and disable the ones we don't need, we want our system libraries instead

    cd "$_pkgname"
    git switch --track origin/sdl3                                      # switch to SDL3 branch because we want to compile using SDL3
    git submodule init data                                             
    git config submodule.data.url "$srcdir/${_pkgname}-data"            # set the URL for "data" submodule just in case
    git -c protocol.file.allow=always submodule update                  # fetch "data" submodule

    patch -p1 < "$srcdir/fix-enet-zlib-findpackage.patch"               # the patch for cmake/BundledDeps.cmake 
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
