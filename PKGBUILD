# Maintainer: Julius Michaelis <gitter@liftm.de.de>
# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=scaphandre
pkgver=1.0.0
pkgrel=1
pkgdesc="Energy consumption metrology agent"
arch=('x86_64')
url="https://github.com/hubblo-org/scaphandre/"
license=(Apache)
depends=('gcc-libs' 'zlib' 'openssl')
makedepends=('rust')
options=('!lto')
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/hubblo-org/scaphandre/archive/v${pkgver}.tar.gz
  systemd-service conf version-fix.diff
)
sha512sums=(
  9da49f07dae12e874a9aa7d8b411ab11a7c1bce61eefcd49a9a860d37412584b1452f9cf579b05c5e4a56d39b704bfae5ba5e45d0fc991bafced56c0aaef6032
  SKIP SKIP SKIP
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 <"$OLDPWD/version-fix.diff"
  echo >>Cargo.toml '
  [profile.aur]
  inherits = "release"
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
