# Maintainer: Théo Rozier <contact@theorozier.fr>

pkgname=portablemc
pkgver=5.0.1
pkgrel=1
pkgdesc='Cross platform command line utility for launching Minecraft quickly and reliably with included support for Mojang versions and popular mod loaders.'
arch=(x86_64 aarch64)
url='https://github.com/mindstorm38/portablemc'
license=('Apache-2.0')
depends=(
  gcc-libs
  glibc
  openssl
)
makedepends=(
  rust
)

# For building, the CFLAGS has caused issues with linking the project...
options=('!lto' '!buildflags')

source=("portablemc-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('859a9e870443c1b3f709b0257149073169e9651937e14ead2ada51d18778c33d')

build() {
  cd "portablemc-${pkgver}"
  cargo xtask dist
}

check() {
  cd "portablemc-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "portablemc-${pkgver}/dist/portablemc-${pkgver}-linux-${CARCH}"
  
  install -vDm755 -t "${pkgdir}/usr/bin/" portablemc
  install -vDm644 -t "${pkgdir}/usr/share/doc/portablemc/" README
  install -vDm644 -t "${pkgdir}/usr/share/licenses/portablemc/" LICENSE

  install -vdm755 "${pkgdir}/usr/share/man/man1"
  ./portablemc gen man "${pkgdir}/usr/share/man/man1"
}
