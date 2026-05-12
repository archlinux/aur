# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=resources-git
pkgver=1.10.2.r81.gaf0bd53
pkgrel=1
pkgdesc="Monitor your system resources and processes"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/Resources"
license=('GPL-3.0-or-later')
depends=(
  'dmidecode'
  'gtk4'
  'libadwaita'
  'polkit'
)
makedepends=(
  'cargo'
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/GNOME/Incubator/resources.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "${pkgname%-git}" build -Dprofile=default
  meson compile -C build
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
