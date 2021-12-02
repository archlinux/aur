# Maintainer: lsdaniel <lsdaniel zero one at gee mail dot com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Francois Boulogne <fboulogne at april.org>

pkgname=safe-rm
pkgver=1.1.0
pkgrel=3
pkgdesc="A tool intended to prevent the accidental deletion of important files"
arch=(any)
url='https://launchpad.net/safe-rm'
license=(GPL3)
depends=()
makedepends=(cargo)
backup=(etc/safe-rm.conf)
source=(https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz{,.asc}
        safe-rm.conf
	safe-rm.sh)
sha256sums=('a1c916894c5b70e02a6ec6c33abbb2c3b3827464cffd4baffd47ffb69a56a1e0'
            'SKIP'
            'd016ccf8e5dcd517bacaae1bb71509932bae813b451da33850347aba7e481739'
            '6d5abd6439addd41ee78f1a3ba01648ec656dbd54cfeb78e20d386ac337d6ae9')
validpgpkeys=(8C470B2A0B31568E110D432516281F2E007C98D1) # Francois Marier <fmarier@gmail.com>


prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked
}

build() {
  cd $pkgname-$pkgver
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features
}

package() {
  install -Dm 644 $srcdir/safe-rm.conf -t "$pkgdir/etc"
  install -Dm 755 $srcdir/safe-rm.sh -t "$pkgdir/etc/profile.d"
  cd $pkgname-$pkgver
  install -Dm 755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 safe-rm.1 -t "$pkgdir/usr/share/man/man1"
  #create symlink to take precedence over rm in PATH search
  install -dm 755 "$pkgdir/usr/lib/safe-rm"
  ln -sf /usr/bin/safe-rm "$pkgdir/usr/lib/safe-rm/rm"
}

check() {
  cd $pkgname-$pkgver
  RUSTUP_TOOLCHAIN=stable cargo test --locked
}
