# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=openxcom-extended
pkgver=7.9.22
epoch=1
# Repo doesn't use tags, so set which commit this version corresponds to in
# https://github.com/MeridianOXC/OpenXcom/commits/oxce-plus/src/version.h
_commit=82339e8357958f52e59cd91e67c30d26c6ad2953
pkgrel=1
pkgdesc="An extended version of the open-source reimplementation of X-COM (OXCE)"
arch=('i686' 'x86_64')
url="https://openxcom.org/forum/index.php/topic,5251.0.html"
license=('GPL3')
depends=('sdl_mixer' 'sdl_gfx' 'sdl_image' 'sdl' 'yaml-cpp' 'libgl' 'hicolor-icon-theme' 'gcc-libs')
makedepends=('git' 'xmlto' 'docbook-xml' 'docbook-xsl' 'doxygen' 'boost' 'glu' 'cmake' 'xorgproto')
optdepends=('openxcom-data-steam: pacman-tracked X-COM data files from Steam'
            'openxcom-tftd-data-steam: pacman-tracked Terror From The Deep data files from Steam')
provides=('openxcom' 'openxcom-git')
conflicts=('openxcom')
install="${pkgname}.install"
source=(${pkgname}::git+"https://github.com/MeridianOXC/OpenXcom.git#commit=${_commit}")
md5sums=('SKIP')
sha1sums=('SKIP')

prepare() {
  mkdir -p ${pkgname}/build
  # 7.9.22 build fix
  sed -i '/#include <memory>/a#include <utility>' openxcom-extended/src/Engine/CrossPlatform.h
}

build() {
  cd ${pkgname}/build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DTARGET_PLATFORM="linux" -DCMAKE_BUILD_TYPE="None" -DDEV_BUILD="Off" ..
  make
}

package() {
  cd ${pkgname}/build
  make DESTDIR="${pkgdir}" install

  # Fix manpage location
  install -Dm644 "${srcdir}/${pkgname}/docs/openxcom.6" "${pkgdir}/usr/share/man/man6/openxcom.6"
}
