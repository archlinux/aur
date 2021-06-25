# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Meta Mantra <m3tamantra at gmail dot com>
# Contributor: DrZaius <lou at fakeoutdoorsman dot com>
# Contributor: Adam Wolk <netprobe at gmail dot com>

pkgname=scalpel-git
pkgver=r31.35e1367
pkgrel=1
pkgdesc="Recover files based on their headers, footers and internal data structures. This program is based on Foremost."
arch=('x86_64')
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
  sed -i 's|#define\s*SCALPEL_DEFAULT_CONFIG_FILE\s.*"scalpel.conf"|#define SCALPEL_DEFAULT_CONFIG_FILE "/etc/scalpel/scalpel.conf"|' src/scalpel.h
}

build() {
  cd $pkgname
  ./bootstrap
  ./configure --with-pic --prefix=/usr CXXFLAGS="${CXXFLAGS} --std=c++14"
  make
}

package() {
  cd $pkgname
  install -Dm644 scalpel.conf -t "$pkgdir/etc/scalpel"
  make DESTDIR="$pkgdir" install
}

