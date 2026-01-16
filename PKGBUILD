# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=caffeine-applet-git
pkgver=r12.78706c2
pkgrel=1
pkgdesc="A simple COSMIC applet that prevents your system from going idle by creating a systemd-inhibit lock session."
arch=('x86_64' 'aarch64')
url="https://github.com/codevardhan/caffeine-applet"
license=('MIT')
depends=('cosmic-applets')
makedepends=(
  'cargo'
  'git'
  'just'
)
source=('git+https://github.com/codevardhan/caffeine-applet.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
