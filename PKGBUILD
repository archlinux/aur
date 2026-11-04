# Maintainer: LuYishan <wuming381907 at gmail dot com>
pkgname=slintlu
_commit=871294b5e1ccc10167187185485e840517562a32
pkgver=0.1.0.r60.g871294b
pkgrel=1
pkgdesc='Run Wayland desktop shells (bars, docks, launchers, overlays) written in the Slint language'
arch=('x86_64' 'aarch64')
url='https://github.com/LunaDashWM/SlintLu'
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'wayland' 'libxkbcommon' 'fontconfig' 'libglvnd')
makedepends=('cargo')
optdepends=('vulkan-icd-loader: Vulkan renderer'
            'vulkan-driver: Vulkan renderer')
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('3d1e7bf7b4601e639e4bb54e27b1926bb65ace694628c57cbfb1d9b6e063c386')

prepare() {
  cd "SlintLu-$_commit"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "SlintLu-$_commit"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin slintlu
}

package() {
  cd "SlintLu-$_commit"
  install -Dm755 target/release/slintlu "$pkgdir/usr/bin/slintlu"
  sed 's|^ExecStart=.*|ExecStart=/usr/bin/slintlu|' dist/slintlu.service |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/slintlu.service"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
