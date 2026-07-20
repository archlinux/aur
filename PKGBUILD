# Maintainer: Tobiichi Origuchi <Tobiichi-Origuchi@users.noreply.github.com>

pkgname=greetd-tuigreety-bin
pkgver=0.11.1
pkgrel=1
pkgdesc='A minimal, configurable console greeter for greetd (prebuilt)'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://github.com/Tobiichi-Origuchi/tuigreety'
license=('GPL-3.0-or-later')
provides=('greetd-greeter' "greetd-tuigreety=$pkgver" "tuigreety=$pkgver")
conflicts=('greetd-tuigreet' 'greetd-tuigreety' 'greetd-tuigreety-git' 'tuigreety' 'tuigreety-bin' 'tuigreety-git')
depends=('glibc' 'libgcc' 'greetd')
backup=('etc/tuigreet/config.toml')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/tuigreety-$pkgver-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/$pkgver/tuigreety-$pkgver-aarch64.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7.tar.gz::$url/releases/download/$pkgver/tuigreety-$pkgver-armv7.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/$pkgver/tuigreety-$pkgver-i686.tar.gz")
source=('tuigreet.conf')
sha256sums=('fdfdff4cac513d00bf5babb3842934e1dc7887e5ef97e31cb2e1c91b45945651')
sha256sums_x86_64=('0f3e090e8bdbb7f7b3d8a1dfe3d5969a7d892208e585399c76070a00435b3084')
sha256sums_aarch64=('73c65c57c9d195bc4bb8da35e165076b8f8584faecc0527bfc9b7bd23052b229')
sha256sums_armv7h=('4c240304a250c07e88151593e40e0189698e6ff27a74b141e34bd2b38b31eb01')
sha256sums_i686=('ba9c9627fcfa76365565cd5fe0d15da364be058485c7e747bc420d64967db064')

package() {
  local release_arch="$CARCH"
  [[ $CARCH == armv7h ]] && release_arch=armv7
  cd "tuigreety-$pkgver-$release_arch"

  # Releases through 0.10.2 used an ambiguous prefix-style layout. Keep the
  # fallback while those archives remain useful for local rebuilds.
  local release_prefix=''
  [[ -f usr/bin/tuigreet ]] && release_prefix=usr/

  install -Dm755 "${release_prefix}bin/tuigreet" "$pkgdir/usr/bin/tuigreet"
  install -Dm644 "${release_prefix}share/man/man1/tuigreet.1" "$pkgdir/usr/share/man/man1/tuigreet.1"
  install -Dm644 etc/tuigreet/config.toml "$pkgdir/etc/tuigreet/config.toml"
  if [[ -f ${release_prefix}share/licenses/tuigreety/LICENSE ]]; then
    install -Dm644 "${release_prefix}share/licenses/tuigreety/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  else
    install -Dm644 share/licenses/tuigreet/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
  if [[ -f ${release_prefix}share/licenses/tuigreety/COPYRIGHT ]]; then
    install -Dm644 "${release_prefix}share/licenses/tuigreety/COPYRIGHT" \
      "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
  fi
  install -Dm644 "$srcdir/tuigreet.conf" "$pkgdir/usr/lib/tmpfiles.d/tuigreet.conf"
}
