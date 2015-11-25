# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>
pkgname=chipmachine
pkgver=1.01
pkgrel=1
pkgdesc='A demoscene/retro Jukebox/spotify-like music player'
arch=('i686' 'x86_64')
url='https://github.com/sasq64/chipmachine'
depends=('mpg123' 'glew' 'glfw' 'curl')
makedepends=('cmake' 'ninja')
license=('MIT')
source=(https://github.com/sasq64/${pkgname}/archive/v${pkgver}.tar.gz
        https://github.com/sasq64/apone/archive/${pkgname}-v${pkgver}.tar.gz)
sha256sums=(f39a4688ed3e2ee545b35af40bf7577d52596e0db74eddea12ad7cf878c981cc
            37a39f2a3ed502e2c5ee55d005c8634888d5129a0ca0af79d53028f279ee6623)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ln -s ${srcdir}/apone-${pkgname}-v${pkgver} ${srcdir}/apone
  cmake -GNinja -DCMAKE_BUILD_TYPE=Release || return 1
  ninja || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  
  # Binary
  install -D -m755 ${pkgname} ${pkgdir}/usr/lib/${pkgname}/${pkgname}
  install -d -m755 ${pkgdir}/usr/bin/
  ln -s /usr/lib/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  
  # Directories
  install -d -m755 ${pkgdir}/usr/lib/${pkgname}/data
  cp -r data ${pkgdir}/usr/lib/${pkgname}/
  install -d -m755 ${pkgdir}/usr/lib/${pkgname}/lua
  cp -r lua ${pkgdir}/usr/lib/${pkgname}/
  
  # License
  install -D -m644 ${srcdir}/apone/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
