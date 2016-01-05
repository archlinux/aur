# Maintainer: Philipp Moeller <bootsarehax@gmail.com>
pkgname=emacs-bbdb
pkgver=3.1.2
pkgrel=2
pkgdesc="The Insidious Big Brother Database Version 3"
arch=('any')
url="http://savannah.nongnu.org/projects/bbdb/"
license=(GPL)
depends=(emacs)
makedepends=(texlive-bin)
source=("http://download.savannah.gnu.org/releases/bbdb/bbdb-$pkgver.tar.gz")
md5sums=('b57cbb57ab8d4235517e79011fb52b2f')

build() {
  cd "bbdb-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "bbdb-$pkgver"
  make DESTDIR="$pkgdir/" install
}

INFO_DIR=usr/share/info
INFO_FILES=(bbdb)

post_install() {
  [[ -x usr/bin/install-info ]] || return 0
  for f in ${INFO_FILES[@]}; do
    install-info ${INFO_DIR}/$f.info.gz ${INFO_DIR}/dir 2> /dev/null
  done
}

post_upgrade() {
  post_install $1
}

pre_remove() {
  [[ -x usr/bin/install-info ]] || return 0
  for f in ${INFO_FILES[@]}; do
    install-info --delete ${INFO_DIR}/$f.info.gz ${INFO_DIR}/dir 2> /dev/null
  done
}

