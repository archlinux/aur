# Maintainer: Al1nuX
pkgname=thinkpoint
# GitHub names its archives after the repository, which is capitalised, so the
# extracted directory is not $pkgname-$pkgver.
_repo=ThinkPoint
pkgver=0.4.0
pkgrel=1
pkgdesc="TUI for TrackPoint tuning, pointer button maps and libinput properties"
arch=('x86_64' 'aarch64')
url="https://github.com/CryptLabs/ThinkPoint"
license=('MIT')
# Declared rather than left to be pulled in transitively, which is what namcap
# asks for and what the Rust packages in the official repositories do.
depends=('gcc-libs' 'glibc')
optdepends=(
  'xorg-xinput: button maps, libinput properties, the detector and the meter'
  'sudo: writing sysfs values and the udev rule'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1a0119d71aebf92b74e4cc038d16ff0b1b032de962c72ed5f65d3d3fd2fba361')

prepare() {
  cd "$_repo-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_repo-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_repo-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_repo-$pkgver"
  install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
