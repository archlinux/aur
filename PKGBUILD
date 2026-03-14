# Maintainer: Charles Jacquin <charles@jacquin.app>
pkgname=loom
pkgver=1.1.1
pkgrel=1
pkgdesc="AI image generation desktop client for GNOME"
arch=('x86_64' 'aarch64')
url="https://forge.jacquin.app/charles/loom"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'gettext' 'openssl')
makedepends=('cargo' 'git' 'meson' 'desktop-file-utils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d46962004da83cd73f52536624c4ae3beb202cf8325ec5d2938061104de1f49c')

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
