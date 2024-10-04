# Maintainer: Levi Zim <rsworktech@outlook.com>

_pkgname=ttyrecall
pkgname=$_pkgname-git
pkgver=0.0.1.alpha.2.r0.g9a38cbf
pkgrel=2
pkgdesc="Recall, but for terminals"
arch=('x86_64')
url="https://github.com/kxxt/ttyrecall"
license=('AGPL-3.0-or-later AND GPL-2.0-or-later AND MIT-0')
depends=('gcc-libs' 'zstd')
# Cannot use cargo-nightly here because of missing rust-src-nightly..
makedepends=('rustup' 'bpf-linker' 'git')
source=("$_pkgname::git+https://github.com/kxxt/ttyrecall.git"
        "ttyrecalld.service")
b2sums=('SKIP'
        'b416725ba80259f25fb448e2308e3a18c0fc4eeb4b0d5adb8e423b3a39c2f36df936bc7a639624ce33f689ed38851861fc6d1c1546fb6017c3ad3854ea041e98')
provides=($_pkgname)
conflicts=($_pkgname $_pkgname-bin)
backup=('etc/ttyrecall/daemon.toml')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable # Only the eBPF build need nightly toolchain
  export ZSTD_SYS_USE_PKG_CONFIG=1
  cargo xtask build --release 
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export ZSTD_SYS_USE_PKG_CONFIG=1
  cargo test --frozen --release
}

package() {
  cd "$_pkgname"
  # Binary
  install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  # Service
  install -vDm644 "$srcdir/ttyrecalld.service" "$pkgdir/usr/lib/systemd/system/ttyrecalld.service"
  # Config
  install -dm755 "$pkgdir/etc/ttyrecall"
  install -Dm644 -t "$pkgdir/etc/ttyrecall" etc/daemon.toml
  # Docs
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  # License
  install -Dm644 ttyrecall/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.AGPL3"
  install -Dm644 ttyrecall-ebpf/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL2"
  install -Dm644 ttyrecall-common/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT0"
}

# vim:set ts=2 sw=2 et:
