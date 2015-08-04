# Maintainer: Peter Spiess-Knafl <dev@spiessknafl.at>
# Contributor: Daniel Bomar <dbdaniel42@gmail.com>
pkgname=libjson-rpc-cpp
pkgver=0.6.0
pkgrel=1
pkgdesc="C++ framework for json-rpc 1.0 and 2.0"
arch=('i686' 'x86_64')
url="https://github.com/cinemast/libjson-rpc-cpp"
license=('MIT')
depends=('curl' 'argtable' 'jsoncpp' 'libmicrohttpd')
makedepends=('cmake')
#checkdepends=('libcatch-cpp-headers')
install=libjson-rpc-cpp.install
changelog=ChangeLog
source=('https://github.com/cinemast/libjson-rpc-cpp/archive/v0.6.0.tar.gz' 'gcc5.patch')
sha256sums=('98baf15e51514339be54c01296f0a51820d2d4f17f8c9d586f1747be1df3290b' 'e5e8431bc478235eaad90fb94e723627cc2e0e5b015772fc97b0fae6ef9eeafc')

prepare() {
 cd "${srcdir}"/${pkgname}-${pkgver}
 patch -Np1 -i ../gcc5.patch
}

build() {
  msg2 "Creating build directories"
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build
  msg2 "Invoking cmake"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_STATIC_LIBS=TRUE ..
  msg2 "Building the framework"
  make
}

check() {
  cd $pkgname-$pkgver/build
  msg2 "Running unit tests"
  make test
}

package() {
  cd $pkgname-$pkgver/build
  msg2 "Packing all together"
  make DESTDIR="${pkgdir}" install
  msg2 "Add MIT License to package"
  install -D -m644 "${srcdir}/$pkgname-$pkgver/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

