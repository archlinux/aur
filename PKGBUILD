# Maintainer: Lubosz Sarnecki <lubosz at gmail dot com>
# Contributor : Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: Drew Liszewski <drew dot liszewski at gmail dot com>
# Contributor: Daniel Varga <varga dot daniel at gmx dot de>

pkgname=emulationstation-git
_gitname=EmulationStation
pkgrel=1
epoch=1
pkgver=2.4.1.r503.gc9b3f5b6
pkgdesc="Emulation Station is a flexible emulator front-end supporting keyboardless navigation and custom system themes. Active fork by the RetroPie project."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/RetroPie/EmulationStation"
license=('MIT')
makedepends=('git' 'cmake' 'rapidjson')
depends=('freeimage' 'vlc' 'curl')
source=('git://github.com/RetroPie/EmulationStation.git')
md5sums=('SKIP')
provides=('emulationstation')

pkgver() {
    cd $srcdir/$_gitname
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_gitname"
    git submodule update --init
}

build() {
    cd "$srcdir/$_gitname"
    mkdir -p "$srcdir/$_gitname/build"
    cd "$srcdir/$_gitname/build"
    cmake ..\
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RELEASE
    make
}

package() {
    cd $_gitname
    # No install target..., should be fixed upstream
    # make DESTDIR="$pkgdir" install
    install -Dm755 "$srcdir/$_gitname/emulationstation" "$pkgdir/usr/bin/emulationstation"
    install -Dm644 "$srcdir/$_gitname/LICENSE.md" "$pkgdir/usr/share/licenses/emulationstation-git/LICENSE"
}
