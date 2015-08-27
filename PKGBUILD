# Maintainer: Sandy Carter <bwrsandman@gmail.com>
# Contributor: Raziel23 <venom23 at runbox dot com>

pkgname=vcmi
pkgver=0.98
pkgrel=3
pkgdesc="Open-source engine for Heroes of Might and Magic III"
arch=('i686' 'x86_64')
url="http://vcmi.eu"
license=('GPL2')
depends=('boost-libs' 'ffmpeg' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'qt5-base' 'libxkbcommon-x11'
         'desktop-file-utils' 'gtk-update-icon-cache' 'hicolor-icon-theme' 'minizip')
makedepends=('boost' 'cmake')
optdepends=('innoextract: required by vcmibuilder'
            'unshield: required by vcmibuilder'
            'unzip: required by vcmibuilder')
install="${pkgname}.install"
source=(https://github.com/vcmi/${pkgname}/archive/${pkgver}.tar.gz
        '0001-Fix-building-with-Boost-1.58.patch')
md5sums=('6a69e52a3380358220eba67332b097c6'
         '1dbb6a91a35d141a2d266ad235a790e1')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Backport fix building with Boost 1.58.
  patch -Np1 -i '../0001-Fix-building-with-Boost-1.58.patch'
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -DCMAKE_SKIP_RPATH='FALSE' \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo'
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
