# Maintainer: Tobiichi Origuchi <Tobiichi-Origuchi@users.noreply.github.com>

pkgname=greetd-tuigreety-git
pkgver=0.11.1.r0.g0000000
pkgrel=1
pkgdesc='A minimal, configurable console greeter for greetd (development version)'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://github.com/Tobiichi-Origuchi/tuigreety'
license=('GPL-3.0-or-later')
provides=('greetd-greeter' 'greetd-tuigreety' 'tuigreety')
conflicts=('greetd-tuigreet' 'greetd-tuigreety' 'greetd-tuigreety-bin' 'tuigreety' 'tuigreety-bin' 'tuigreety-git')
makedepends=('git' 'rust' 'scdoc')
depends=('glibc' 'libgcc' 'greetd')
backup=('etc/tuigreet/config.toml')
source=('git+https://github.com/Tobiichi-Origuchi/tuigreety.git' 'tuigreet.conf')
sha256sums=('SKIP'
            'fdfdff4cac513d00bf5babb3842934e1dc7887e5ef97e31cb2e1c91b45945651')

pkgver() {
  cd tuigreety
  git describe --long --tags --match '[0-9]*.[0-9]*.[0-9]*' --always | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd tuigreety
  cargo fetch --locked
}

build() {
  cd tuigreety
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
  scdoc < contrib/man/tuigreet-1.scd > tuigreet.1
}

package() {
  cd tuigreety
  install -Dm755 target/release/tuigreet "$pkgdir/usr/bin/tuigreet"
  install -Dm644 tuigreet.1 "$pkgdir/usr/share/man/man1/tuigreet.1"
  install -Dm644 contrib/tuigreet.toml "$pkgdir/etc/tuigreet/config.toml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
  install -Dm644 "$srcdir/tuigreet.conf" "$pkgdir/usr/lib/tmpfiles.d/tuigreet.conf"
}
