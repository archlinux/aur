# Maintainer: Tobiichi Origuchi <Tobiichi-Origuchi@users.noreply.github.com>

pkgname=greetd-tuigreety-bin
pkgver=0.10.3
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
sha256sums=('8f83aee7874aab5d06981a1d1cd05df906368a79dbca90d157a33a2f023b67d3')
sha256sums_x86_64=('bc468a61104a7301427c7397ee162e1ee74f265521a1c7733700254cc55cff62')
sha256sums_aarch64=('2ea4f85879953bd62f778694f12708a0e35265902e929aadb9be5d1c1e506611')
sha256sums_armv7h=('9d40e24c84ef56e1e5540081babcfd68f32f3017230859b804380e7b71c66af4')
sha256sums_i686=('35e2dacba5c80abbf2a13e598d1132697babfea6b33233ad0a5d6b9527f3f1a6')

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
