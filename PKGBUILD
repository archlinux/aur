# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=openxcom-extended
pkgver=8.5.1
epoch=1
# Repo doesn't use tags, so set which commit this version corresponds to in
# https://github.com/MeridianOXC/OpenXcom/commits/oxce-plus/src/version.h
_commit=8a5680904621c1c5486d546f4bd3b2c2a1ba32b2
pkgrel=2
pkgdesc="An extended version of the open-source reimplementation of X-COM (OXCE)"
arch=('i686' 'x86_64')
url="https://openxcom.org/forum/index.php/topic,5251.0.html"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libgl'
         'sdl' 'sdl_gfx' 'sdl_image' 'sdl_mixer' 'yaml-cpp')
makedepends=('boost' 'cmake' 'docbook-xml' 'docbook-xsl'
             'doxygen' 'git' 'glu' 'xmlto' 'xorgproto')
optdepends=('openxcom-data-steam: pacman-tracked X-COM data files from Steam'
            'openxcom-tftd-data-steam: pacman-tracked Terror From The Deep data files from Steam')
provides=('openxcom' 'openxcom-git')
conflicts=('openxcom')
install="${pkgname}.install"
source=(${pkgname}::git+"https://github.com/MeridianOXC/OpenXcom.git#commit=${_commit}")
md5sums=('462188a8a08c8c46c6870ff14272c0f9')
sha1sums=('f42fe8b4feaec7519c964efa5e51aa3168252e68')

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
