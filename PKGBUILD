# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: flovo <flovo-git-commit@f-voegele.de>

pkgname=katago-cuda
_pkgname=katago
pkgver=1.14.1
pkgrel=1
pkgdesc='Baduk engine with no human-provided knowledge'
arch=(x86_64)
provides=($_pkgname)
conflicts=($_pkgname)
url='https://github.com/lightvector/KataGo'
license=(MIT)
depends=(libzip)
makedepends=(cmake cuda cudnn git)
source=("$pkgname"::"git+$url#tag=v${pkgver}"
        "https://media.katagotraining.org/uploaded/networks/models/kata1/kata1-b18c384nbt-s9131461376-d4087399203.bin.gz")
sha256sums=('SKIP'
            'd266f19b4497ed19a72285a422813d8ee97e91d8a0b56f27585d0c02e61c9d38')
noextract=("${source[1]##*/}")

build() {
  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D USE_BACKEND=CUDA \
    -S "${srcdir}/${pkgname}/cpp"
  cmake --build build -j
}

package() {
  cd "${srcdir}"
  install -Dm755 build/katago "${pkgdir}/usr/bin/katago"
  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 kata1-b18c384nbt-s9131461376-d4087399203.bin.gz "${pkgdir}/usr/share/${_pkgname}/kata1-b18c384nbt-s9131461376-d4087399203.bin.gz"
}
