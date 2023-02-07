# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=numen
pkgver=0.6
pkgrel=1
pkgdesc="Voice control for handsfree computing"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~geb/numen"
license=('GPL3')
depends=('alsa-utils' 'dmenu' 'dotool' 'vosk-api')
makedepends=('go>=1.19' 'gcc' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('cc2b52310e49f9f3a2cc078d94d960e5eec7f693fb6569c8200d9b81d3834402a7ded182bb76b40fd46cecd0954bb9b19d36473c0e59207ca78c2b201319be4c')

build() {
  cd "$pkgname-$pkgver"

  go build speech.go
  ln -sf /usr/share/vosk-models/small-en-us model
  scdoc < doc/numen.1.scd > numen.1
}

package() {
  cd "$pkgname-$pkgver"

  # Install executables for internal use
  mkdir -p "$pkgdir/usr/libexec/numen/handlers"
  install "awk" "instructor" "numen" "record" "scribe" "speech" "$pkgdir/usr/libexec/numen/"
  install handlers/* "$pkgdir/usr/libexec/numen/handlers/"

  # Install binaries
  mkdir -p "$pkgdir/usr/local/bin"
  install "numenc" "$pkgdir/usr/local/bin/"
  install "wrapper" "$pkgdir/usr/local/bin/numen"

  # Install scripts used in default phrases
  mkdir -p "$pkgdir/usr/libexec/numen/phrases"
  install phrasescripts/* "$pkgdir/usr/libexec/numen/phrases/"

  # Install default phrases
  mkdir -p "$pkgdir/etc/numen/phrases/"
  install phrases/* "$pkgdir/etc/numen/phrases/"

  # Install manpage
  mkdir -p "$pkgdir/usr/share/man/man1"
  install "numen.1" "$pkgdir/usr/share/man/man1/"
}

