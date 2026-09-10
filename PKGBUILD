# Maintainer:
# Contributor: Your Name <you@example.com>
pkgname=herdr-git
_pkgname=${pkgname%-git}
pkgver=0.9.0.r14.g120c682
pkgrel=4
pkgdesc='Terminal workspace manager for AI coding agents'
arch=('x86_64' 'aarch64')
url='https://herdr.dev'
_url="https://github.com/herdrdev/$_pkgname"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'libgcc')
# Zig Hint:
# wget https://archive.archlinux.org/packages/z/zig/zig-0.15.2-3-x86_64.pkg.tar.zst
# pkgctl build -I zig-0.15.2-3-x86_64.pkg.tar.zst
makedepends=('cargo' 'cmake' 'git' 'zig<0.16.0')
provides=("$_pkgname=${pkgver%.*.*}")
conflicts=("$_pkgname")
options=('strip' '!staticlibs' '!zipman' '!debug' 'buildflags' 'lto')
source=("git+$_url.git")
sha256sums=('SKIP')
_abbr=7

_srcenv() {
 	cd "$_pkgname"
  export CARGO_HOME="$srcdir"
  export CARGO_PROFILE_RELEASE_DEBUG=2
  export CARGO_PROFILE_RELEASE_STRIP=false
  export CARGO_PROFILE_RELEASE_LTO=thin
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
  CFLAGS+=' -ffat-lto-objects'
  CXXFLAGS+=' -ffat-lto-objects'
  RUSTFLAGS+=" --remap-path-prefix $PWD=/"
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export ZSTD_SYS_USE_PKG_CONFIG=1
  export LIBGHOSTTY_VT_OPTIMIZE=ReleaseFast
  export LIBGHOSTTY_VT_SIMD=true
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache/"
}

prepare() {
  _srcenv
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  cd vendor/libghostty-vt && zig build --fetch=all
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=$_abbr --match="v*" HEAD |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  _srcenv
  source /etc/os-release || true
  export CARGO_TARGET_DIR=target
  export HERDR_BUILD_COMMIT="${pkgver: -"$_abbr"}"
  export HERDR_BUILD_CHANNEL="${pkgname#$_pkgname-}"
  export HERDR_BUILD_ID="${pkgver#*.*.*.}${ID:+.$ID}"
  cargo build --release --frozen --config "package.version='$pkgver'"
  target/release/$_pkgname completion bash > completions.bash
  target/release/$_pkgname completion fish > completions.fish
  target/release/$_pkgname completion zsh > completions.zsh
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm0644 completions.bash "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	install -Dm0644 completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
	install -Dm0644 completions.zsh "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
