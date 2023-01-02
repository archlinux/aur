# Maintainer: Jonathan Tinkham <sctincman at gmail dot com>
# Contributor: Mike Polvere <mic.tjs at gmail dot com>
# Contributor: uberushaximus <uberushaximus at gmail dot com>

pkgname=libretro-bsnes-mercury-git
pkgver=343.fb9a41f
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

prepare() {
  for p in accuracy balanced performance; do
    cp -r ${_gitname} ${_gitname}-${p}
  done
}

pkgver() {
    cd "${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    for p in accuracy balanced performance; do
        make PROFILE=${p} -C ${_gitname}-${p}
    done
}

package() {
    install -Dm644 "${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    for p in accuracy balanced performance; do
        install -Dm644 "${_gitname}-${p}/${_libname}_${p}_libretro.so" -t "${pkgdir}/usr/lib/libretro/"
    done
}
