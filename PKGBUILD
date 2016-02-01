# Maintainer : Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor:  prettyvanilla <prettyvanilla@posteo.at>

pkgname=libretro-ppsspp-git
pkgver=14111.67abe46
pkgrel=1
pkgdesc="libretro implementation of PPSSPP. (PlayStation Portable/PSP)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/ppsspp"
license=('GPL')
depends=('zlib' 'libgl')
makedepends=('git')

_gitname=libretro-ppsspp
source=("git+https://github.com/libretro/${_gitname}.git"
        "git+https://github.com/hrydgard/minidx9.git"
        "git+https://github.com/libretro/ppsspp-ffmpeg"
        "git+https://github.com/hrydgard/ppsspp-lang"
        "git+https://github.com/libretro/ppsspp-native"
        "git+https://github.com/hrydgard/pspautotests"
        "git+https://github.com/hrydgard/ppsspp-redist"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/ppsspp_libretro.info"
       )
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
        )

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${_gitname}"

  git submodule init

  git config submodule.dx9sdk.url "${srcdir}/minidx9"
  git config submodule.ffmpeg.url "${srcdir}/ppsspp-ffmpeg"
  git config submodule.lang.url "${srcdir}/ppsspp-lang"
  git config submodule.native.url "${srcdir}/ppsspp-native"
  git config submodule.pspautotests.url "${srcdir}/pspautotests"
  git config submodule.redist.url "${srcdir}/ppsspp-redist"

  git submodule update
}

build() {
  cd "${_gitname}/libretro"
  make 
}

package() {
  install -Dm644 "${_gitname}/libretro/ppsspp_libretro.so" "${pkgdir}/usr/lib/libretro/ppsspp_libretro.so"
  install -Dm644 "ppsspp_libretro.info" "${pkgdir}/usr/lib/libretro/ppsspp_libretro.info"
}
