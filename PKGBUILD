# Maintainer: Doridian <archlinux at doridian dot net>

pkgname=openseachest-logparser
pkgver=1.5.4
_release=Release_24.5.1
pkgrel=4
pkgdesc='Open source version of the Log Parser that parses ATA/SCSI/NVMe & Seagate vendor unique logs'
arch=('any')
_baseurl='https://github.com/Seagate'
url="${_baseurl}/openSeaChest_LogParser"
license=('MPL-2.0')
makedepends=('make' 'gcc')
depends=('gcc-libs')
source=(
  "${pkgname}.git::git+${url}#tag=${_release}"
  "libjson.git::git+${_baseurl}/libjson"
  "opensea-common.git::git+${_baseurl}/opensea-common"
  "opensea-parser.git::git+${_baseurl}/opensea-parser"
  "wingetopt.git::git+${_baseurl}/wingetopt"
  'opensea-common-no-memset-explicit.patch'
)
sha256sums=('ab8fa60f9cc9fa4fe4ff91ca8c5a879263e9308c1860db1c57af2e296e3ba88f'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'd26ed859da6148b115676964fd3e6e57ca6aba748faf364eed8b2202694018c4')

prepare() {
  cd "${srcdir}/${pkgname}.git"
  git reset --hard
  git -c protocol.file.allow=always submodule update --init
  git submodule foreach --recursive git reset --hard
  patch -p1 -i "${srcdir}/opensea-common-no-memset-explicit.patch"
}

build() {
  cd "${srcdir}/${pkgname}.git/Make/gcc"
  # We need to build with -j1, libjson won't build otherwise
  make release -j1
}

package() {
  cd "${srcdir}/${pkgname}.git"
  # It suffixes with the architecture for no discernable reason, so we just glob it
  install -Dm755 Make/gcc/openSeaChest_LogParser_* "${pkgdir}/usr/bin/openSeaChest_LogParser"
}

# vim:set ts=2 sw=2 et:
