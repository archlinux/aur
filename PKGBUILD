# Maintainer: Bart Libert <bart dot aur at libert dot email>
# Contributor: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=cpprestsdk
pkgver=2.10.19
pkgrel=2
pkgdesc="A cross-platform, modern, and asynchronous library that enables developers to access and author connected applications"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/Microsoft/cpprestsdk/"
license=('MIT')
depends=('openssl>=1.0.0' 'zlib' 'gcc-libs' 'boost' 'glibc')
makedepends=('cmake>=2.6.0' 'websocketpp')
conflicts=('casablanca' 'casablanca-git' 'cpprestsdk-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Microsoft/cpprestsdk/archive/v${pkgver}.tar.gz"
        "https://github.com/microsoft/vcpkg/raw/57676e8f87dbf629715f8cb9f3ac0536371867bc/ports/cpprestsdk/fix-clang-dllimport.patch")
sha512sums=('2d8fa213f492236e2fd912349bf81951c1e618dd8eab4f665f909d75b5aeeda18b8f70dce3a4db50d67bdb3e372888132481701163de6c27716dfd750bff9781'
            '6e48e788054dcd8f0af5deb3bafbe58c0c97816fb108a4fe5c788118c8cbe49c47f049e46ff58ec729be84c71b821b7d7a0b3f937c53b23651ab50ab691baaf8')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  patch -Np1 -i ../fix-clang-dllimport.patch
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
