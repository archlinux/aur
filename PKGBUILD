# Maintainer: Tobiichi Origuchi <Tobiichi-Origuchi@users.noreply.github.com>

pkgname=greetd-tuigreety
pkgver=0.11.0
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
sha256sums=('5413c23d00695ad0f5994ffad65c998678e8dd0d2b39c364855e3eb193b7604d'
            'fdfdff4cac513d00bf5babb3842934e1dc7887e5ef97e31cb2e1c91b45945651')

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
