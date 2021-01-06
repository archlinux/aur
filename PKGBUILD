# Maintainer: ahub <ahub@riseup.net>

pkgname=qrop
pkgver=0.4.4
pkgrel=1
pkgdesc="Crop planning and recordkeeping software for and by market gardeners." arch=("x86_64")
url="https://qrop.frama.io/"
license=("GPL3")
depends=("qt5-base" "qt5-charts" "qt5-quickcontrols2" "qt5-tools")
makedepends=("make" "cmake" "sqlite")

source=("https://framagit.org/ah/qrop/-/archive/v${pkgver}/${pkgname}-v$pkgver.tar.gz"
  "qrop.desktop::https://framagit.org/-/snippets/6043/raw/main/snippetfile1.txt"
  "include.patch::https://framagit.org/-/snippets/6041/raw/main/snippetfile1.txt")

sha256sums=("2c64dda230b8b73b8e98e317efabcfffc28b3dc34fdfe74329c6e158b2aead51"
  "0659fd27c86e86e62bce66525e0c738c2975f28c68faf18d696634a0e59c88fd"
  "8b0c02535aa363b14cc81931272e7dfb7c0342149d67eb62ee6cd6bc80d58f50")


prepare() {
  cd ${srcdir}
  patch  -p1 --input="${srcdir}/include.patch"
} 

build() {
# TODO : Remove Release flag as per https://wiki.archlinux.org/index.php/CMake_package_guidelines
  cmake -B build -S "${pkgname}-v${pkgver}" \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev 
  make -C build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm755 "${srcdir}/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/qrop.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/build/core/libcore.so" "${pkgdir}/usr/lib/libcore.so"
}
