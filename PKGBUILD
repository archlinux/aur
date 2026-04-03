# Maintainer: CPT-Dawn <dawnsp0456@gmail.com>
pkgname=vellum
_reponame=Vellum
pkgver=1.1.0
pkgrel=1
pkgdesc="Wayland wallpaper stack with daemon and TUI"
arch=('x86_64')
url="https://github.com/CPT-Dawn/Vellum"
license=('GPL3')
makedepends=('cargo' 'pkgconf')
provides=("vellum")
conflicts=("vellum-git")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CPT-Dawn/Vellum/archive/refs/tags/v1.1.0.tar.gz")
sha256sums=('81c3e38444f68f8c7fc9e12972f5e4ed1e03cdfb244efd7f2536ac7771b7623f')

prepare() {
  cd "${_reponame}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked
}

build() {
  cd "${_reponame}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo build --release --frozen --locked --workspace --bins
}

package() {
  cd "${_reponame}-${pkgver}"

  install -Dm755 "${srcdir}/target/release/vellum" "${pkgdir}/usr/bin/vellum"
  install -Dm755 "${srcdir}/target/release/vellum-daemon" "${pkgdir}/usr/bin/vellum-daemon"

  install -Dm644 packaging/systemd/user/vellum-daemon.service \
    "${pkgdir}/usr/lib/systemd/user/vellum-daemon.service"

  # Ship the autostart desktop entry as an example so it stays opt-in.
  install -Dm644 packaging/autostart/vellum.desktop \
    "${pkgdir}/usr/share/doc/${pkgname}/examples/vellum.desktop"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
