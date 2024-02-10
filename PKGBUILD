# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=numen
pkgver=0.7
pkgrel=2
pkgdesc="Voice control for handsfree computing"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~geb/numen"
license=('GPL3')
depends=('alsa-utils' 'dmenu' 'dotool' 'vosk-api')
makedepends=('go>=1.19' 'gcc' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('99dc883f7de187e241353d4fa5a1deb84cb24c32ac8cdc9138daffc7747c020b66428f576401bda2f139a3c022fd15c4ff4df1b8c9b87a09bc829b50035fc57b')

build() {
  cd "$pkgname-$pkgver"

  go build -ldflags "-X 'main.Version=$pkgver'"
  ln -sf /usr/share/vosk-models/small-en-us model
  scdoc < doc/numen.1.scd > numen.1
}

package() {
  cd "$pkgname-$pkgver"

  # Install binaries
  mkdir -p "$pkgdir/usr/bin"
  install numen numenc "$pkgdir/usr/bin/"

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

