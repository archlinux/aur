# Maintainer: Kyriakos Toulgaridis <35013508+ktoulgaridis@users.noreply.github.com>
#
# Rendered by `scripts/package.sh render aur` (#22): it rewrites pkgver, pkgrel and the
# sha256sums line from a release's SHA256SUMS. Edit the rest here.
pkgname=toppingctl
pkgver=0.2.0
pkgrel=1
pkgdesc="Control the TOPPING E2x2 USB audio interface over HID"
arch=('x86_64' 'aarch64')
url="https://github.com/ktoulgaridis/toppingctl"
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc' 'systemd-libs')
makedepends=('cargo')
conflicts=('toppingctl-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('462e1001b0b800c2faf1ab84b1908eea14ff35e173675745ca425d071a058f38')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin toppingctl
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 target/release/toppingctl "${pkgdir}/usr/bin/toppingctl"
  install -Dm0644 packaging/linux/70-toppingctl.rules \
    "${pkgdir}/usr/lib/udev/rules.d/70-toppingctl.rules"
  install -Dm0644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm0644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
