# Maintainer: Masaki Waga <masakiwaga@gmail.com>
# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
# Maintainer: Benjamin Cheng <ben@bcheng.me>
pkgname=sealcrypto
pkgver=4.4.3
pkgrel=1
pkgdesc='Microsoft library for fully homomorphic encryption'
arch=('x86_64')
url="https://www.microsoft.com/en-us/research/project/microsoft-seal"
license=('MIT')
makedepends=('cmake')
source=("https://github.com/Microsoft/SEAL/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3df1c6821fbdcd6122004abfef98428affb1b7c9751a6d63646742b1678f4e27')

provides=('sealcrypto')

build() {
  cd ${srcdir}
  tar xf v${pkgver}.tar.gz
  cmake -B build -S SEAL-${pkgver} \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="-ffat-lto-objects" \
    -DSEAL_USE_INTEL_HEXL=ON \
    -DSEAL_USE_MSGSL=ON \
    -DSEAL_USE_ZLIB=ON \
    -DSEAL_USE_ZSTD=ON \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_CXX_FLAGS="-ffat-lto-objects" # We need LTO fat objects: https://archlinux.org/todo/lto-fat-objects/
  cmake --build build
}

package() {
  install -m644 -D ${srcdir}/SEAL-${pkgver}/LICENSE \
	${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  DESTDIR="${pkgdir}" cmake --install build
}
