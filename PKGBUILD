# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=openseachest-git
pkgver=24.08.1.r28.g42bc2c2
pkgrel=1
pkgdesc="Utilities for performing various operations on SATA, SAS, NVMe, and USB storage devices"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/Seagate/openSeaChest"
license=(MPL-2.0)
depends=(glibc)
makedepends=(git ninja meson)
provides=(openseachest)
conflicts=(openseachest)
source=("git+https://github.com/Seagate/openSeaChest.git"
        "git+https://github.com/Seagate/opensea-common.git"
        "git+https://github.com/Seagate/opensea-transport.git"
        "git+https://github.com/Seagate/opensea-operations.git"
        "seagate-wingetopt::git+https://github.com/Seagate/wingetopt.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd openSeaChest
  git submodule init
  git config submodule.opensea-common.url     "${srcdir}/opensea-common"
  git config submodule.opensea-transport.url  "${srcdir}/opensea-transport"
  git config submodule.opensea-operations.url "${srcdir}/opensea-operations"
  git config submodule.wingetopt.url          "${srcdir}/seagate-wingetopt"
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd openSeaChest
  git describe --long --tags --abbrev=7 --exclude test* | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd openSeaChest
  arch-meson --buildtype=release builddir
  ninja -C builddir
}

package() {
  cd openSeaChest
  DESTDIR="${pkgdir}/" ninja -C builddir install
}
