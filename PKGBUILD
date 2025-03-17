# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=icann-rdap
pkgver=0.0.21
pkgrel=1
#epoch=
pkgdesc='ICANN implementation of the Registry Data Access Protocol (RDAP)'
arch=('aarch64' 'x86_64')
url='https://github.com/icann/icann-rdap'
license=('Apache-2.0 OR MIT')  # SPDX-License-Identifier: Apache-2.0 OR MIT
#groups=()
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
#checkdepends=()
#optdepends=()
provides=('rdap')
conflicts=('openrdap-client' "${provides[@]}")
#replaces=()
#backup=()
options=('!lto')
#install=
#changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
#validpgpkeys=()

build() {
  cd "$pkgname-$pkgver"

  # https://wiki.archlinux.org/title/Rust_package_guidelines
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix $srcdir=src"

  # Linking may fail, see e.g.:
  # 🔗 https://github.com/briansmith/ring/issues/2378
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  # Binaries
  install -vDm0755 -t "$pkgdir/usr/bin" \
    target/release/rdap{,-srv{,-{data,store,test-data}},-test}

  # READMEs
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  for _xxx in cli srv; do
    install -vDm0644 "icann-rdap-$_xxx/README.md" \
       "$pkgdir/usr/share/doc/$pkgname/README-$_xxx.md"
  done

  # Licenses (only the MIT license is actually required here)
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE-*
}

sha256sums=(
  '252b112776fae0160f539e20b70ff24b6f2bea7551c9476ccd6f7651c7b861d0'
)
b2sums=(
  '12072fe48c0dd39411e7883a59a2de24b3a2c52f64da066df1cbeb15264145f7a685db366453a71e45947bf0b5eded141d66e4a436cc11423e18aed57e937be1'
)

# eof
