# Maintainer:Bipin Kumar <kbipinkumar@pm.me>

pkgname=mashmap
_pkgname=MashMap
pkgver=3.1.1
pkgrel=1
pkgdesc='Fast approximate aligner for long DNA sequences' 
arch=(x86_64)
url="https://github.com/marbl/MashMap"
license=('custom: Public Domain')
depends=('glibc' 'gsl' 'zlib' 'gcc-libs' 'perl' 'python' 'htslib')
makedepends=('cmake' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marbl/MashMap/archive/refs/tags/v${pkgver}.tar.gz"
        )
b2sums=('7e660bc1e9a777101cf3d74d9e2d67de62fab29a81cc69614c876eae96abfb3491fe63d139d835262cdf6eef1366b01a6e6603a621963c073fc575be2c1b6770')

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
