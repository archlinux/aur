# Maintainer: Tobiichi Origuchi <Tobiichi-Origuchi@users.noreply.github.com>

pkgname=greetd-tuigreety
pkgver=0.10.3
pkgrel=1
_project=tuigreety
pkgdesc='A minimal, configurable console greeter for greetd'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://github.com/Tobiichi-Origuchi/tuigreety'
license=('GPL-3.0-or-later')
provides=('greetd-greeter' 'tuigreety')
conflicts=('greetd-tuigreet' 'greetd-tuigreety-bin' 'greetd-tuigreety-git' 'tuigreety' 'tuigreety-bin' 'tuigreety-git')
makedepends=('rust' 'scdoc')
depends=('glibc' 'libgcc' 'greetd')
backup=('etc/tuigreet/config.toml')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  'tuigreet.conf'
)
sha256sums=('9a5ebc8dd4c5ac843b32b0ffa0f13310920a18fceab0bcf86c45a639b8169b5f'
            '8f83aee7874aab5d06981a1d1cd05df906368a79dbca90d157a33a2f023b67d3')

prepare() {
  cd "$_project-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$_project-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
  scdoc < contrib/man/tuigreet-1.scd > tuigreet.1
}

package() {
  cd "$_project-$pkgver"
  install -Dm755 target/release/tuigreet "$pkgdir/usr/bin/tuigreet"
  install -Dm644 tuigreet.1 "$pkgdir/usr/share/man/man1/tuigreet.1"
  install -Dm644 contrib/tuigreet.toml "$pkgdir/etc/tuigreet/config.toml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
  install -Dm644 "$srcdir/tuigreet.conf" "$pkgdir/usr/lib/tmpfiles.d/tuigreet.conf"
}
