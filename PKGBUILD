# Maintainer: TestingPlant <testingplant AT duck DOT com>

_repo=cli
pkgname=bounty
pkgver=1.0.14
pkgrel=1
pkgdesc='A CLI tool for managing bounties on BountyBot'
url="https://github.com/ghbountybot/$_repo"
license=(MIT)
makedepends=('cargo' 'git')
depends=('gcc-libs' 'zlib' 'glibc' 'openssl')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
options=(!lto)
source=("$_repo-$pkgver.tar.gz::https://github.com/ghbountybot/$_repo/archive/v$pkgver.tar.gz")
sha512sums=('5da99737ab88ee9f8148accf0e6c96aa0b4fd84bc340d750c1a31685da149baa9d8793f13e9793db94f54c8345a920c6237c574eed2ef181078109cb74c746f6')

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
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/bounty"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
