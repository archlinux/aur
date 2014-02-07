# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Yvan <madridista40@orange.fr>

pkgname=libfat-ogc-git
pkgver=1.0.11.r3.g7d4e422
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
source=("git+http://git.code.sf.net/p/devkitpro/libfat")
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
