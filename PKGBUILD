# Maintainer:Bipin Kumar <kbipinkumar@pm.me>

pkgname=mashmap
_pkgname=MashMap
pkgver=3.1.0
pkgrel=1
pkgdesc='Fast approximate aligner for long DNA sequences' 
arch=(x86_64)
url="https://github.com/marbl/MashMap"
license=('custom: Public Domain')
depends=('glibc' 'gsl' 'zlib' 'gcc-libs' 'perl' 'python' 'htslib')
makedepends=('cmake' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marbl/MashMap/archive/refs/tags/v${pkgver}.tar.gz"
        )
b2sums=('e58e3c71a59232760b706cd0a9a8aa09103666ea9ad5d54f3e0b559a5c1b325546875ba04ec06297ee8e1bcf7317c626ad131c2978e5f117ba7a5cedde172870')

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
