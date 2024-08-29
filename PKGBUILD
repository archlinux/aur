# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgbase=inter-doom-git
pkgname=('inter-doom-git' 'inter-heretic-git' 'inter-hexen-git')
pkgver=7.x.x.r675
pkgrel=1
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/JNechaevsky/international-doom"
license=('GPL-2.0-only')
depends=('sdl2>=2.0.18' 'sdl2_mixer>=2.0.2' 'sdl2_net>=2.0.0' 'libsamplerate' 'fluidsynth>=2.2.0')
makedepends=(cmake)
source=("git+https://github.com/JNechaevsky/international-doom.git"
        001_install_rule.patch)
b2sums=('SKIP'
        '653663f4e6ea5c26b85553bb9a50fce166973471ced0a7cd874bdb6dcad99a21b0d0c3084cb36ca34218c784c8f9611bcbba75ffbc53aeb59a7ecbbe8090f080')

pkgver() {
    cd "$srcdir/international-doom"
    printf "7.x.x.r%s" "$(git rev-list --count HEAD)"
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
    # Upstream forces `-O2` for 'Release' build type
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
}
