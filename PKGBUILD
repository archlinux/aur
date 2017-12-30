# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Stefan Karner <stefan.karner at student.tuwien.ac.at>
# Contributor: Drenn

pkgbase=openxcom-git
pkgname=('openxcom-git' 'openxcom-docs-git')
_gitname=OpenXcom
pkgver=1.0_2491_gc7204b174
pkgrel=1
pkgdesc="An open-source reimplementation of the famous X-COM game (git-version)"
arch=('i686' 'x86_64')
url="https://openxcom.org/"
license=('GPL3')
makedepends=('git' 'xmlto' 'docbook-xml' 'docbook-xsl' 'doxygen' 'sdl_mixer'
             'sdl_gfx' 'sdl_image' 'sdl' 'yaml-cpp' 'libgl' 'gcc-libs' 'glibc'
             'boost' 'glu' 'cmake' 'hicolor-icon-theme')
source=(git+"https://github.com/SupSuper/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  git describe --tags | sed -e 's:v::' -e 's:-:_:g'
}

build() {
  cd ${_gitname}
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE="Release" -DDEV_BUILD="Off"
  make

  # Make documentation
  cd docs
  make doxygen
}

package_openxcom-git() {
  pkgdesc="An open-source reimplementation of the famous X-COM game (git-version)"
  depends=('sdl_mixer' 'sdl_gfx' 'sdl_image' 'sdl' 'yaml-cpp' 'libgl' 'gcc-libs'
           'glibc' 'hicolor-icon-theme')
  optdepends=('openxcom-data-steam: pacman-tracked X-COM data files from Steam')
  provides=('openxcom')
  conflicts=('openxcom')
  install="${pkgname}.install"

  cd ${_gitname}

  make DESTDIR="${pkgdir}" install
}

package_openxcom-docs-git() {
  pkgdesc="Documentation for the open-source reimplementation of the famous X-COM game (git-version)"
  arch=('any')
  cd ${_gitname}/docs
  install -dm755 "${pkgdir}/usr/share/doc/openxcom/"
  cp -a html "${pkgdir}/usr/share/doc/openxcom/"
}
