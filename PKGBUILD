# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Stefan Karner <stefan.karner at student.tuwien.ac.at>
# Contributor: Drenn

pkgbase=openxcom-git
pkgname=('openxcom-git' 'openxcom-docs-git')
_gitname=OpenXcom
pkgver=1.0_r2996_gb008e3196
pkgrel=1
pkgdesc="An open-source reimplementation of the famous X-COM game (git-version)"
arch=('i686' 'x86_64')
url="https://openxcom.org/"
license=('GPL3')
makedepends=('git' 'xmlto' 'docbook-xml' 'docbook-xsl' 'doxygen' 'sdl_mixer'
             'sdl_gfx' 'sdl_image' 'sdl' 'yaml-cpp' 'libgl' 'gcc-libs' 'glibc'
             'boost' 'glu' 'cmake' 'hicolor-icon-theme' 'xorgproto')
source=(git+"https://github.com/SupSuper/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed -e 's:^v::;s:\([^-]*-g\):r\1:;s:-:_:g'
}
prepare() {
  mkdir -p ${_gitname}/build
}

build() {
  cd ${_gitname}/build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE="None" -DDEV_BUILD="Off" ..
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

  cd ${_gitname}/build

  make DESTDIR="${pkgdir}" install
  # Fix manpage location
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/man"
}

package_openxcom-docs-git() {
  pkgdesc="Documentation for the open-source reimplementation of the famous X-COM game (git-version)"
  arch=('any')
  cd ${_gitname}/build/docs
  install -dm755 "${pkgdir}/usr/share/doc/openxcom/"
  cp -a html "${pkgdir}/usr/share/doc/openxcom/"
}
