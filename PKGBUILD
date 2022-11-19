# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=numen
pkgver=0.3
pkgrel=1
pkgdesc="Voice control for handsfree computing"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~geb/numen"
license=('GPL3')
depends=('alsa-utils' 'dmenu' 'dotool' 'vosk-api')
makedepends=('go>=1.19' 'gcc' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	 "numen.install")
sha512sums=('571d041d6b42e7b3b31ca2c315dd4db1ca11dfe66c7719130f7aa3768e63538acffd6b45a88f3fc40aac7db802cf9214a4fa0d0496d317d242005203140c66b2'
            'd48b7b2cc8d02699118d79e7d2f2e263afcb6da151e4792a7e52e54f1ab029b28c190f4f8f1091183de1b79d7841fcb99c7e32b6592efaa8ffe09ddbbb7bdf3a')

build() {
  cd "$pkgname-$pkgver"

  patch --strip=1 < hardcoded-geoclue-lib-path.patch
}

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
  install "wrapper" "$pkgdir/usr/local/bin/numen"
  install "displaying" "$pkgdir/usr/local/bin/"

  # Install default phrases
  mkdir -p "$pkgdir/etc/numen/phrases"
  install phrases/* "$pkgdir/etc/numen/phrases/"

  # Install manpage
  mkdir -p "$pkgdir/usr/share/man/man1"
  install "numen.1" "$pkgdir/usr/share/man/man1/"

  # Add udev rules
  install=numen.install
}

