# Maintainer: Victor Golovanenko <drygdryg2014 at yandex dot com>
pkgname=decrypto-pro-git
_pkgname=decrypto-pro
pkgver=r4.5db36aa
pkgrel=3
pkgdesc='Utility for converting CryptoPro CSP key containers to PEM keys'
arch=(x86_64 i686 pentium4 armv7h aarch64)
url="https://github.com/vitalif/decrypto-pro"
license=(MIT)
depends=(openssl-gost-engine)
makedepends=('git')
source=("$_pkgname::git+${url}.git" LICENSE)
sha256sums=('SKIP'
            '054c982e7d203faf730cc438dedd1d86c1c0c443ba7508f37ceec238187ad971')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  # Patch Makefile to point to gost.so built for OpenSSL v3.x
  sed -r -i 's/\/usr\/lib\/`arch`-linux-gnu\/engines-1\.1\/gost\.so/\/usr\/lib\/engines-3\/gost.so/' "$srcdir/$_pkgname/Makefile"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  install -D -m 755 "$srcdir/$_pkgname/decrypto-pro" "$pkgdir/usr/bin/decrypto-pro"
  install -D -m 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
