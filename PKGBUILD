# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgbase=inter-doom-git
pkgname=('inter-doom-git' 'inter-heretic-git' 'inter-hexen-git')
pkgver=8.2.r44
pkgrel=1
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/JNechaevsky/international-doom"
license=('GPL-2.0-only')
depends=('sdl2>=2.0.18' 'sdl2_mixer>=2.0.2' 'sdl2_net>=2.0.0' 'libsamplerate' 'fluidsynth')
makedepends=(cmake)
source=("git+https://github.com/JNechaevsky/international-doom.git")
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/international-doom"
    tag=$(git describe --tags --abbrev=0)
    rev=$(git rev-list "${tag}.." --count)
    printf "%s.r%s" "$tag" "$rev"
}

prepare() {
  cd "international-doom"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
    cmake -S "international-doom" -B "build" \
    -D CMAKE_BUILD_TYPE="Release" \
    -D CMAKE_C_FLAGS_RELEASE="-O2 -DNDEBUG" \
    -D CMAKE_INSTALL_PREFIX="/usr"
    cmake --build "build"
}

package_inter-doom-git() {
    pkgdesc="Small, functional and simple Doom source port, created with help, efforts and bits of code from people around the world (git version)"
    conflicts=('inter-doom')
    optdepends=('doom1-wad: Doom shareware game data')

    DESTDIR="${pkgdir}" cmake --install build
    mv "${pkgdir}/usr/bin/inter-setup" "${pkgdir}/usr/bin/inter-doom-setup"
    rm "${pkgdir}/usr/bin/inter-heretic"
    rm "${pkgdir}/usr/bin/inter-hexen"
    install -Dm644 "international-doom/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "international-doom/data/doom.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/inter-doom.png"
    install -Dm644 "international-doom/data/doom.desktop" "${pkgdir}/usr/share/applications/inter-doom.desktop"
}

package_inter-heretic-git() {
    pkgdesc="Small, functional and simple Heretic source port, created with help, efforts and bits of code from people around the world (git version)"
    conflicts=('inter-heretic')
    optdepends=('heretic1-wad: Heretic shareware game data')

    DESTDIR="${pkgdir}" cmake --install build
    mv "${pkgdir}/usr/bin/inter-setup" "${pkgdir}/usr/bin/inter-heretic-setup"
    rm "${pkgdir}/usr/bin/inter-doom"
    rm "${pkgdir}/usr/bin/inter-hexen"
    install -Dm644 "international-doom/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "international-doom/data/heretic.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/inter-heretic.png"
    install -Dm644 "international-doom/data/heretic.desktop" "${pkgdir}/usr/share/applications/inter-heretic.desktop"
}

package_inter-hexen-git() {
    pkgdesc="Small, functional and simple Hexen source port, created with help, efforts and bits of code from people around the world (git version)"
    conflicts=('inter-hexen')
    optdepends=('hexen1-wad: Hexen demo game data')

    DESTDIR="${pkgdir}" cmake --install build
    mv "${pkgdir}/usr/bin/inter-setup" "${pkgdir}/usr/bin/inter-hexen-setup"
    rm "${pkgdir}/usr/bin/inter-doom"
    rm "${pkgdir}/usr/bin/inter-heretic"
    install -Dm644 "international-doom/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "international-doom/data/hexen.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/inter-hexen.png"
    install -Dm644 "international-doom/data/hexen.desktop" "${pkgdir}/usr/share/applications/inter-hexen.desktop"
}
