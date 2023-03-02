#PACKAGER="TimeTrap <zhaoyuanpan@gmail.com>"
pkgname=lib32-libtiff5
pkgver=4.4.0
pkgrel=3
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
            'c3af9cf5d4e76637195e31a2c8f4635da996a145cee14b821d10e795b289ee3800f22c44e6574ebd0b1aa26bebf5c3103ee72468c2c57b30dde2911450da3923'
            '469f30b24335dd8dff4704dbf6464146785cdb4974988e7c0156d626dfea3d0586242b9ad265c2e7786c6edbdba92460a13cd02786d35a64d9cdfdf15ed582bc')


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
