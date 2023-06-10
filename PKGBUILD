# Maintainer:Bipin Kumar <kbipinkumar@pm.me>

pkgname=mashmap
_pkgname=MashMap
pkgver=3.0.4
pkgrel=1
pkgdesc='Fast approximate aligner for long DNA sequences' 
arch=(x86_64)
url="https://github.com/marbl/MashMap"
license=('custom: Public Domain')
depends=('glibc' 'gsl' 'zlib' 'gcc-libs' 'perl' 'python')
makedepends=('cmake' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marbl/MashMap/archive/refs/tags/v${pkgver}.tar.gz"
        )
b2sums=('609e531a32e6e9042ec692cfb137a16fb39e7ff65e3f3f7d56a44dfba173bd79719893f55475a5a05e7b31d2e6278a5834ab31dba4603dbc2736ed947636179a')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -i '4i #include <stdint.h>' src/common/utils.cpp
  
}

build() {
  cd ${_pkgname}-${pkgver}
  cmake -B build \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
  cd ${_pkgname}-${pkgver}
  install -d 755 ${pkgdir}/usr
  install -d ${pkgdir}/usr/share/${pkgname}
  DESTDIR="$pkgdir" cmake --install build
  rm scripts/generate_git_version.sh
  # install bundled scripts
  for file in scripts/*
    do [ -f "$file" ] || continue
    install -Dm755 "$file" ${pkgdir}/usr/share/${pkgname}/$file
  done
  # install custom LICENSE file
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
