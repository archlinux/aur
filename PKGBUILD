# Maintainer: Masaki Waga <masakiwaga@gmail.com>
# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
# Maintainer: Benjamin Cheng <ben@bcheng.me>
pkgname=sealcrypto
pkgver=4.1.2
pkgrel=2
pkgdesc='Microsoft library for fully homomorphic encryption'
arch=('x86_64')
url="https://www.microsoft.com/en-us/research/project/microsoft-seal"
license=('MIT')
makedepends=('cmake')
source=("https://github.com/Microsoft/SEAL/archive/${pkgver}.tar.gz")
sha256sums=('acc2a1a127a85d1e1ffcca3ffd148f736e665df6d6b072df0e42fff64795a13c')

provides=('sealcrypto')

build() {
  cd ${srcdir}
  tar xf ${pkgver}.tar.gz
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
