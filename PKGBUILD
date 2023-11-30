# Maintainer:Bipin Kumar <kbipinkumar@pm.me>

pkgname=mashmap
_pkgname=MashMap
pkgver=3.1.2
pkgrel=1
pkgdesc='Fast approximate aligner for long DNA sequences' 
arch=(x86_64)
url="https://github.com/marbl/MashMap"
license=('custom: Public Domain')
depends=('glibc' 'gsl' 'zlib' 'gcc-libs' 'perl' 'python' 'htslib')
makedepends=('cmake' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marbl/MashMap/archive/refs/tags/v${pkgver}.tar.gz"
        )
b2sums=('dd68fbf19bf91952d8664ffe8d4c61ea381f5d0cb3a8cebeff8d0f2e81ee920718d49b9e4ebcc17b4094c35eaff94029e6f2100f299433493578ba54b99bde0d')

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
