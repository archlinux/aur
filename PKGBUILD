# Maintainer: Crom (Thibaut CHARLES) <CromFr@gmail.com>
pkgname=waybar-module-sysmon-git
pkgver=r3.4692b93
pkgrel=1
pkgdesc='Waybar CFFI module showing CPU, RAM, GPU, network and disk usage as scrolling bar graphs'
arch=('x86_64' 'aarch64')
url='https://gitlab.com/cromfr/waybar-module-sysmon'
license=('MIT')
depends=('gtk3' 'waybar')
makedepends=('cargo' 'git')
optdepends=('nvidia-utils: NVIDIA GPU graph (libnvidia-ml)')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

package() {
  cd "${pkgname%-git}"
  # Point Waybar's `module_path` at this file.
  install -Dm755 target/release/libwaybar_sysmon.so \
    "$pkgdir/usr/lib/waybar-module-sysmon/libwaybar_sysmon.so"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
  install -Dm644 waybar-example-config.json \
    "$pkgdir/usr/share/doc/${pkgname%-git}/waybar-example-config.json"
}
