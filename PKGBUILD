pkgname=fallout1-ce-game
_gitname=fallout1-ce
pkgver=1.1.0
pkgrel=3
pkgdesc="Fallout for modern operating systems"
arch=('x86_64')
url="https://github.com/alexbatalov/fallout1-ce"
license=('custom:SUL')
depends=('sdl2')
source=("${_gitname}-${pkgver}.tar.gz::https://github.com/alexbatalov/${_gitname}/archive/refs/tags/v${pkgver}.tar.gz"
        'compile_errors_fix.patch'
        'fallout1-ce.png'
        'fallout1-ce.desktop')
sha256sums=('ad116e4f83dee0bbcad682e0b33d2d2a5b044b57c0dc412f4a82d86b3b4b66dd'
            'b5b8ca0245875280d3257e610db9589bf8564ecb134dd1d7ee1727dd635f8ac4'
            '821b17c6bf8d1dfce01b902257238ae64fa541fe37fcb21b2beff14430278ae2'
            '6b3abc73a937f8165af5ca8606358a4bfbd203f2205d4405bb839baa044df13d')

build() {
    cd "${_gitname}-${pkgver}"

    echo $pkgdir

    patch -p1 < ../compile_errors_fix.patch
    cmake -G "Unix Makefiles"  -DCMAKE_BUILD_TYPE=Release ./
    make
}

package() {
    cd "${_gitname}-${pkgver}"
    DESTDIR="$pkgdir" cmake -P cmake_install.cmake --install build

    install -Dm 644 "$srcdir/fallout1-ce.png" "$pkgdir/usr/share/pixmaps/fallout1-ce.png"
    install -Dm 644 "$srcdir/fallout1-ce.desktop" "$pkgdir/usr/share/applications/fallout1-ce1-ce.desktop"
    install -Dm 755 "fallout-ce" "$pkgdir/var/games/fallout1-ce/fallout-ce"

    echo
    echo '==================================================================================='
    echo 'Next, copy game data files to /var/games/fallout1-ce/'
    echo 'WARNING: make sure CRITTER.DAT and MASTER.DAT files are in the same upper or lower case as they are in the fallout.cfg file. Otherwise you get an error indicating that files are not found'
    echo 'See: https://github.com/alexbatalov/fallout1-ce#configuration'
    echo '==================================================================================='
    echo
}
