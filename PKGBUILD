
# Maintainer: Attila Greguss <floyd0122@gmail.com>
pkgname=cosmic-ext-applet-sysinfo-git
pkgver=r8.aad0afc
pkgrel=1
pkgdesc="Sysinfo for the COSMIC™ desktop"
arch=('x86_64')
url="https://github.com/cosmic-utils/cosmic-ext-applet-sysinfo"
license=('GPL-3.0')
depends=(
	'cosmic-applets'
	'libxkbcommon'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  "git+https://github.com/cosmic-utils/cosmic-ext-applet-sysinfo.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  just build
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
