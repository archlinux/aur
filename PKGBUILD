pkgname=etlegacy-mod-win32-git
pkgver=2.74
pkgrel=1
arch=('any')
url="http://www.etlegacy.com/"
license=('GPL3')
pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (etlegacy mod win32)"
depends=('etlegacy-mod-git')
makedepends=('git' 'cmake' 'mingw-w64-gcc' 'mingw-w64-freetype' 'mingw-w64-lua')
options=('!strip' 'staticlibs' '!buildflags')
source=('git://github.com/etlegacy/etlegacy.git')
md5sums=('SKIP')
install=etlegacy-mod-win32.install
_gitname=etlegacy

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --always | sed -r 's/^v//;s/-/./g;'
}

build() {
    cd "$srcdir/$_gitname"

    cmake . \
        -DCMAKE_TOOLCHAIN_FILE=./cmake/Toolchain-cross-mingw-linux.cmake \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_DEFAULT_BASEDIR=/usr/lib/etlegacy \
        -DINSTALL_DEFAULT_BINDIR=bin \
        -DINSTALL_DEFAULT_MODDIR=lib/etlegacy \
        -DBUILD_SERVER=0 \
        -DBUILD_CLIENT=0 \
        -DBUILD_MOD=1 \
        -DBUILD_MOD_PK3=0 \
        -DBUILD_PAK3_PK3=0 \
        -DBUNDLED_LIBS=0 \
        -DINSTALL_OMNIBOT=0

    make
}

package() {
    cd "$srcdir/$_gitname"

    # mod
    mkdir -p $pkgdir/usr/lib/$_gitname/legacy
    install legacy/* -t $pkgdir/usr/lib/$_gitname/legacy
    rm $pkgdir/usr/lib/$_gitname/legacy/qagame_*.dll
}
