# Maintainer: Tobiichi Origuchi <Tobiichi-Origuchi@users.noreply.github.com>

pkgname=tuigreety
pkgver=0.10.0
pkgrel=1
pkgdesc='A minimal, configurable console greeter for greetd'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://github.com/Tobiichi-Origuchi/tuigreety'
license=('GPL-3.0-or-later')
provides=('greetd-greeter')
conflicts=('greetd-tuigreet' 'tuigreety-bin' 'tuigreety-git')
depends=('glibc' 'greetd' 'libgcc' 'systemd')
makedepends=('rustup' 'scdoc')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  'tuigreet.conf'
)
sha256sums=('765368fd34f92648144881a91923b6fc670a4bad0000678d5052eff58c1c9a7e'
            '8f83aee7874aab5d06981a1d1cd05df906368a79dbca90d157a33a2f023b67d3')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
  scdoc < contrib/man/tuigreet-1.scd > tuigreet.1
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/tuigreet "$pkgdir/usr/bin/tuigreet"
  install -Dm644 tuigreet.1 "$pkgdir/usr/share/man/man1/tuigreet.1"
  install -Dm644 contrib/tuigreet.toml "$pkgdir/usr/share/doc/$pkgname/examples/config.toml"
  install -Dm644 contrib/text.conf "$pkgdir/usr/share/doc/$pkgname/examples/text.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/tuigreet.conf" "$pkgdir/usr/lib/tmpfiles.d/tuigreet.conf"
}
