# Maintainer: buj <buj351@outlook.com>
pkgname=voidsprite-git
pkgver=2025.09.15+git
pkgrel=1
pkgdesc='Free pixelart editor made in SDL3 C++'
url='https://github.com/counter185/voidsprite'
source=('voidsprite::git+https://github.com/counter185/voidsprite.git')
arch=('i686' 'x86_64')
conflicts=('voidsprite')
provides=('voidsprite')
sha256sums=(SKIP)
depends=(sdl3 sdl3_image sdl3_ttf libpng pugixml xdg-utils libjxl brotli)
makedepends=(git gcc ninja python)
license=(GPL-2.0-only)

pkgver() {
    # voidsprite verisons are dmy dates, but we switch the order so pacman doesn't complain
    cd "$srcdir/voidsprite"
    echo $(git show -1 --no-patch --format=%ci | cut -f1 -d\ | tr - .)+git
}

build() {
    (cd "$srcdir/voidsprite/cmake" && ./setup_cmake.sh && cmake -G Ninja -B build . && cd build && ninja)
}

package() {
    mkdir -p "$pkgdir/usr/share/voidsprite" "$pkgdir/usr/bin"
    for x in voidsprite appfont-MPLUSRounded1c-Medium.ttf appfontcyr-ZenKakuGothicNew-Medium.ttf appfontjp-NotoSansJP-Medium.ttf assets; do
        mv "$srcdir/voidsprite/cmake/build/src/$x" "$pkgdir/usr/share/voidsprite/$x"
    done
    ln -s '/usr/share/voidsprite/voidsprite' "$pkgdir/usr/bin/voidsprite"
}

