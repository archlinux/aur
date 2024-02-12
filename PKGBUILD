# Maintainer: Giulio Lettieri <giulio.lettieri@gmail.com>

pkgname=lpm
_gitname=lite-xl-plugin-manager
pkgver=1.1.0
pkgrel=2
pkgdesc='A lite-xl plugin manager.'
arch=('x86_64' 'aarch64')
url="https://github.com/lite-xl/lite-xl-plugin-manager"
license=('MIT')
depends=('lua' 'zlib' 'libzip' 'libgit2' 'mbedtls2')
makedepends=('meson')
provides=("$pkgname")
conflicts=("$pkgname")
source=("${_gitname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "microtar-0.1.0.tar.gz::https://github.com/rxi/microtar/archive/refs/tags/v0.1.0.tar.gz")
sha256sums=('9c68f3c485ff2ba30d462461b843030671625dd20492e9b6c0bdd7a59fe68eb6'
            'eb30a906d714c6547841d67f8d49739c56dd8a506fda4c61dd7d6f4da0a9d9aa')

prepare() {
  cp -a -t "${_gitname}-${pkgver}/lib/microtar" "${srcdir}/microtar-0.1.0/."
}

build() {
  cd "${_gitname}-${pkgver}"
  CFLAGS="$CFLAGS -DLPM_VERSION='\"${pkgver}\"'"
  arch-meson -Dstatic=true . build
  meson compile -C build
}

package() {
  install -D "${srcdir}/${_gitname}-${pkgver}/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
