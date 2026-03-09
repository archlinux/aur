# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=openxcom-extended
pkgver=8.5.6
epoch=1
# Repo doesn't use tags, so set which commit this version corresponds to in
# https://github.com/MeridianOXC/OpenXcom/commits/oxce-plus/src/version.h
_commit=20fcab37c86f605de9dcaa47598dcf22526b0bf3
pkgrel=1
pkgdesc="An extended version of the open-source reimplementation of X-COM (OXCE)"
arch=('i686' 'x86_64')
url="https://openxcom.org/forum/index.php/topic,5251.0.html"
license=('GPL-3.0-or-later')
depends=('glibc' 'hicolor-icon-theme' 'libgcc' 'libgl' 'libstdc++' 'sdl'
         'sdl_gfx' 'sdl_image' 'sdl_mixer' 'yaml-cpp')
makedepends=('boost' 'cmake' 'docbook-xml' 'docbook-xsl'
             'doxygen' 'git' 'glu' 'xmlto' 'xorgproto')
optdepends=('openxcom-data-steam: pacman-tracked X-COM data files from Steam'
            'openxcom-tftd-data-steam: pacman-tracked Terror From The Deep data files from Steam')
provides=('openxcom' 'openxcom-git')
conflicts=('openxcom')
install="${pkgname}.install"
source=(${pkgname}::git+"https://github.com/MeridianOXC/OpenXcom.git#commit=${_commit}")
md5sums=('3771bdaceb25d0e9a6d57df72e820538')
sha1sums=('a144ebcfdfc89e8567d3a1deb2d06721a6fa45ff')

build() {
  cmake -B build -S ${pkgname} -DCMAKE_INSTALL_PREFIX="/usr" -DTARGET_PLATFORM="linux" \
        -DCMAKE_BUILD_TYPE="None" -DDEV_BUILD="Off" \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  cd build
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  # Fix manpage location
  install -Dm644 "${srcdir}/${pkgname}/docs/openxcom.6" "${pkgdir}/usr/share/man/man6/openxcom.6"
}
