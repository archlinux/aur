#PACKAGER="TimeTrap <zhaoyuanpan@gmail.com>"
pkgname=lib32-libtiff5
pkgver=4.4.0
pkgrel=2
pkgdesc='Library for manipulation of TIFF images'
arch=(x86_64)
url=http://www.simplesystems.org/libtiff/
license=(custom)
depends=(
  lib32-gcc-libs
  lib32-glibc
  lib32-libjpeg-turbo
  libtiff5
  zstd
  xz
  zstd
)
makedepends=()
source=(
  https://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz
  # fix CVE-2022-2056 / CVE-2022-2057 / CVE-2022-2058: https://bugs.archlinux.org/task/75360
  $pkgname-4.4.0-fpe_tiffcrop.patch::https://gitlab.com/libtiff/libtiff/-/commit/dd1bcc7abb26094e93636e85520f0d8f81ab0fab.patch
  # fix CVE-2022-34526: https://bugs.archlinux.org/task/75608
  $pkgname-4.4.0-CVE-2022-34526.patch::https://gitlab.com/libtiff/libtiff/-/commit/275735d0354e39c0ac1dc3c0db2120d6f31d1990.patch
)
sha512sums=('78ffab7667d0feb8d38571bc482390fc6dd20b93a798ab3a8b5cc7d5ab00b44a37f67eb8f19421e4ab33ad89ab40e382128f8a4bbdf097e0efb6d9fca5ac6f9e'
            '5e36f443bbbfdd1270cb1f4d3ce4b0b415d658fe7e14764b315db73606ea28e854661cda74f1c5ccb00a2247431b966b9ac5271a1e3204837f79cb6fc50bf5bf'
            '083a49f005bdba484ec78d1d7d8fd5a2c355f88d3a4a0a02b5c0522dc81ed5116fbeb4d45db886006277745b77c337c1bdce0b655d6a81ae570f079a2dfea57c')


prepare() {
  cd tiff-${pkgver}

  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  cd tiff-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32'
  make
}

package() {
  cd tiff-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/{pkgconfig,libtiff{,xx}.{a,so}},share}
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libtiff5 "${pkgdir}"/usr/share/licenses/lib32-libtiff5
}
