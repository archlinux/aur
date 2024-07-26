# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=geopard
pkgver=1.6.0
pkgrel=1
pkgdesc="Colorful, adaptive gemini browser"
arch=('x86_64' 'aarch64')
url="https://ranfdev.com/projects/Geopard"
license=('GPL-3.0-or-later')
depends=('libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'git' 'meson')
source=("git+https://github.com/ranfdev/Geopard.git#tag=v$pkgver")
sha256sums=('9000c92df8e0e200dc618656e18400ab16c9878b3d539e7c68723fad243c5c3c')

prepare() {
  cd Geopard
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson Geopard build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
