# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgbase=inter-doom-git
pkgname=('inter-doom-git' 'inter-heretic-git' 'inter-hexen-git')
pkgver=r4620.b8776844
pkgrel=1
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/JNechaevsky/inter-doom"
license=('GPL2')
depends=('sdl2>=2.0.18' 'sdl2_mixer>=2.0.2' 'sdl2_net>=2.0.0' 'libsamplerate')
makedepends=(cmake python3)
source=("git+https://github.com/JNechaevsky/inter-doom.git")
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/inter-doom"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    # Upstream forces `-O2` for 'Release' build type
    cmake -S "inter-doom" -B "build" \
    -D CMAKE_BUILD_TYPE="Release" \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D COMPILE_DOOM="ON" \
    -D COMPILE_HERETIC="ON" \
    -D COMPILE_HEXEN="ON" \
    -D COMPILE_STRIFE="OFF" \
    -D BUILD_VERSION_OVERWRITE="$pkgver" \
    -D NO_GIT_HASH="ON"
    cmake --build "build"
}

package_inter-doom-git() {
    pkgdesc="A limit-removing source port of Doom with enhancements and translation to the Russian language (git version)"
    conflicts=('inter-doom')
    optdepends=('doom1-wad: Doom shareware game data')

    DESTDIR="${pkgdir}" cmake --install build --component doom
    install -d "${pkgdir}/usr/share/licenses/inter-doom"
    mv "${pkgdir}/usr/share/doc/inter-doom/GPL.txt" "${pkgdir}/usr/share/licenses/inter-doom/LICENSE"
    rm -r "${pkgdir}/usr/share/doc"
}

package_inter-heretic-git() {
    pkgdesc="A limit-removing source port of Heretic with enhancements and translation to the Russian language (git version)"
    conflicts=('inter-heretic')
    optdepends=('heretic1-wad: Heretic shareware game data')

    DESTDIR="${pkgdir}" cmake --install build --component heretic
    install -d "${pkgdir}/usr/share/licenses/inter-heretic"
    mv "${pkgdir}/usr/share/doc/inter-doom/GPL.txt" "${pkgdir}/usr/share/licenses/inter-heretic/LICENSE"
    rm -r "${pkgdir}/usr/share/doc"
}

package_inter-hexen-git() {
    pkgdesc="A limit-removing source port of Hexen with enhancements and translation to the Russian language (git version)"
    conflicts=('inter-hexen')
    optdepends=('hexen1-wad: Hexen demo game data')

    DESTDIR="${pkgdir}" cmake --install build --component hexen
    install -d "${pkgdir}/usr/share/licenses/inter-hexen"
    mv "${pkgdir}/usr/share/doc/inter-doom/GPL.txt" "${pkgdir}/usr/share/licenses/inter-hexen/LICENSE"
    rm -r "${pkgdir}/usr/share/doc"
}
