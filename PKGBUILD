# Maintainer: Charles Jacquin <charles@jacquin.app>
pkgname=loom
pkgver=1.1.3
pkgrel=1
pkgdesc="AI image generation desktop client for GNOME"
arch=('x86_64' 'aarch64')
url="https://forge.jacquin.app/charles/loom"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'gettext' 'openssl')
makedepends=('cargo' 'git' 'meson' 'desktop-file-utils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('80ad4b69a44264810590bd2a6ef7e95d71c1e196c948f67f7def41c3eec5d66f')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson builddir
  meson compile -C builddir
}

package() {
  cd "$pkgname"
  meson install -C builddir --destdir "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
