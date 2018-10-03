# Maintainer: Mike Polvere <mic.tjs@gmail.com>
# Contributor: uberushaximus <uberushaximus@gmail.com>

pkgname=libretro-bsnes-mercury-git
pkgver=314.4e221df
pkgrel=1
pkgdesc='Super Nintendo Entertainment System cores with various performance improvements'
arch=('i686' 'x86_64')
_libname=bsnes_mercury
_gitname=bsnes-mercury
url="https://github.com/libretro/${_gitname}"
license=('GPL3')
groups=('libretro')
depends=('gcc-libs' 'glibc')
makedepends=('git')
source=("git+https://github.com/libretro/${_gitname}")
sha256sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "${_gitname}"
    for i in accuracy balanced performance; do
        make profile=${i}
    done
}

package() {
    install -Dm644 "${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    for i in accuracy balanced performance; do
        install -Dm644 "${_gitname}/out/${_libname}_${i}_libretro.so" "${pkgdir}/usr/lib/libretro/${_libname}_${i}_libretro.so"
    done
}
