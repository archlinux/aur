# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

_pkgname=librime
pkgname=$_pkgname-git
pkgver=1.5.3.r32.g0f3d0df0
pkgrel=1
pkgdesc="Rime input method engine with plugins"
arch=('i686' 'x86_64')
url="http://rime.im/"
license=('GPL3')
depends=('boost-libs' 'opencc' 'yaml-cpp' 'leveldb' 'google-glog' 'marisa' 'lua')
optdepends=('rime-data: Rime schema repository from plum')
makedepends=('cmake' 'boost' 'git' 'gtest')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/rime/librime.git"
        "git+https://github.com/lotem/librime-octagram"
        "git+https://github.com/rime/librime-charcode"
        "git+https://github.com/hchunhui/librime-lua")
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd $_pkgname
  sed -i 's/(BOOST_COMPONENTS filesystem regex system)/(BOOST_COMPONENTS filesystem regex system locale)/' CMakeLists.txt
  cd plugins
  rm -rf librime-*
  ln -sf ../../librime-* .
}

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^rime-//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_MERGED_PLUGINS=on
  cmake --build build
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
