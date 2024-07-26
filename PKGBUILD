# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=resources-git
pkgver=1.5.1.r43.ge27c6b9
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
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
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
