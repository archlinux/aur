# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Stefan Karner <stefan.karner at student.tuwien.ac.at>
# Contributor: Drenn

pkgbase=openxcom-extended-git
pkgname=('openxcom-extended-git' 'openxcom-extended-docs-git')
pkgver=8.1.5_r12882.a1288c6cc
pkgrel=1
pkgdesc="An extended version of the open-source reimplementation of X-COM (OXCE) (git-version)"
arch=('i686' 'x86_64')
url="https://openxcom.org/forum/index.php/topic,5251.0.html"
license=('GPL-3.0-or-later')
makedepends=('boost' 'cmake' 'docbook-xml' 'docbook-xsl' 'doxygen' 'gcc-libs' 'git'
             'glu' 'hicolor-icon-theme' 'libgl' 'sdl' 'sdl_gfx' 'sdl_image' 'sdl_mixer'
             'xmlto' 'xorgproto' 'yaml-cpp')
source=(openxcom-extended::git+"https://github.com/MeridianOXC/OpenXcom.git")
sha256sums=('SKIP')

pkgver() {
  cd openxcom-extended
  # Repo doesn't use tags, so construct version from src file + git commits
  _exrel=$(awk '/OPENXCOM_VERSION_LONG/ && match($0, /[0-9]+.[0-9]+.[0-9]+/) { print substr($0, RSTART, RLENGTH) }' src/version.h)
  _commits=$(git rev-list --count HEAD)
  _revision=$(git rev-parse --short HEAD)
  printf "%s_r%s.%s" ${_exrel} ${_commits} ${_revision}
}

prepare() {
  sed -i 's:openxcom.6 DESTINATION ${CMAKE_INSTALL_PREFIX}/man/man6):openxcom.6 DESTINATION ${CMAKE_INSTALL_PREFIX}/share/man/man6):' openxcom-extended/docs/CMakeLists.txt
}

build() {
  cmake -B build -S openxcom-extended -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE="None" -DDEV_BUILD="Off" \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  cd build
  make

  # Make documentation
  cd docs
  make doxygen
}

package_openxcom-extended-git() {
  pkgdesc="An extended version of the open-source reimplementation of X-COM (OXCE) (git-version)"
  depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libgl' 'sdl' 'sdl_gfx'
           'sdl_image' 'sdl_mixer' 'yaml-cpp')
  optdepends=('openxcom-data-steam: pacman-tracked X-COM data files from Steam'
              'openxcom-tftd-data-steam: pacman-tracked Terror From The Deep data files from Steam')
  provides=('openxcom' 'openxcom-git')
  conflicts=('openxcom')
  install="${pkgname}.install"

  cd build

  make DESTDIR="${pkgdir}" install
}

package_openxcom-extended-docs-git() {
  pkgdesc="Documentation for the extended version of the open-source reimplementation of X-COM (OXCE) (git-version)"
  arch=('any')
  cd build/docs
  install -dm755 "${pkgdir}/usr/share/doc/openxcom-extended/"
  cp -a html "${pkgdir}/usr/share/doc/openxcom-extended/"
}
