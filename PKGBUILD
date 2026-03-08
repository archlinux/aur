# Maintainer: Cyrrrt <cyrrrt@cyrrrt.me>
pkgname=keyresolve-git
_pkgname=KeyResolve
pkgver=r5.048c158
pkgrel=1
pkgdesc="Snap Tap / SOCD-style keyboard input handling for Linux (Wayland & X11)"
arch=('x86_64' 'aarch64')
url="https://github.com/Antosser/KeyResolve"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="keyresolve.install"
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname"

  # Binary
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/${pkgname%-git}"

  # Documentation & License
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # udev rules
  echo 'KERNEL=="event*", SUBSYSTEM=="input", GROUP="input", MODE="660"' > 99-keyresolve.rules
  echo 'KERNEL=="uinput", SUBSYSTEM=="input", GROUP="input", MODE="660"' >> 99-keyresolve.rules
  install -Dm644 99-keyresolve.rules "$pkgdir/usr/lib/udev/rules.d/99-keyresolve.rules"
}
