# Maintainer:  Orhun Parmaksız <orhun@archlinux.org>

pkgname=rio-git
pkgver=0.2.12.r154.g621b16e672
pkgrel=1
pkgdesc="A hardware-accelerated GPU terminal emulator powered by WebGPU (git)"
arch=('x86_64')
url="https://github.com/raphamorim/rio"
license=('MIT')
# https://raphamorim.io/rio/install/#arch-linux
depends=(
  'gcc-libs'
  'fontconfig'
  'freetype2'
  'glibc'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'cargo'
  'cmake'
  'desktop-file-utils'
  'libxcb'
  'libxkbcommon'
  'python'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("$pkgname::git+${url}")
sha512sums=('SKIP')
options=('!lto')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --match="v[0-9]*" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname%-git}"
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README.md"
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE"
  desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "misc/${pkgname%-git}.desktop"
  install -Dm0644 "docs/static/assets/${pkgname%-git}-logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
}

# vim: ts=2 sw=2 et:
