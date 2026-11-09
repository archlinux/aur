# Maintainer: Chris <goabonga@pm.me>

pkgname=bluetooth-gpd
pkgver=0.1.1
pkgrel=1
pkgdesc='Linux Bluetooth manager with a daemon, a terminal interface, SBC audio and an ALSA plugin'
arch=('x86_64')
url='https://github.com/goabonga/bluetooth-gpd'
license=('MIT')
depends=('alsa-lib'
         'ctui'
         'glibc'
         'ncurses'
         'sbc')
makedepends=('pkgconf')
options=('!debug')
backup=('etc/alsa/conf.d/99-bluetooth.conf')
install=bluetooth-gpd.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1d91fbb7e122c4c874200d6868747424d910b48b6dd5dc66c87c2b0ff08f01bc')

build() {
  cd "$pkgname-$pkgver"
  make WERROR= PREFIX=/usr
}

check() {
  cd "$pkgname-$pkgver"
  # -Werror and the sanitizers are development options of upstream: a new compiler
  # warning must not break the package
  make WERROR= SANITIZE= test
}

package() {
  cd "$pkgname-$pkgver"
  make WERROR= DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
