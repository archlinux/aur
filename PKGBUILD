# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgname=inter-doom-git
pkgver=9.1.r2
pkgrel=1
pkgdesc="International Doom. Small, functional and simple Doom, Heretic, Hexen source port, created with help, efforts and bits of code from people around the world (git version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/JNechaevsky/international-doom"
license=('GPL-2.0-only')
depends=('hicolor-icon-theme'
         'glibc'
         'sdl2>=2.0.18'
         'sdl2_mixer>=2.0.2'
         'libsamplerate'
         'fluidsynth')
makedepends=(cmake)
optdepends=('doom1-wad: Doom shareware game data'
            'heretic1-wad: Heretic shareware game data'
            'hexen1-wad: Hexen demo game data')
provides=('inter-heretic-git'
          'inter-hexen-git')
conflicts=('inter-doom'
           'inter-heretic'
           'inter-hexen'
           'inter-heretic-git'
           'inter-hexen-git')
source=("git+https://github.com/JNechaevsky/international-doom.git")
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/international-doom"
    tag=$(git describe --tags --abbrev=0)
    rev=$(git rev-list "${tag}.." --count)
    printf "%s.r%s" "$tag" "$rev"
}

build() {
    cmake -S "international-doom" -B "international-doom/build" \
    -D CMAKE_BUILD_TYPE="Release" \
    -D CMAKE_C_FLAGS_RELEASE="-O2 -mtune=generic -flto -fno-math-errno -fomit-frame-pointer -funroll-loops -DNDEBUG" \
    -D CMAKE_INSTALL_PREFIX="/usr"
    cmake --build "international-doom/build" --config Release
}

package() {
    DESTDIR="${pkgdir}" cmake --install "international-doom/build"

    install -Dm644 "international-doom/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "international-doom/data/doom.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/inter-doom.png"
    install -Dm644 "international-doom/data/doom.desktop" "${pkgdir}/usr/share/applications/inter-doom.desktop"

    install -Dm644 "international-doom/data/heretic.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/inter-heretic.png"
    install -Dm644 "international-doom/data/heretic.desktop" "${pkgdir}/usr/share/applications/inter-heretic.desktop"

    install -Dm644 "international-doom/data/hexen.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/inter-hexen.png"
    install -Dm644 "international-doom/data/hexen.desktop" "${pkgdir}/usr/share/applications/inter-hexen.desktop"
}
