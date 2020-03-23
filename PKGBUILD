# Maintainer: Alejandro Valdes <alejandrovaldes@live.com>

_pkgbase=zombietrackergps
pkgname=zombietrackergps-git
pkgver=0.96.r3.gea87787
pkgrel=1
_ldutils_projects_url="https://gitlab.com/ldutils-projects/"
pkgdesc="GPS track manager for Qt using KDE Marble maps. Currently supports GPX and TCX format import."
arch=('x86_64')
url="${_ldutils_projects_url}zombietrackergps"
license=('GPLv3')
depends=('qt5-base' 'marble-qt' 'qt5-charts' 'qt5-svg')
makedepends=('git' 'findutils')
source=("git+${url}.git"
        "git+${_ldutils_projects_url}ldutils.git"
       "archlinux.patch"
        )
sha256sums=('SKIP'
            'SKIP'
            '8e3e6f27e65dff5f743e722e0a1e00c6f6d6a278cd77c9167ee4463a501a2ea9')

pkgver() {
  cd ${_pkgbase}
  git describe --long --tags | sed 's/^[v-]//;s/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-
}

prepare() {
  #ldutils
  cd $srcdir/ldutils
  mkdir -p $srcdir/buildldutils
  cd $srcdir/buildldutils

  qmake -o Makefile $srcdir/ldutils/ldutils.pro -spec linux-g++
  #we need to build ldutils first
  make install

  #zombietrackergps
  cd $srcdir/$_pkgbase
  patch --forward --strip=1 --input="${srcdir}/archlinux.patch"
  mkdir -p $srcdir/build
  cd $srcdir/build
  qmake -o Makefile $srcdir/$_pkgbase/ZombieTrackerGPS.pro -spec linux-g++
}

build() {
  cd build
  make
}

package() {
  cd build
  mkdir -p ${pkgdir}/usr/share/applications
  INSTALL_ROOT="${pkgdir}" make install
  sed -i "s:Icon=.*:Icon=/usr/share/zombietrackergps/zombietrackergps.png:" ${pkgdir}/usr/share/applications/zombietrackergps.desktop
  #for some reason make install creates some unnecessary folders
  cd ${pkgdir}
  ls | grep -v usr | xargs rm -r
  mv ${srcdir}/build/*.rcc ${pkgdir}/usr/share/zombietrackergps/
}
