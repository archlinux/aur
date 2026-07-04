# Maintainer: Sergey A <murlakatamenka@disroot.org>

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164

pkgname=hdiff
pkgver=5.0.1
pkgrel=1
pkgdesc='C/C++ library and CLI tool for Diff & Patch between binary files or directories'
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url='https://github.com/sisong/HDiffPatch'
license=('MIT')
depends=('zlib' 'zstd') #  zlib is in base
makedepends=('git' 'zlib' 'zstd')
provides=('hdiffpatch')
conflicts=('hdiffpatch-bin')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('3f04cddc3c8c5f4f7ef8e2621cfffa42c337fac64c08ae8fe000e4530a5238da')

prepare() {
  for lib in libmd5 lzma bzip2; do
    if [[ ! -d "$lib" ]]; then
      git clone --depth=1 "https://github.com/sisong/${lib}.git" "./$lib"
    fi
  done
}

build() {
  cd "HDiffPatch-$pkgver"

  make ZSTD=2 LDEF=0 ZLIB=2
}

package() {
  cd "HDiffPatch-$pkgver"

  install -Dm 755 ./hdiffz -t "$pkgdir/usr/bin"
  install -Dm 755 ./hpatchz -t "$pkgdir/usr/bin"

  install -Dm 644 ./LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
}
