# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=paq8px
pkgver=216
pkgrel=1
pkgdesc="Lossless data compressor achieving high compression ratios"
arch=('x86_64')
url="https://github.com/hxim/paq8px"
license=('GPL-2.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hxim/paq8px/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d231d814a0dc79657a2691ed166692a5dfbfa740388357654253ecadbdf8ef75')

latestver() {
  gh api repos/hxim/paq8px/releases/latest --jq '.tag_name' | sed 's/^v//'
}

prepare() {
  # v216 ships the header as Clz.hpp but ResidualMap.cpp includes "clz.hpp".
  # The case mismatch resolves fine on case-insensitive filesystems (NTFS/APFS
  # defaults, where upstream develops) but is a fatal "No such file" on
  # case-sensitive ones (ext4/btrfs/xfs — the norm under Linux, so every Arch
  # user hits it). Still unfixed on upstream master as of v216 (no release/issue).
  local f="${pkgname}-${pkgver}/src/ResidualMap.cpp"
  grep -q '#include "clz.hpp"' "$f" || {
    echo "paq8px: expected case-mismatched include is gone — upstream likely fixed it, drop this prepare()" >&2
    return 1
  }
  sed -i 's/#include "clz\.hpp"/#include "Clz.hpp"/' "$f"
}

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DNDEBUG=ON \
    -DNATIVECPU=OFF
  cmake --build build
}

package() {
  install -Dm755 build/paq8px "${pkgdir}/usr/bin/paq8px"
}
