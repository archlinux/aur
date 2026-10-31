# Maintainer: Jingrong Chen <crazyboycjr at gmail dot com>
#
# The repository's packaging/arch/PKGBUILD builds its working tree with the
# same dependencies and package(); keep the two alike. To release:
#   1. with the repository public, push the tag v$pkgver to
#      github.com/crazyboycjr/rxcom, and set pkgver here and pkgrel=1;
#   2. updpkgsums, which puts the tarball's sha256 in place of SKIP;
#   3. makepkg --printsrcinfo > .SRCINFO;
#   4. makepkg -f, a test build whose check() runs the tests, and
#      namcap PKGBUILD rxcom-*.pkg.tar.*;
#   5. git commit -am "rxcom $pkgver", and git push.
pkgname=rxcom
pkgver=0.3.0
pkgrel=1
pkgdesc='X11 compositor with a full-desktop zoom'
arch=('x86_64')
url='https://github.com/crazyboycjr/rxcom'
license=('MIT')
depends=('glibc' 'libgcc' 'libxcb')
optdepends=('libglvnd: the experimental GL presenter'
            'libx11: the experimental GL presenter'
            'vulkan-icd-loader: the experimental Vulkan presenter')
makedepends=('cargo' 'shaderc')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --lib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rxcom -t "$pkgdir/usr/bin/"
  install -Dm644 README.md DESIGN.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
