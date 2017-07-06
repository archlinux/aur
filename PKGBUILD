# Contributor: Jakob Gruber <jakob.gruber@gmail.com>
# Maintainer: Reihar <reihar@necronomicon.fr>

pkgname=stone-soup-ncurses
_majorver=0.20
pkgver=${_majorver}.1
pkgrel=1
pkgdesc='Open-source, single-player, role-playing roguelike game of exploration and treasure-hunting (ncurses-only)'
arch=('i686' 'x86_64')
url='http://crawl.develz.org/'
depends=('lua51' 'ncurses' 'sqlite' 'ttf-dejavu')
makedepends=('bison' 'flex')
conflicts=('crawl' 'stone-soup' 'stone-soup-tiles' 'stone-soup-git')
license=('custom')
install=stone-soup-ncurses.install
source=("http://crawl.develz.org/release/${_majorver}/stone_soup-${pkgver}-nodeps.tar.xz")
sha256sums=('72e92513e5a34c87abc80efef48569d85f09e554c0d05fefb1b4e483cce94f31')

prepare() {
  cd "$srcdir"
  cd "stone_soup-$pkgver/source"
  
  # git tarball weirdness
  echo "$pkgver" > util/release_ver
  
  # adjust makefile to use /usr/bin, owner root:root,
  # disable setgid on executable

  sed -i 's|bin_prefix    := bin|bin_prefix    := usr/bin|' Makefile
  sed -i 's/INSTALL_UGRP := games:games/INSTALL_UGRP := root:root/' Makefile
  sed -i 's|MCHMOD := 2755|MCHMOD := 755|' Makefile
}

package() {
  cd "$srcdir"
  cd "stone_soup-$pkgver/source"

  #Building the console version
  make DESTDIR="${pkgdir}" \
       SAVEDIR="~/.crawl/" \
       DATADIR="/usr/share/${pkgname}/data" \
       USE_UNICODE=y \
       install

  
  # install crawl license
  install -D -m644 ../licence.txt \
          "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

}
