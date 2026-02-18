# Maintainer: Julius Michaelis <gitter@liftm.de.de>
# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=scaphandre
pkgver=1.0.2
pkgrel=1
pkgdesc="Energy consumption metrology agent"
arch=('x86_64')
url="https://github.com/hubblo-org/scaphandre/"
license=(Apache-2.0)
depends=('gcc-libs' 'zlib' 'openssl')
makedepends=('rust')
options=('!lto')
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/hubblo-org/scaphandre/archive/v${pkgver}.tar.gz
  systemd-service conf scaphandre.sysusers
)
sha512sums=(
  0a568091027182d413334e11936a1e69c3be200f4b369ed83693912798af4b404d8009e478a41579de5fcf6a7982683b782efbd22dc50ff1345b99799fd92e73
  SKIP SKIP SKIP
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  echo >>Cargo.toml '
  [profile.aur]
  inherits = "release"
  codegen-units = 1'
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --profile aur --no-default-features --features prometheus,json,containers
}

package() {
  install -Dm0644 systemd-service "$pkgdir"/usr/lib/systemd/system/scaphandre.service
  install -Dm0644 conf "$pkgdir"/etc/conf.d/scaphandre
  install -Dm0644 scaphandre.sysusers "$pkgdir"/usr/lib/sysusers.d/scaphandre.conf

  cd "$srcdir/$pkgname-$pkgver"

  install -Dm0755 target/aur/scaphandre "$pkgdir"/usr/bin/scaphandre
  install -Dm0644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
