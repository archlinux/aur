# Maintainer: Shorin <2433516202@qq.com>
_pkgname=cliphist-tui
_oldpkgname=shorinclip
pkgname=cliphist-tui-gitee-git
pkgver=r51.gfd4a47b
pkgrel=1
pkgdesc="A wayland clipboard TUI based on fzf and cliphist. Use chafa for image preview."
arch=('aarch64' 'x86_64')
url="https://gitee.com/jxc20120414/cliphist-tui.git"
license=('MIT')

depends=(
  'fzf' 'cliphist' 'wl-clipboard' 'ffmpegthumbnailer' 'chafa' 'bash'
  'curl' 'file' 'glib2' 'xdg-utils' 'libnotify'
)

makedepends=('git' 'cargo')

provides=("$_pkgname" "$_oldpkgname" "${_oldpkgname}-git")
conflicts=("$_pkgname" "$_oldpkgname" "${_oldpkgname}-git")
replaces=("$_oldpkgname" "${_oldpkgname}-git")

source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # 编译 Release 版本
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname"

  # 1. 安装编译好的 Rust 二进制文件 (路径变为了 target/release/xxx)
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # 2. 建立向后兼容的软链接
  ln -sf "/usr/bin/$_pkgname" "$pkgdir/usr/bin/$_oldpkgname"
}
