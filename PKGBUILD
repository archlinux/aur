# Maintainer: zyx <d0116u@gmail.com>
pkgname=authtui-git
pkgver=r21.f12b1c2
pkgrel=1
pkgdesc="a full rust tui auther"
arch=('i686' 'x86_64')
url="https://github.com/d116u/authtui"
license=('MIT')
provides=("authtui")
makedepends=('cargo' 'git')
optdepends=('fish: fish completions')
depends=('rust')
conflicts=("authtui")
source=("git+https://github.com/zyxisme/authtui.git")
sha1sums=('SKIP')

pkgver() {
  # 从 git 仓库生成软件版本
  # 其他实现见: https://wiki.archlinux.org/title/VCS_package_guidelines#Git
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}


build() {
  #git clone https://github.com/d116u/authtui.git
  cd "${pkgname%-git}"
  if command -v rustup > /dev/null 2>&1; then
    RUSTFLAGS="-C target-cpu=native" rustup run nightly \
      cargo build --release
  elif rustc --version | grep -q nightly; then
    RUSTFLAGS="-C target-cpu=native" \
      cargo build --release
  else
    cargo build --release
  fi
}


package() {
  cd "${pkgname%-git}"
  install -Dm755 "target/release/auther" "$pkgdir/usr/bin/authtui"
}
