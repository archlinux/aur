# Maintainer: Phillip Smith <pkgbuild@phs.id.au>

# I AM ONLY THE PACKAGER, NOT THE DEVELOPER
# Please ask support questions about this software in one of:
#   1) The AUR comments; OR
#   2) Upstream forums/maillist etc; OR
#   3) The ArchLinux forums
# I do not always know enough about the software itself, or don't have the time to promptly respond to direct emails.
# If you have found a problem with the package/PKGBUILD (as opposed to the software) then please do post an AUR comment.

pkgname=rotz
pkgver=1.2.1
pkgrel=1
pkgdesc="Fully cross platform dotfile manager written in rust."
arch=('x86_64')
url="https://volllly.github.io/rotz/"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
        'https://github.com/volllly/rotz/blob/main/LICENSE')
sha256sums=('6039d42b3d3edfd10a2645d659b802030bb1f8e19bf14e7db732c15becc2acbf'
            'c67173e306054f6a0eb14509b2280dd12de15a03e5f290dfc4fd746f045efa67')

options=(!lto)

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir"/$pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
