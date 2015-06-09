# Maintainer: Raziel23 <venom23 at runbox dot com>

pkgname=vcmi-git
pkgver=r4845.e529ac6
pkgrel=1
pkgdesc="Heroes of Might and Magic 3 game engine"
arch=('i686' 'x86_64')
url="http://forum.vcmi.eu/portal.php"
license=('GPL2')
depends=('boost-libs' 'ffmpeg' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'qt5-base' 'libxkbcommon-x11'
         'desktop-file-utils' 'gtk-update-icon-cache' 'hicolor-icon-theme' 'minizip')
makedepends=('boost' 'cmake' 'git')
optdepends=('innoextract: required by vcmibuilder'
            'unshield: required by vcmibuilder'
            'unzip: required by vcmibuilder')
provides=('vcmi')
conflicts=('vcmi')
options=('!makeflags' 'strip' 'debug')
install="$pkgname.install"
source=("$pkgname::git+https://github.com/vcmi/vcmi.git#branch=develop")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Remove the last build.
  [[ -d "$pkgname-build" ]] && rm -rf "$pkgname-build"
  mkdir "$pkgname-build"
}

build() {
  cd "$pkgname-build"
  cmake "../$pkgname" \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -DCMAKE_SKIP_RPATH='FALSE' \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo'
  make
}

package() {
  cd "$pkgname-build"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
