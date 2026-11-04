# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=caret
pkgver=0.3.1
pkgrel=1
pkgdesc='GPU-rendered terminal for Wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/caret'
license=('GPL-3.0-or-later')
# vulkan-icd-loader: libvulkan is loaded at run time, so nothing links against it.
depends=('wayland' 'libxkbcommon' 'vulkan-icd-loader' 'vulkan-driver'
         'hicolor-icon-theme' 'libgcc' 'glibc')
makedepends=('cargo' 'shaderc' 'just' 'gettext')
optdepends=('xdg-terminal-exec: open Caret from launchers that ask for a terminal')
conflicts=('caret-git' 'tangent')
replaces=('tangent')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d6216e79fbebffca5beb3e3161e2206014dbaf93db1601316bfc9e44c67f86d9')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CARET_LOCALEDIR=/usr/share/locale
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" just prefix=/usr install
}
