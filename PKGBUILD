# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Stefan Karner <stefan.karner at student.tuwien.ac.at>
# Contributor: Drenn

pkgbase=openxcom-git
pkgname=('openxcom-git' 'openxcom-docs-git')
_gitname=OpenXcom
pkgver=1.0_r3144_g31c72c887
pkgrel=1
pkgdesc="An open-source reimplementation of the famous X-COM game (git-version)"
arch=('i686' 'x86_64')
url="https://openxcom.org/"
license=('GPL-3.0-or-later')
makedepends=('boost' 'cmake' 'docbook-xml' 'docbook-xsl' 'doxygen' 'gcc-libs' 'git'
             'glu' 'hicolor-icon-theme' 'libgl' 'sdl' 'sdl_gfx' 'sdl_image' 'sdl_mixer'
             'xmlto' 'xorgproto' 'yaml-cpp')
source=(git+"https://github.com/SupSuper/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed -e 's:^v::;s:\([^-]*-g\):r\1:;s:-:_:g'
}

prepare() {
  # Fix manpage install location
  sed -i 's:openxcom.6 DESTINATION ${CMAKE_INSTALL_PREFIX}/man/man6):openxcom.6 DESTINATION ${CMAKE_INSTALL_PREFIX}/share/man/man6):' ${_gitname}/docs/CMakeLists.txt
}

build() {
  cmake -B build -S ${_gitname} -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE="None" -DDEV_BUILD="Off" \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  cd build
  make

  # Make documentation
  cd docs
  make doxygen
}

package_openxcom-git() {
  pkgdesc="An open-source reimplementation of the famous X-COM game (git-version)"
  depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libgl' 'sdl' 'sdl_gfx'
           'sdl_image' 'sdl_mixer' 'yaml-cpp')
  optdepends=('openxcom-data-steam: pacman-tracked X-COM data files from Steam'
              'openxcom-tftd-data-steam: pacman-tracked Terror From The Deep data files from Steam')
  provides=('openxcom')
  conflicts=('openxcom')
  install="${pkgname}.install"

  cd build

  make DESTDIR="${pkgdir}" install
}

package_openxcom-docs-git() {
  pkgdesc="Documentation for the open-source reimplementation of the famous X-COM game (git-version)"
  arch=('any')
  cd build/docs
  install -dm755 "${pkgdir}/usr/share/doc/openxcom/"
  cp -a html "${pkgdir}/usr/share/doc/openxcom/"
}
