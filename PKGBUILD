# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Yvan <madridista40@orange.fr>

pkgname=libfat-ogc-git
pkgver=1.0.14.r0.g1e06c67
pkgrel=1
pkgdesc="Library for acessing FAT filesystems from Nintendo Gamecube/Wii homebrew (development version)"
arch=('any')
url="http://www.devkitpro.org/"
license=('custom')
options=(!strip staticlibs)
depends=('devkitppc' 'libogc-git')
makedepends=('git')
conflicts=('libfat-ogc' 'libfat-ogc-svn') # the -svn is a hack to support transition, can be removed later
provides=('libfat-ogc')
source=("git+https://github.com/devkitPro/libfat.git")
md5sums=('SKIP')

pkgver() {
  cd libfat
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd libfat

  source /etc/profile.d/devkitppc.sh
  make include/libfatversion.h
  make ogc-release
}

package() {
  cd libfat
  export DEVKITPRO="$pkgdir"/opt/devkitpro

  install -d "$DEVKITPRO"/libogc/{lib/{cube,wii},include}
  make ogc-install
  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  head -n 30 include/fat.h > "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
