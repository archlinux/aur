# Maintainer: Snowstorm64

pkgname=mupen64plus-input-raphnetraw
pkgver=1.1.0
pkgrel=1
pkgdesc="raphnetraw: Direct N64 controller access plugin for mupen64plus"
arch=("x86_64" "i686")
url="https://www.raphnet-tech.com/products/raphnetraw/index.php"
license=("GPL")
depends=("mupen64plus-git" "hidapi")
provides=(mupen64plus-input-raphnetraw)
conflicts=(mupen64plus-input-raphnetraw)
source=("https://www.raphnet-tech.com/downloads/mupen64plus-input-raphnetraw-1.1.0.tar.gz"
        "fix-build.patch"
        "0001-Remove-SDL_PumpEvents.patch")
sha256sums=("32ea9fd14fc71720b131ddc0a17393e3dd052778d91d6b78e49652950d635245"
            "3422fc7253a8d1b347e2f1af1c82a87fd18631764d8b2b5ed566b0efadd12ea8"
            "a2116ef3343c1d67f03877fd8a8bb0cc59560ebd36410e8cb46d59fde28436d9")

prepare() {
  # Apply this important patch to make the plugin work correctly with mupen64plus
  patch -Np1 -i "${srcdir}/0001-Remove-SDL_PumpEvents.patch"
  # config.h is unused, remove it otherwise it fails to build
  patch -Np1 -i "${srcdir}/fix-build.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/projects/unix"
  make all
}

package() {
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/projects/unix/mupen64plus-input-raphnetraw.so" "${pkgdir}/usr/lib/mupen64plus/mupen64plus-input-raphnetraw.so"
}
