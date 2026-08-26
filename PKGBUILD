# Maintainer: Pavel Dobiáš <mail at paveldobias dot eu>

pkgname=sigrun
pkgver=0.1.2
pkgrel=1
pkgdesc='A lightweight daemon that runs commands in response to D-Bus events.'
arch=('x86_64')
url='https://codeberg.org/cryptomilk/sigrun/'
license=('GPL-2.1')
depends=('dbus' 'gcc-libs' 'glibc')
makedepends=('cargo' 'pandoc')
provides=("${pkgname}")
conflicts=(
  "${pkgname}"
  "${pkgname}-bin"
)

source=(
  "https://codeberg.org/cryptomilk/$pkgname/archive/v$pkgver.zip"
)
sha256sums=(
  'c15b6a98657721675da03bfe6b9632ea273d1c719810c3d9867b9125c64c8e7f'
)

build() {
  cd "$srcdir/$pkgname"

  command -v rustup && rustup update
  cargo build --release

  pandoc docs/sigrun.1.md -s -t man -o sigrun.1
  pandoc docs/sigrun.toml.5.md -s -t man -o sigrun.toml.5
  gzip -9 sigrun.1
  gzip -9 sigrun.toml.5
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 target/release/sigrun "$pkgdir/usr/bin/sigrun"

  install -Dm644 sigrun.1.gz "$pkgdir/usr/share/man/man1/sigrun.1.gz"
  install -Dm644 sigrun.toml.5.gz "$pkgdir/usr/share/man/man5/sigrun.toml.5.gz"
}
