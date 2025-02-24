# Maintainer: Sandy Carter <bwrsandman@gmail.com>
# Contributor: Raziel23 <venom23 at runbox dot com>

pkgname=vcmi-git
pkgver=1.6.6.105.g319d90cbb
pkgrel=1
pkgdesc="Open-source engine for Heroes of Might and Magic III"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="http://vcmi.eu"
license=('GPL2')
depends=('boost-libs' 'ffmpeg' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'qt5-base'
         'libxkbcommon-x11' 'desktop-file-utils' 'gtk-update-icon-cache'
         'hicolor-icon-theme' 'tbb' 'luajit')
makedepends=('boost' 'cmake' 'git' 'qt5-tools')
optdepends=('innoextract: required by vcmibuilder'
            'unshield: required by vcmibuilder'
            'unzip: required by vcmibuilder')
provides=('vcmi')
conflicts=('vcmi')
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/vcmi/vcmi.git#branch=develop"
        git+https://github.com/vcmi/innoextract.git#branch=vcmi
        git+https://github.com/fuzzylite/fuzzylite.git#branch=release
        git+https://github.com/google/googletest.git#branch=v1.15.x

)
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --tags | tr - .
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git config submodule.innoextract.url "${srcdir}/innoextract"
  git config submodule.AI/FuzzyLite.url "${srcdir}/fuzzylite"
  git config submodule.test/googletest.url "${srcdir}/googletest"
  git -c protocol.file.allow=always submodule update
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
    -DCMAKE_BUILD_TYPE='RelWithDebInfo'
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
