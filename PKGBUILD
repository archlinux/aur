# Maintainer: Charles Jacquin <charles@jacquin.app>
pkgname=loom
pkgver=1.0.0
pkgrel=1
pkgdesc="AI image generation desktop client for GNOME"
arch=('x86_64' 'aarch64')
url="https://forge.jacquin.app/charles/loom"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'gettext' 'openssl')
makedepends=('cargo' 'git' 'meson' 'desktop-file-utils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('730325d00f3449e4792017e12ce1163a3287a9b1fe68d12374149aa2efb9aee1')

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
