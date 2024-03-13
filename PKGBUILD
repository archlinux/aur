# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=resources-git
pkgver=1.3.0.r97.g0f4bdff
pkgrel=1
pkgdesc="Monitor your system resources and processes"
arch=('x86_64')
url="https://github.com/nokyan/resources"
license=('GPL-3.0-or-later')
depends=('dmidecode' 'libadwaita' 'polkit')
makedepends=('cargo' 'git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/nokyan/resources.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # Revert broken merged PR #183
  git revert -n -m 1 0f4bdff2b8732f5583124cece6409f711722b3d3

  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
