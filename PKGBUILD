# Maintainer: Edmund Lodewijks <edmund [AT] proteamail [DOT] com>

pkgname=calendula
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI to manage calendars"
arch=('x86_64')
url="https://github.com/pimalaya/calendula"
license=('AGPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        'readme-doctests.patch')
b2sums=('fab686f32d9c8f726b4082cc062c6147d671a0d856c5631d60d269b3d241160bfce8df5f9025addc097babe778892f6deaae2d280c44411c3f75b4aade7bb7b2'
        'e22ab558075c085e88c7e6da79a2ba77f11a4dc50f3e7d9a2f30b631ffbeb607fac4027a0fc231fcb8ab0ed2604025d16658629c7e0ad8587b27ef3422f53998')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i ../readme-doctests.patch
  cargo fetch --locked --target "$(rustc --print host-tuple)"
  mkdir -p {completions,man}
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  cargo build --frozen --release
  target/release/$pkgname completions bash fish zsh -d completions/
  target/release/$pkgname manuals man/
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 "completions/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm 644 "completions/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completions/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  find man/ -type f -exec install -Dm 644 -t "$pkgdir/usr/share/man/man1" {} \;
}

# vim:set ts=2 sw=2 et:
