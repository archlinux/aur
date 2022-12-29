# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Gavin Yancey <gyancey@hmc.edu>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=bees-git
pkgver=0.8.r58.g64dab81
pkgrel=1
pkgdesc="Best-Effort Extent-Same, a btrfs deduplicator daemon"
arch=('x86_64')
url="https://github.com/Zygo/bees"
license=('GPL3')
depends=('util-linux-libs' 'bash')
makedepends=('git' 'discount' 'btrfs-progs' 'systemd')
provides=('bees')
conflicts=('bees')
source=('git+https://github.com/zygo/bees.git#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd bees

  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd bees

  export CXXFLAGS="$CXXFLAGS -Wno-error=restrict"
  export CFLAGS="$CFLAGS -Wno-error=restrict"
  make BEES_VERSION="${pkgver}" all scripts
}

check() {
  cd bees

  make BEES_VERSION="${pkgver}" test
}

package() {
  cd bees

  make BEES_VERSION="${pkgver}" DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}
