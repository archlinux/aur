# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=fbarcalc
pkgver=1.0.1
pkgrel=1
pkgdesc="calculate the maximum account value"
arch=(x86_64)
url=https://github.com/mfinelli/fbarcalc
license=(GPL-3.0-or-later)
makedepends=(cargo)
depends=(glibc libgcc)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz
  ignore-hung-tests.patch)
sha256sums=('19881491d5812da31e9a88733a384d1546bfda3aa61b6160d72a14dd22926bef'
            '9bb87f2d5f3ad4339203c610b50cc4542452ef80d8b9971d78273570a4c18eb5')

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable

  # these tests hang in a chroot for some reason
  patch -p1 -N -i "${srcdir}/ignore-hung-tests.patch"

  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  make
}

check() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
