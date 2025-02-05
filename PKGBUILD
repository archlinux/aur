# Maintainer: TestingPlant <testingplant AT duck DOT com>

_repo=cli
pkgname=bounty-git
pkgver=1.0.14.r0.g3f7875a
pkgrel=1
pkgdesc='A CLI tool for managing bounties on BountyBot'
url="https://github.com/ghbountybot/$_repo"
license=(MIT)
makedepends=('cargo' 'git')
depends=('gcc-libs' 'zlib' 'glibc' 'openssl')
provides=("bounty")
conflicts=("bounty")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
options=(!lto)
source=("git+https://github.com/ghbountybot/$_repo.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_repo"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_repo"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_repo"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_repo"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_repo"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/bounty"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
