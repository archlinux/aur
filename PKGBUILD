# Maintainer: yantene <contact at yantene dot net>

pkgname=hengband-git
_gitname=hengband
pkgver=v2.1.4.r376.g02901956
pkgrel=1
pkgdesc="A variant of angband"
arch=('i686' 'x86_64')
url="http://hengband.osdn.jp"
license=('unknown')
depends=('ncurses')
source=(git://git.osdn.net/gitroot/hengband/hengband.git)
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --tags --always | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_gitname
  ./bootstrap
}

build() {
  cd $_gitname

  ./configure --with-libpath=/usr/lib/hengband/
  make
}

package() {
  cd $_gitname

  install -d "${pkgdir}/usr/lib"

  install -D -m755 "src/hengband" "${pkgdir}/usr/bin/hengband"
  cp -R ./lib/ "${pkgdir}/usr/lib/hengband"
  chmod -R 775 "${pkgdir}/usr/lib/hengband"
  chown -R root:users "${pkgdir}/usr/lib/hengband"

# removing unneeded files
  find "${pkgdir}" -iname delete.me -delete
  find "${pkgdir}" -iname Makefile -delete
  find "${pkgdir}" -iname Makefile.am -delete
  find "${pkgdir}" -iname Makefile.in -delete
}
