# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=onscripter-yuri
_gitname=OnscripterYuri
pkgdesc="An enhancement ONScripter project porting to many platforms, especially web."
pkgver=0.7.5
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/YuriSizuku/OnscripterYuri"
license=('GPL-2.0-only')
depends=('glibc'
         'gcc-libs'
         'sdl2'
         'sdl2_mixer'
         'sdl2_ttf'
         'sdl2_image'
#         'libjpeg-turbo'
         'bzip2'
         'lua'
#         'fontconfig'
)
makedepends=("cmake")
provides=("onsyuri")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "ld-all-dynamic.patch")
sha256sums=('64691cb456892868b0ecb7667b297f82db5d260b3070b41c57a7934be05eb3ef'
            '63792b3d3b945960831379e7259a7403b0d29107506c49bcd406fd1012766965')

prepare() {
  cd ${srcdir}/${_gitname}-${pkgver}
  
  patch --forward --strip=1 --input="${srcdir}/ld-all-dynamic.patch"
}

build() {
  cd ${srcdir}/

  cmake -B build -S "${_gitname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
  cmake --build build
}

package() {
  # DESTDIR="$pkgdir" cmake --install build : it doesn't work
  install -Dm 755 build/onsyuri -t ${pkgdir}/usr/bin/
}

# vim: set sw=2 ts=2 et:
