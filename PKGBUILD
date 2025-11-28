# Maintainer: Stipe Kotarac <stipe@kotarac.net>

pkgname=schedtoold-git
pkgver=r5.c6c6e15
pkgrel=1
pkgdesc='daemon for automatically adjusting process scheduling'
arch=('x86_64')
license=(GPL-2.0-only)
url='https://github.com/kotarac/schedtoold'
conflicts=('schedtoold')
depends=('schedtool')
makedepends=('cargo')
source=('schedtoold::git+https://github.com/kotarac/schedtoold.git#branch=master')
sha512sums=('SKIP')

pkgver() {
  cd schedtoold/
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd schedtoold/
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd schedtoold/
  cargo build --release --frozen
}

check() {
  cd schedtoold/
  cargo test --frozen
}

package() {
  cd schedtoold/
  install -D -m755 -s target/release/schedtoold $pkgdir/usr/bin/schedtoold
  install -D -m644 schedtoold.service $pkgdir/usr/lib/systemd/system/schedtoold.service
  install -D -m644 schedtoold.ron $pkgdir/etc/schedtoold.ron
}
