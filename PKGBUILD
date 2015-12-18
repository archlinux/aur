# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>
pkgname=chipmachine
pkgver=1.2
pkgrel=1
pkgdesc='A demoscene/retro Jukebox/spotify-like music player'
arch=('i686' 'x86_64')
url='https://github.com/sasq64/chipmachine'
depends=('mpg123' 'glew' 'glfw' 'curl')
makedepends=('cmake' 'ninja')
license=('MIT')
source=(https://github.com/sasq64/${pkgname}/archive/v${pkgver}.tar.gz
        https://github.com/sasq64/apone/archive/${pkgname}-v${pkgver}.tar.gz)
sha256sums=(1371734728b99fa22ebd36a7aa9ccc88e8f975ff8abb749075c10afc01eb3b51
            96fd8f1ec540a8c3121145dbdf51adf9ad2efe2b0ed58b68d7512d7c45fc5806)

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
