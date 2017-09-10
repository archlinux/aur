# Maintainer: Sandy Carter <bwrsandman@gmail.com>
# Contributor: Raziel23 <venom23 at runbox dot com>

pkgname=vcmi-git
pkgver=r6865.feba7e19
pkgrel=1
pkgdesc="Open-source engine for Heroes of Might and Magic III"
arch=('i686' 'x86_64')
url="http://vcmi.eu"
license=('GPL2')
depends=('boost-libs' 'ffmpeg' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'qt5-base' 'libxkbcommon-x11'
         'desktop-file-utils' 'gtk-update-icon-cache' 'hicolor-icon-theme' 'fuzzylite')
makedepends=('boost' 'cmake' 'git')
optdepends=('innoextract: required by vcmibuilder'
            'unshield: required by vcmibuilder'
            'unzip: required by vcmibuilder')
provides=('vcmi')
conflicts=('vcmi')
install="$pkgname.install"
source=("$pkgname::git+https://github.com/vcmi/vcmi.git#branch=develop")
md5sums=('SKIP')

prepare() {
  sed -i 's,Exec=,Exec=env LD_LIBRARY_PATH=/usr/lib/vcmi ,g' "${srcdir}/${pkgname}"/client/icons/vcmiclient.desktop
  sed -i 's,Exec=,Exec=env LD_LIBRARY_PATH=/usr/lib/vcmi ,g' "${srcdir}/${pkgname}"/launcher/vcmilauncher.desktop
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -DCMAKE_SKIP_RPATH='FALSE' \
    -DENABLE_TEST=OFF \
    -DFORCE_BUNDLED_FL=OFF \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo'
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
