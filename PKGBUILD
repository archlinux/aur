
# Maintainer: Attila Greguss <floyd0122@gmail.com>
pkgname=cosmic-ext-applet-system-monitor-git
pkgver=r28.aa64824
pkgrel=2
pkgdesc="System Monitor for the COSMIC™ desktop"
arch=('x86_64')
url="https://github.com/D-Brox/cosmic-ext-applet-system-monitor"
license=('GPL-3.0')
depends=(
	'cosmic-applets'
	'fontconfig'
	'libxkbcommon'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/D-Brox/cosmic-ext-applet-system-monitor")
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
