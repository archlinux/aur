pkgname=astrolith
pkgver=0.1.0
pkgrel=1
pkgdesc='Local-first editor for Astro Markdown and MDX content'
arch=('x86_64')
url='https://github.com/MareDevi/Astrolith'
license=('AGPL-3.0-only')
depends=('fontconfig' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libx11' 'libxcb'
         'libxkbcommon' 'libxkbcommon-x11' 'shared-mime-info' 'vulkan-driver'
         'vulkan-icd-loader' 'wayland')
makedepends=('clang' 'cmake' 'git' 'mise' 'openssl' 'pkgconf' 'vulkan-headers' 'zstd')
optdepends=('git: Git integration')
# Cargo enables Rust ThinLTO. GCC LTO objects from native crates cannot link with rust-lld.
options=('!strip' '!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aa2920abb6972f4c6c8a48842b089831c095fb1d04b576a5f9c4069885aa92a5')

prepare() {
  cd "Astrolith-$pkgver"
  mise trust ./mise.toml
  mise install
  mise exec -- cargo fetch --locked --target host-tuple
}

build() {
  cd "Astrolith-$pkgver"
  ASTROLITH_BUILD_ID="v$pkgver" CARGO_NET_OFFLINE=true mise exec -- bash -c '
    source packaging/linux/common.sh
    build_binary
  '
}

package() (
  cd "Astrolith-$pkgver"
  source packaging/linux/common.sh
  install_metadata "$pkgdir" target/release/astrolith-desktop
  install_licenses "$pkgdir/usr/share/licenses/$pkgname"
)
