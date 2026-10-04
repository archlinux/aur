# Maintainer: Huang Zhaobin <zhaob1n@foxmail.com>
# SPDX-License-Identifier: 0BSD

pkgname=mirai-server-git
_repo=mirai
pkgver=r380.71088fa
pkgrel=1
pkgdesc='Headless host sharing KataGo with mirai clients over the network'
arch=('x86_64' 'aarch64')
url='https://github.com/zhaob1n/mirai'
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git' 'just')
optdepends=('katago: the engine it serves (katago-opencl, katago-cuda, ...)')
provides=('mirai-server')
conflicts=('mirai-server')
# makepkg's LTO turns the C that ring and zstd-sys build into GCC bitcode, which rust-lld,
# rustc's default linker, cannot read: every C symbol is then undefined at link time.
options=('!lto')
source=("$_repo::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_repo"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_repo"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_repo"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p mirai-server
}

# Not --workspace: the GUI crates need GTK.
check() {
  cd "$_repo"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release -p mirai-core -p mirai-proto -p mirai-engine -p mirai-server
}

package() {
  cd "$_repo"
  DESTDIR="$pkgdir" PREFIX=/usr just install mirai-server
}
