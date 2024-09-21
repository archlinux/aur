# Maintainer: buj <buj351@outlook.com>
pkgname=voidsprite-git
pkgver=alpha27.08.2024.r120.gcd029a5
pkgrel=2
pkgdesc='Free pixelart editor made in SDL2 C++'
url='https://github.com/counter185/voidsprite'
source=('voidsprite::git+https://github.com/counter185/voidsprite.git')
arch=('i686' 'x86_64')
conflicts=('voidsprite')
provides=('voidsprite=${pkgver}')
sha256sums=(SKIP)
depends=(sdl2 sdl2_image sdl2_ttf libpng pugixml xdg-utils)
makedepends=(git meson gcc ninja python proot)
license=(GPL-2.0-only)

pkgver() {
    cd "${srcdir}/voidsprite"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -p "${srcdir}/prefix"
    cd "${srcdir}/voidsprite"
    proot -b "${srcdir}/prefix":/usr/share/voidsprite \
        ./linux_build.sh --release --prefix /usr/share/voidsprite
}

package() {
    mkdir -p "${pkgdir}"/usr/{share,bin}
    cp -r "${srcdir}/prefix"/* "${pkgdir}/usr/"

    # Really stinky glue to make this work
    mkdir -p "${pkgdir}/usr/share/voidsprite/"{share/voidsprite,bin}
    mv "${pkgdir}/usr/bin/voidsprite" "${pkgdir}/usr/share/voidsprite/bin/voidsprite"
    mv "${pkgdir}/usr/share/voidsprite/"{assets,share/voidsprite/assets}
    mv "${pkgdir}/usr/share/voidsprite"/appfont* "${pkgdir}/usr/share/voidsprite/share/voidsprite"
    ln -s "/usr/share/voidsprite/bin/voidsprite" "${pkgdir}/usr/bin/voidsprite"
}

