# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Doridian <archlinux at doridian dot net>

pkgname=openseachest-logparser
pkgver=24.5.1
pkgrel=1
pkgdesc='Open source version of the Log Parser that parses ATA/SCSI/NVMe & Seagate vendor unique logs'
arch=('x86_64')
_baseurl='https://github.com/Seagate'
_gitname="openSeaChest_LogParser"
url="${_baseurl}/${_gitname}"
license=('MPL-2.0')
makedepends=('git')
depends=('glibc' 'gcc-libs')
source=(
  "git+${_baseurl}/${_gitname}.git#tag=Release_${pkgver}"
  "seagate-libjson::git+${_baseurl}/libjson.git"
  "seagate-wingetopt::git+${_baseurl}/wingetopt.git"
  "git+${_baseurl}/opensea-common.git"
  "git+${_baseurl}/opensea-parser.git"
  'opensea-common-no-memset-explicit.patch'
  'sanitize-buildsystem.patch'
)
sha256sums=('ab8fa60f9cc9fa4fe4ff91ca8c5a879263e9308c1860db1c57af2e296e3ba88f'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'd26ed859da6148b115676964fd3e6e57ca6aba748faf364eed8b2202694018c4'
            'f25a7f84c0ae19b9955d197074bdb664ef8b00849e66ab098e10beb8b8a252eb')

prepare() {
  cd "${_gitname}"

  git submodule init
  git config "submodule.libjson.url" "$srcdir/seagate-libjson"
  git config "submodule.wingetopt.url" "$srcdir/seagate-wingetopt"
  git config "submodule.opensea-common.url" "$srcdir/opensea-common"
  git config "submodule.opensea-parser.url" "$srcdir/opensea-parser"
  git -c protocol.file.allow=always submodule update

  git apply "${srcdir}/opensea-common-no-memset-explicit.patch"
  git apply "${srcdir}/sanitize-buildsystem.patch"
}

build() {
  cd "${_gitname}"

  make -C Make/gcc release
}

package() {
  cd "${_gitname}"

  # The binary is suffixed with a pseudo architecture label (not exactly $CARCH)
  install -Dm755 Make/gcc/openSeaChest_LogParser_* "${pkgdir}/usr/bin/openSeaChest_LogParser"
}

# vim:set ts=2 sw=2 et:
