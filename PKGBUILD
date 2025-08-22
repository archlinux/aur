# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: thynkon <thynkon at protonmail dot com>

pkgname=gitui-git
pkgver=0.27.0.r107.gfd46b9a0
pkgrel=1
pkgdesc='Blazing fast terminal-ui for git written in Rust'
url='https://github.com/extrawurst/gitui'
arch=('x86_64')
license=(MIT)
depends=('gcc-libs' 'glibc' 'libgit2' 'libssh2' 'openssl')
makedepends=('cargo' 'cmake' 'git' 'python') # libz-ng-sys crate needs cmake, xcb crate needs python
optdepends=(
  'xclip: for clipboard support on X11 (or xsel)'
  'xsel: for clipboard support on X11 (or xclip)'
  'wl-clipboard: for clipboard support on Wayland'
)
provides=("gitui=$pkgver")
conflicts=('gitui')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_srcenv() {
  CFLAGS+=' -ffat-lto-objects'
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LIBGIT2_NO_VENDOR=1
  export LIBGIT2_SYS_USE_PKG_CONFIG=1
  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  export OPENSSL_NO_VENDOR=true
}

build() {
  cd "$pkgname"
  _srcenv
  cargo build --frozen --release
}

check() {
  cd "$pkgname"
  _srcenv
  cargo test --frozen --release
}

package() {
  depends+=(libgit2.so)
  cd "$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" {KEY_CONFIG,README,THEMES}.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
