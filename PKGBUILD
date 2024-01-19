# Maintainer: gigas002 <gigas002@pm.me>
# Contributor: Raziel23 <venom23 at runbox dot com>
# Contributor: Sandy Carter <bwrsandman@gmail.com>

pkgname=vcmi
pkgver=1.4.3
pkgrel=1
pkgdesc="Open-source engine for Heroes of Might and Magic III"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="http://vcmi.eu"
license=('GPL2')
depends=('boost-libs' 'ffmpeg' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'qt5-base' 'qt5-tools' 'libxkbcommon-x11'
         'desktop-file-utils' 'gtk-update-icon-cache' 'hicolor-icon-theme' 'onetbb' 'fuzzylite'
         'luajit')
makedepends=('boost' 'cmake' 'git' 'ccache')
optdepends=('innoextract: required by vcmibuilder' 'unshield: required by vcmibuilder' 'unzip: required by vcmibuilder')
provides=('vcmi')
conflicts=('vcmi')
install="${pkgname}.install"
source=("https://github.com/vcmi/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('29311e5b93e2262f39fd25c196f293a02b76438e0dd322ff1404605feacfb9be')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build && cd build
  cmake -B. -H.. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_RPATH='/usr/lib/vcmi' \
    -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE \
    -DCMAKE_SKIP_RPATH='FALSE' \
    -DENABLE_TEST=OFF \
    -DFORCE_BUNDLED_FL=OFF \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_CXX_COMPILER_LAUNCHER='ccache' \
    -DCMAKE_C_COMPILER_LAUNCHER='ccache' \
    -Wno-dev
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
