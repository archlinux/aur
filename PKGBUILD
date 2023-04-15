# Maintainer: Sandy Carter <bwrsandman@gmail.com>
# Contributor: Raziel23 <venom23 at runbox dot com>

pkgname=vcmi-git
pkgver=1.2.0.213.gdf291463d
pkgrel=1
pkgdesc="Open-source engine for Heroes of Might and Magic III"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="http://vcmi.eu"
license=('GPL2')
depends=('boost-libs' 'ffmpeg' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'qt5-base' 'libxkbcommon-x11'
         'desktop-file-utils' 'gtk-update-icon-cache' 'hicolor-icon-theme' 'tbb' 'fuzzylite'
         'luajit')
makedepends=('boost' 'cmake' 'git')
optdepends=('innoextract: required by vcmibuilder'
            'unshield: required by vcmibuilder'
            'unzip: required by vcmibuilder')
provides=('vcmi')
conflicts=('vcmi')
install="$pkgname.install"
source=("$pkgname::git+https://github.com/vcmi/vcmi.git#branch=develop")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | tr - .
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build && cd build
  cmake -B. -H.. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_RPATH='/usr/lib/vcmi' \
    -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE \
    -DCMAKE_SKIP_RPATH='FALSE' \
    -DENABLE_TEST=OFF \
    -DFORCE_BUNDLED_FL=OFF \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_POLICY_DEFAULT_CMP0074=NEW
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
