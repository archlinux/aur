# Maintainer: buj <buj351@outlook.com>
pkgname=voidsprite-bin
_pkgver=18.03.2025
pkgver=$(echo $_pkgver | tr '.' $'\n' | tac | paste -s -d '.')+alpha
pkgrel=4
pkgdesc='Free pixelart editor made in SDL2 C++'
url='https://github.com/counter185/voidsprite'
_zip=voidsprite-${_pkgver}-linux-x86_64.flatpak.zip
source=("https://github.com/counter185/voidsprite/releases/download/alpha${_pkgver}/${_zip}")
arch=('x86_64')
conflicts=('voidsprite')
provides=("voidsprite=$(echo $_pkgver | tr '.' $'\n' | tac | paste -s -d '.')")
sha256sums=('b77361050e3ef209b2d399b0c8c62882d259d6fdcd1aaff94b1be77a835ded6d')
depends=(sdl2 sdl2_image sdl2_ttf libpng pugixml xdg-utils libjxl brotli)
makedepends=(unzip ostree sed)
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
    _files="$(ls "${pkgdir}/usr/share/licenses")"
    mkdir ${pkgdir}/usr/share/licenses/voidsprite
    for x in $_files; do
        mv -vf ${pkgdir}/usr/share/licenses/${x} ${pkgdir}/usr/share/licenses/voidsprite/${x}
    done
}

