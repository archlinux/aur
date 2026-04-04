# Maintainer: karasevuy <eganov2006@gmail.com>
pkgname=wrain-git
_pkgname=wrain
pkgver=r5.2422cc8
pkgrel=1
pkgdesc="GPU accelerated rain wallpaper for Wayland (Hyprland/Sway)"
arch=('x86_64')
url="https://github.com/happyzxzxz/wrain"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'vulkan-icd-loader' 'alsa-lib')
makedepends=('cargo' 'git')
provides=('wrain')
conflicts=('wrain')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  (set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"

  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --frozen
}

package() {
  cd "$_pkgname"
  
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  
  install -d "$pkgdir/usr/share/$_pkgname/assets"
  cp -r assets/* "$pkgdir/usr/share/$_pkgname/assets/"
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
