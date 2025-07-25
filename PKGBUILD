# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=texinfo-git
pkgver=7.2.r1318.gbaaa55ce4d
pkgrel=1
epoch=1
pkgdesc="GNU documentation system for on-line information and printed output"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/texinfo/"
license=('GPL-3.0-or-later')
depends=('ncurses' 'gzip' 'perl' 'sh')
makedepends=('git' 'help2man' 'gperf')
provides=('texinfo')
conflicts=('texinfo')
source=("$pkgname::git+https://git.savannah.gnu.org/git/texinfo.git"
	texinfo-install.hook
	texinfo-remove.hook)
sha256sums=('SKIP'
            'beb0ff50bd8e8ca1d6e1c01e6a50352f9d25937c62822cf767a7b3d8f7374a9d'
            '913ca8aac84386399b0a83ed0f6b04b5e6322da62f5c1d7ed31e1050ed37c1a9')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/texinfo-//;s/-/.r/;s/-/./g'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

check() {
  make -C $pkgname check
}

package() {
  make -C $pkgname DESTDIR="$pkgdir/" install
  install -Dm644 texinfo-{install,remove}.hook -t "$pkgdir"/usr/share/libalpm/hooks/
}
