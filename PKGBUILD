# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on community/qbittorrent by Antonio Rojas <arojas@archlinux.org>
#
# PRs are welcome here: https://github.com/yurikoles-aur/qbittorrent-git
#

pkgbase=qbittorrent-git
pkgname=(qbittorrent-git qbittorrent-nox-git)
pkgver=4.5.0beta1.r84.g3a2e73cc9
pkgrel=1
epoch=1
arch=(x86_64)
url='https://www.qbittorrent.org'
license=(custom GPL)
depends=(libtorrent-rasterbar qt6-base)
makedepends=(cmake boost qt6-tools qt6-svg)
makedepends+=(git)
optdepends=('python: needed for torrent search tab')
source=("$pkgbase::git+https://github.com/qbittorrent/qBittorrent.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgbase

  # replace latest tag with version from cmake
  local _major=`grep -m 1 QBT_VERSION_MAJOR src/base/version.h.in | cut -d' ' -f3`
  local _minor=`grep -m 1 QBT_VERSION_MINOR src/base/version.h.in | cut -d' ' -f3`
  local _bugfix=`grep -m 1 QBT_VERSION_BUGFIX src/base/version.h.in | cut -d' ' -f3`
  local _build=`grep -m 1 QBT_VERSION_BUILD src/base/version.h.in | cut -d' ' -f3`
  local _status=`grep -m 1 QBT_VERSION_STATUS src/base/version.h.in | cut -d' ' -f3 | sed 's/"//g'`
  local _cmake_ver=`printf "${_major}.${_minor}.${_bugfix}"`

  [[ "${_build}" -ne 0 ]] && _cmake_ver=`printf "${_cmake_ver}.${_build}"`
  [[ -n "${_status}" ]] && _cmake_ver=`printf "${_cmake_ver}${_status}"`

  # cutting off 'release-' prefix that presents in the git tag
  local _git_ver=`git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'`
  local _git_tag=`git describe --tags --abbrev=0 | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'`

  printf "${_git_ver/$_git_tag/$_cmake_ver}"
}

build() {
  cmake -B build -S $pkgbase \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT6=ON
  cmake --build build

  cmake -B build-nox -S $pkgbase \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT6=ON \
    -DGUI=OFF \
    -DSYSTEMD=ON
  cmake --build build-nox
}

package_qbittorrent-git() {
  pkgdesc='An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar'
  pkgdesc+=' (git version)'
  depends+=(qt6-svg hicolor-icon-theme)
  conflicts=('qbittorrent')
  provides=('qbittorrent')

  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgbase/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_qbittorrent-nox-git() {
  pkgdesc='An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar, w/o gui'
  pkgdesc+=' (git version)'
  conflicts=('qbittorrent-nox')
  provides=('qbittorrent-nox')

  DESTDIR="$pkgdir" cmake --install build-nox
  install -Dm644 $pkgbase/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
