# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Peter Spiess-Knafl <psk@autistici.org>
# Contributor: Daniel Bomar <dbdaniel42@gmail.com>

pkgname=libjson-rpc-cpp-git
pkgver=20150220
pkgrel=1
pkgdesc="C++ framework for json-rpc 1.0 and 2.0"
arch=('i686' 'x86_64')
depends=('argtable' 'curl' 'jsoncpp' 'libmicrohttpd')
makedepends=('cmake')
checkdepends=('boost')
url="https://github.com/cinemast/libjson-rpc-cpp"
license=('MIT')
source=(git+https://github.com/cinemast/libjson-rpc-cpp)
sha256sums=('SKIP')
provides=('libjson-rpc-cpp')
conflicts=('libjson-rpc-cpp')
install=libjson-rpc-cpp.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  msg2 "Creating build directories"
  mkdir -p ${pkgname%-git}/build
  cd ${pkgname%-git}/build
  msg2 "Invoking cmake"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  msg2 "Building the framework"
  make
}

check() {
  cd ${pkgname%-git}/build
  msg2 "Running unit tests"
  make test
}

package() {
  cd ${pkgname%-git}/build
  msg2 "Packing all together"
  make DESTDIR="${pkgdir}" install
  msg2 "Add MIT License to package"
  install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
