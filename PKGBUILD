# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Peter Spiess-Knafl <psk@autistici.org>
# Contributor: Daniel Bomar <dbdaniel42@gmail.com>

pkgname=libjson-rpc-cpp-git
pkgver=1.0.0.r0.ge960bf5
pkgrel=1
pkgdesc="C++ framework for json-rpc 1.0 and 2.0"
arch=('i686' 'x86_64')
depends=('argtable' 'curl' 'jsoncpp' 'libmicrohttpd' 'hiredis')
makedepends=('cmake' 'git')
url="https://github.com/cinemast/libjson-rpc-cpp"
license=('MIT')
source=(git+https://github.com/cinemast/libjson-rpc-cpp)
sha256sums=('SKIP')
provides=('libjson-rpc-cpp')
conflicts=('libjson-rpc-cpp')
install=libjson-rpc-cpp.install

pkgver() {
  cd ${pkgname%-git}
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
prepare() {
 cd "${srcdir}"/${pkgname%-git}
}

build() {
  msg2 "Creating build directories"
  mkdir -p ${pkgname%-git}/build
  cd ${pkgname%-git}/build
  msg2 "Invoking cmake"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCOMPILE_TESTS=FALSE -DCOMPILE_EXAMPLES=FALSE ..
  msg2 "Building the framework"
  make
}

package() {
  cd ${pkgname%-git}/build
  msg2 "Packing all together"
  make DESTDIR="${pkgdir}" install
  msg2 "Add MIT License to package"
  install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
