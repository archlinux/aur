# Maintainer: buj <buj351@outlook.com>
pkgname=voidsprite-bin
_pkgver=19.02.2025
pkgver=$(echo $_pkgver | tr '.' $'\n' | tac | paste -s -d '.')+alpha
pkgrel=3
pkgdesc='Free pixelart editor made in SDL2 C++'
url='https://github.com/counter185/voidsprite'
_zip=voidsprite-${_pkgver}-linux-flatpak-x86_64.zip
source=("https://github.com/counter185/voidsprite/releases/download/alpha${_pkgver}/${_zip}")
arch=('x86_64')
conflicts=('voidsprite')
provides=("voidsprite=$(echo $_pkgver | tr '.' $'\n' | tac | paste -s -d '.')")
sha256sums=('d3b4951f31d63e6f36e50794c73b266c299d5c6e4f3c0b197efc6c75340065d7')
depends=(sdl2 sdl2_image sdl2_ttf libpng pugixml xdg-utils libjxl brotli)
makedepends=(unzip ostree binutils)
license=(GPL-2.0-only)

build() {
    _repo=${srcdir}/voidsprite-repo
    _src=${srcdir}/voidsprite-src

    unzip -o "${srcdir}/${_zip}"
    rm -fr ${srcdir}/voidsprite-{repo,src}
    ostree init --repo=${_repo} --mode=bare-user
    ostree static-delta apply-offline --repo=${_repo} voidsprite-build-linux64-flatpak.flatpak
    cd ${_repo} && \
        ostree checkout --repo=${_repo} -U $(echo objects/*/*.commit | cut -d/ -f2- | tr -d / | cut -d. -f1) ${_src}

    # haha funny bin patch
    sed -i -E 's/\/app\/share\/voidsprite/\/usr\/share\/voidsprite/g' ${_src}/files/bin/voidsprite
}

package() {
    _src=${srcdir}/voidsprite-src

    mkdir -p ${pkgdir}/usr
    cp -r ${_src}/files/share ${pkgdir}/usr/share
    mkdir ${pkgdir}/usr/bin
    install -m 751 ${_src}/files/bin/voidsprite ${pkgdir}/usr/bin/voidsprite
}

