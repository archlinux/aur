# Maintainer: Bart Libert <bart dot aur at libert dot email>
# Contributor: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=cpprestsdk
pkgver=2.10.19
pkgrel=4
pkgdesc="A cross-platform, modern, and asynchronous library that enables developers to access and author connected applications"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/Microsoft/cpprestsdk/"
license=('MIT')
depends=('openssl>=1.0.0' 'zlib' 'gcc-libs' 'boost' 'glibc')
makedepends=('cmake>=2.6.0' 'websocketpp')
conflicts=('casablanca' 'casablanca-git' 'cpprestsdk-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Microsoft/cpprestsdk/archive/v${pkgver}.tar.gz"
        "https://github.com/microsoft/vcpkg/raw/57676e8f87dbf629715f8cb9f3ac0536371867bc/ports/cpprestsdk/fix-clang-dllimport.patch"
        "boost-1.88.patch"
        "warnings.patch")
sha256sums=('4b0d14e5bfe77ce419affd253366e861968ae6ef2c35ae293727c1415bd145c8'
            '09db07f231f1de91f32b34bda34d251a64473b65b1f7496a1b6f57462c028b28'
            '6f714ecbfa9483cb289bba28cf7bc7d345b33bbc6d780685d92a83cd5c2fd5a4'
            '198b354d5fab857813d8db3fdb0a056cc1f717149b1488e18491957fa85910b3')
options=(!lto)

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  patch -Np1 -i ../fix-clang-dllimport.patch
  patch -Np1 -i ../boost-1.88.patch
  patch -Np1 -i ../warnings.patch
  mkdir -p build
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  cmake ../Release \
    -DBUILD_TESTS=OFF \
    -DBUILD_SAMPLES=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWERROR=OFF
  make  -j`nproc`
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ThirdPartyNotices.txt ${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices
}
