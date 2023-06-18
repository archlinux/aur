# Maintainer: 

pkgname=openseachest-git
pkgver=23.03.r1.g03a4576
pkgrel=2
pkgdesc="Utilities for performing various operations on SATA, SAS, NVMe, and USB storage devices"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/Seagate/openSeaChest"
license=(MPL2)
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
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
