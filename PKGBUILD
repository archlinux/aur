# Maintainer: Théo Rozier <contact@theorozier.fr>

pkgname=portablemc
pkgver=5.0.3
pkgrel=2
pkgdesc='Cross platform command line utility for launching Minecraft quickly and reliably with included support for Mojang versions and popular mod loaders.'
arch=(x86_64 aarch64 i686)
url='https://github.com/theorzr/portablemc'
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
sha256sums=('03310d4a5b673f0a003d2a626b99772a45b9135ab8428af327984c964dd16fab')

_pmc_version_long="pkgbuild: ${pkgver}-${pkgrel}"

build() {
  cd "portablemc-${pkgver}"
  PMC_VERSION_LONG="${_pmc_version_long}" PMC_NO_ARCHIVE=y cargo xtask dist
}

check() {
  cd "portablemc-${pkgver}"
  PMC_VERSION_LONG="${_pmc_version_long}" cargo test --release --locked
}

package() {
  cd "portablemc-${pkgver}/dist/portablemc-${pkgver}"
  
  install -vDm755 -t "${pkgdir}/usr/bin/" portablemc
  install -vDm644 -t "${pkgdir}/usr/share/doc/portablemc/" README
  install -vDm644 -t "${pkgdir}/usr/share/licenses/portablemc/" LICENSE

  install -vdm755 "${pkgdir}/usr/share/man/man1"
  ./portablemc gen man "${pkgdir}/usr/share/man/man1"
}
