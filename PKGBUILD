# Maintainer: Pavel Dobiáš <mail at paveldobias dot eu>

pkgname=sigrun
pkgver=0.1.1
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
  '775b90bf21f7580da2c6c12aa5c625059c0708b660a5d969534ad33c22f20525'
)

build() {
  cd "$srcdir/$pkgname"

  rustup update
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
