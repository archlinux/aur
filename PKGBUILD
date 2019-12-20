# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Stefan Karner <stefan.karner at student.tuwien.ac.at>
# Contributor: Drenn

pkgbase=openxcom-extended-git
pkgname=('openxcom-extended-git' 'openxcom-extended-docs-git')
pkgver=6.2.0_r10653.6bb84c2df
pkgrel=1
pkgdesc="An extended version of the open-source reimplementation of X-COM (OXCE) (git-version)"
arch=('i686' 'x86_64')
url="https://openxcom.org/forum/index.php/topic,5251.0.html"
license=('GPL3')
makedepends=('git' 'xmlto' 'docbook-xml' 'docbook-xsl' 'doxygen' 'sdl_mixer'
             'sdl_gfx' 'sdl_image' 'sdl' 'yaml-cpp' 'libgl' 'gcc-libs' 'glibc'
             'boost' 'glu' 'cmake' 'hicolor-icon-theme' 'xorgproto')
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
  mkdir -p openxcom-extended/build
}

build() {
  cd openxcom-extended/build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE="Release" -DDEV_BUILD="Off" ..
  make

  # Make documentation
  cd docs
  make doxygen
}

package_openxcom-extended-git() {
  pkgdesc="An extended version of the open-source reimplementation of X-COM (OXCE) (git-version)"
  depends=('sdl_mixer' 'sdl_gfx' 'sdl_image' 'sdl' 'yaml-cpp' 'libgl' 'gcc-libs'
           'glibc' 'hicolor-icon-theme')
  optdepends=('openxcom-data-steam: pacman-tracked X-COM data files from Steam'
              'openxcom-tftd-data-steam: pacman-tracked Terror From The Deep data files from Steam')
  provides=('openxcom' 'openxcom-git')
  conflicts=('openxcom')
  install="${pkgname}.install"

  cd openxcom-extended/build

  make DESTDIR="${pkgdir}" install
}

package_openxcom-extended-docs-git() {
  pkgdesc="Documentation for the extended version of the open-source reimplementation of X-COM (OXCE) (git-version)"
  arch=('any')
  cd openxcom-extended/build/docs
  install -dm755 "${pkgdir}/usr/share/doc/openxcom-extended/"
  cp -a html "${pkgdir}/usr/share/doc/openxcom-extended/"
}
