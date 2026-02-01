# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=pods-git
pkgver=2.2.0.r33.g6616955
pkgrel=1
pkgdesc='A Podman desktop application'
arch=(x86_64)
url=https://github.com/marhkb/pods
license=("GPL-3.0-or-later")
depends=(
  'gtksourceview5'
  'libadwaita'
  'podman'
  'vte4'
)
makedepends=(
  'git'
  'cargo'
  'meson'
)
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
md5sums=(SKIP)

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
