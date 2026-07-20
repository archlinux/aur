# Maintainer: Tobiichi Origuchi <Tobiichi-Origuchi@users.noreply.github.com>

pkgname=greetd-tuigreety-bin
pkgver=0.11.0
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
sha256sums_x86_64=('0f15157dc4c2a5f049ea123aa4a55b1d2bd31665127817e44a1c614fcd2a4786')
sha256sums_aarch64=('22a7ed31a12b71fb1050ca962047535a6127434a85d6e91040c65275b545d52c')
sha256sums_armv7h=('e3845749d39bb2e8e45151f34882f354611484c9518243e0e79df6a92b52a6be')
sha256sums_i686=('fd68063475d059c113b0dff5a0b538cb96919453c8b2daf268f701c9cd2f035e')

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
