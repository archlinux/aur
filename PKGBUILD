# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=numen
pkgver=0.123
pkgrel=1
pkgdesc="Voice control for handsfree computing"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~geb/numen"
license=('GPL3')
depends=('alsa-utils' 'dmenu' 'dotool' 'vosk-api')
makedepends=('go>=1.19' 'gcc' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('be473e313afe4236ee259c3ca7ae1f715198905aafddb05b04a78426fb2ede005968436203dbbf6b9fafedf6f67028d3e17b1d7474558b4049144b5ddb14f5d1')

build() {
  cd "$pkgname-$pkgver"

  go build -ldflags "-X 'main.Version=$pkgver'"
  ln -sf /usr/share/vosk-models/small-en-us model
  scdoc < doc/numen.1.scd > numen.1
}

package() {
  cd "$pkgname-$pkgver"

  # Install binaries
  mkdir -p "$pkgdir/usr/local/bin"
  install numen numenc "$pkgdir/usr/local/bin/"

  # Install scripts used in default phrases
  mkdir -p "$pkgdir/etc/numen/scripts/"
  install scripts/* "$pkgdir/etc/numen/scripts/"

  # Install default phrases
  mkdir -p "$pkgdir/etc/numen/phrases/"
  install phrases/* "$pkgdir/etc/numen/phrases/"

  # Install manpage
  mkdir -p "$pkgdir/usr/share/man/man1"
  install "numen.1" "$pkgdir/usr/share/man/man1/"
}

