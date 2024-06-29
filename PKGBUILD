# Maintainer: Markus Hartung <mail@hartmark.se>

pkgname=glsmac-git
pkgver=0.3.f239b59b
pkgrel=1
pkgdesc='Unofficial open-source OpenGL/SDL2 reimplementation of Sid Meier''s Alpha Centauri ( + Alien Crossfire )'
arch=('x86_64')
url='https://github.com/afwbkbc/glsmac'
license=('AGPL-3.0-only')
depends=(glew sdl2 gcc-libs libglvnd yaml-cpp sdl2_image glibc freetype2 uuid sh)
makedepends=(git cmake base-devel)
source=("${pkgname}::git+https://github.com/afwbkbc/glsmac.git")
sha256sums=('SKIP')
conflicts=()
provides=(glsmac)

prepare() {
  cd "${pkgname}"
}

pkgver() {
  cd "${pkgname}"
  printf "%s.%s\n" "$(grep -Eo 'v(0\.[0-9])' CHANGELOG.md | sed 's/v//' | head -1)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release && make -C build

    # debug build
#    cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug && make -C build
}

package() {
    cd "${srcdir}/${pkgname}"

    mkdir -p "$pkgdir/usr/share/glsmac"
    cp -dpr --no-preserve=ownership GLSMAC_data "$pkgdir/usr/share/glsmac/GLSMAC_data"

    install -Dm755 build/bin/GLSMAC "$pkgdir/usr/bin/glsmac"
}
