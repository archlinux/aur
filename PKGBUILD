# Maintainer:Bipin Kumar <kbipinkumar@pm.me>

pkgname=mashmap
_pkgname=MashMap
pkgver=3.1.3
pkgrel=1
pkgdesc='Fast approximate aligner for long DNA sequences' 
arch=(x86_64)
url="https://github.com/marbl/MashMap"
license=('custom: Public Domain')
depends=('glibc' 'gsl' 'zlib' 'gcc-libs' 'perl' 'python' 'htslib')
makedepends=('cmake' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marbl/MashMap/archive/refs/tags/v${pkgver}.tar.gz"
        )
b2sums=('2fbb505a24610a08747c397848f0b9ff2685fe79dcd86cb14cf5fbe20252bffd832fcbabceb8b7752c5557d5bffae5c197bccffe432d2b9540b8bbe045642218')

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
