# Maintainer: Julius Michaelis <gitter@liftm.de.de>
# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=scaphandre
pkgver=0.5.0
pkgrel=2
pkgdesc="Electrical power consumption metrology agent"
arch=('x86_64')
url="https://github.com/hubblo-org/scaphandre/"
license=(Apache)
depends=('gcc-libs' 'zlib' 'openssl')
makedepends=('rust')
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/hubblo-org/scaphandre/archive/v${pkgver}.tar.gz
  systemd-service
  conf
)
sha512sums=(
  'd6ad365a07d2270f47ee37e05e618c12d8ea66c1f1d8c2e9cab59a5b1790ec44af031729a0fe3c59f8fa5087b457dffe78681d70bc61a9228ff562e6c01af2a9'
  SKIP SKIP
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  echo >>Cargo.toml '
  [profile.aur]
  inherits = "release"
  lto = true
  codegen-units = 1'
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --profile aur
}

package() {
  install -Dm0644 systemd-service "$pkgdir"/usr/lib/systemd/system/scaphandre.service
  install -Dm0644 conf "$pkgdir"/etc/conf.d/scaphandre

  cd "$srcdir/$pkgname-$pkgver"

  install -Dm0755 target/aur/scaphandre "$pkgdir"/usr/bin/scaphandre
  install -Dm0644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
