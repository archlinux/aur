# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=cpprestsdk
pkgver=2.10.1
pkgrel=1
pkgdesc="A cross-platform, modern, and asynchronous library that enables developers to access and author connected applications"
arch=('i686' 'x86_64')
url="https://github.com/Microsoft/cpprestsdk/"
license=('Apache')
depends=('boost' 'websocketpp' 'openssl>=1.0.0')
makedepends=('cmake>=2.6.0')
conflicts=('casablanca' 'casablanca-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Microsoft/cpprestsdk/archive/v${pkgver}.tar.gz" "17a198081379384ed9373828f905592ce9c4bdf3.patch")
sha512sums=('f6a93e5e87e27db724ccc028326b1dce243617cb0ae0d101b2cea700c4f264c073cb0e8a9d88a14be165e16ef2f1f43a17e49278087bc8cf372e623a1b6a9c47'
            '6d33d9bdbe0fa4353d528fe1c9eb4b7071c8d4de848051675554cec7486bfa97015eabef1d3fcd634ae274c9093ac97e718e212e8e03b20576af34184bad3f4d')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  patch -p1 < ../17a198081379384ed9373828f905592ce9c4bdf3.patch
  mkdir -p build

}

build() {
  cd build
  cmake ../${pkgname}-${pkgver}/Release \
    -DBUILD_TESTS=OFF \
    -DBUILD_SAMPLES=OFF \
    -DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0 \
    -DOPENSSL_SSL_LIBRARY=/usr/lib/openssl-1.0/libssl.so \
    -DOPENSSL_CRYPTO_LIBRARY=/usr/lib/openssl-1.0/libcrypto.so \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make  -j`nproc`
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  cd ${pkgname}-${pkgver}
  install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ThirdPartyNotices.txt ${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices
}
