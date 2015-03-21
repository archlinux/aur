# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Ahn, Seung-rye <seungrye@gmail.com>

pkgname=freesynd-svn
pkgver=0.7.1.r972
pkgrel=1
pkgdesc="A free, cross-platform reimplementation of the classic Bullfrog game 'Syndicate' (development version)"
url="http://freesynd.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('subversion' 'sdl_mixer' 'sdl_image')
makedepends=('cmake')
provides=("${pkgname%-*}=${pkgver%.r*}")
conflicts=("${pkgname%-*}")
source=($pkgname::"svn+http://svn.code.sf.net/p/freesynd/code/freesynd/trunk")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  # hack to get last released version
  _ver=$(grep -m1 -A5 'History' NEWS | sed -n -r 's/.*v([0-9]\.[0-9]\.[0-9]).*/\1/p')
  _rev=$(svnversion)
  printf "%s.r%s" "$_ver" "${_rev//[[:alpha:]]}"
}

prepare() {
  cd $pkgname

  rm -rf build
  mkdir build

  # small fix for a debug leftover
  sed '/if (p->getDebugID() == 17)/{N;d;}' -i src/missionmanager.cpp
}

build() {
  cd $pkgname/build

  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C $pkgname/build DESTDIR="$pkgdir/" install
}
