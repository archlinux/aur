# Maintainer: gimgiwer <gimgiwer@gmail.com>

pkgname=layout-switcher
pkgver=1.0.0
pkgrel=1
pkgdesc="Wayland layout switcher daemon with cyclic double-press (Rust rewrite)"
arch=('x86_64' 'aarch64')
url="https://github.com/gimgiwer/layout-switcher"
license=('GPL-3.0-or-later')
depends=('wl-clipboard' 'wtype')
makedepends=('cargo')
provides=('layout-switcher')
conflicts=('layout-switcher-git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b5bcbce085b4db02b2849935378ab3cab20d055a831e06c65998d6eb98990d24')
install=layout-switcher.install

prepare() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo"
  # Respect user custom flags from makepkg.conf (e.g. target-cpu=native in RUSTFLAGS)
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/layout-switcher "$pkgdir/usr/bin/layout-switcher"
  
  # Patch systemd unit to point to system-wide binary location
  sed 's|%h/.local/bin/layout-switcher|/usr/bin/layout-switcher|' layout-switcher.service > layout-switcher.service.patched
  install -Dm644 layout-switcher.service.patched "$pkgdir/usr/lib/systemd/user/layout-switcher.service"
  
  install -Dm644 README.md "$pkgdir/usr/share/doc/layout-switcher/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/layout-switcher/LICENSE"
}
