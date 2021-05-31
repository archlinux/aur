# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: dianlujitao <dianlujitao at gmail dot com>

pkgname=onscripter-jh
pkgdesc="An optimized SDL2 port of ONScripter, a game scripting engine"
pkgver=0.7.6.848ebad
pkgrel=5
_commit=848ebadd3fd54b2c
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
# origin upstream is 404 now
# url="https://bitbucket.org/jh10001/onscripter-jh"
# 
# use a github fork
# ONS_JH_VERSION "0.7.6"
# ONS_VERSION "20181218"
# NSC_VERSION 296
url="https://github.com/weimingtom/onscripter_jh_sdl2_fork"
license=('GPL')
depends=('sdl2'
         'sdl2_mixer'
         'sdl2_ttf'
         'sdl2_image'
         'libjpeg-turbo'
         'bzip2'
         'libvorbis'
         'lua51'
         'fontconfig')
makedepends=('git')
source=("${pkgname}::git+${url}"
        "display-flash-fix.patch"
        "target.patch"
        "lua51.patch"
        "gcc-simd.patch")
sha256sums=('SKIP'
            'e9ecb802e327de4e8ab81dc84c294f20e629900472d3d4d703ac1e10c418cfff'
            'f39396e9bf0ca4c32d2e3c5e388cbda8d52fce4db8dd6c428177bc2487a8fa14'
            '321776cd8f641f510849edd959ebd0383453a38f1ef8d17c8f36f035f43780cc'
            '7d1fff2e6d652aacada2f979ffdd9c1bfc5e8647e4fa566f14c94d5b6856b4b1')

pkgver() {
  cd ${srcdir}/${pkgname}

  printf "%s.%s" "$(head -n1 version.h | awk '{print $3}' | sed 's|\"||g')" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/${pkgname}
    
  mv onscripter.cpp ONScripter.cpp

  patch -p1 < ${srcdir}/target.patch 
  patch -p1 < ${srcdir}/display-flash-fix.patch
  patch -p1 < ${srcdir}/lua51.patch
  patch -p1 < ${srcdir}/gcc-simd.patch
}

build() {
  cd ${srcdir}/${pkgname}
    
  make -f Makefile.Linux onscripter
}

package() {
  cd ${srcdir}/${pkgname}

  install -Dm 755 ${srcdir}/${pkgname}/onscripter ${pkgdir}/usr/bin/onscripter-jh
}

# vim: set sw=2 ts=2 et:
