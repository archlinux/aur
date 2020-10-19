# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Meta Mantra <m3tamantra at gmail dot com>
# Contributor: DrZaius <lou at fakeoutdoorsman dot com>
# Contributor: Adam Wolk <netprobe at gmail dot com>

pkgname=scalpel-git
pkgver=r24.47815c2
pkgrel=1
pkgdesc="Recover files based on their headers, footers and internal data structures. This program is based on Foremost."
arch=('i686' 'x86_64')
url="https://github.com/sleuthkit/scalpel"
license=('Apache')
depends=('tre')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+$url.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  sed -i 's|#define[ \t]*SCALPEL_DEFAULT_CONFIG_FILE[ \t]*"scalpel.conf"|#define SCALPEL_DEFAULT_CONFIG_FILE "/etc/scalpel/scalpel.conf"|' src/scalpel.h 
}

build() {
  cd $pkgname
  ./bootstrap
  ./configure --with-pic --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 scalpel.conf "$pkgdir/etc/scalpel/scalpel.conf"
}

