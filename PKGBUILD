# Maintainer: Bill Fraser <bill.fraser@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

_pkgbasename=libgit2
pkgname=lib32-libgit2
pkgver=1.2.0
pkgrel=1
epoch=1
pkgdesc='A linkable library for Git'
arch=('x86_64')
url="https://libgit2.github.com/"
depends=('lib32-glibc' 'lib32-http-parser' 'lib32-libssh2' 'lib32-openssl' 'lib32-pcre' 'lib32-zlib')
makedepends=('cmake' 'libssh2' 'python')
provides=('libgit2.so')
license=('GPL2')
source=("$_pkgbasename-$pkgver.tar.gz::https://github.com/libgit2/libgit2/archive/v${pkgver}.tar.gz"
        "remove_http-parse_incompatible_tests.patch")
sha512sums=('428188de153fdf8ff5bf78949f4a3a89fba57b87a8b641f92fed501df6a8cfdb72e0ffe0bf61a98adf210a2867134eb4421ea4b8d8219331aabc3daddd92f5fc'
            '6347086440fd9b5e0e73c88e049e253f2c159477de7cc2d02cb7f0907c80626fb301eceb72e803c259bc281440cfbc092e0a97ffdd825fd758545790cf5cd90b')
b2sums=('b612e3a30b4675431879792132adee22cce57986b4f307507b896d823329f7e37514d9008e008075c395a4eca26aaf6ed6eb3943cf97370a0b04086240a5e1fc'
        '1ce817b82772bc088279a8f347298c775742df5a0e9e0b8459e391ed49d1330e75a6ec7ee641bf5f32e9ed352672ad0ad6fae400f6f695bd6a68211bf2694089')

prepare() {
  cd "$_pkgbasename-$pkgver"
  # removing tests that are only compatible with the (modified) vendored
  # version of http-parser, but not with upstream http-parser
  patch -Np1 -i "../remove_http-parse_incompatible_tests.patch"
}


build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "$_pkgbasename-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
        -DCMAKE_BUILD_TYPE='None' \
        -DUSE_HTTP_PARSER=system \
        -DTHREADSAFE=ON \
        -Wno-dev \
        -B build \
        -S .
  make -C build VERBOSE=1
}

check() {
  cd "$_pkgbasename-$pkgver"
  make -C build test VERBOSE=1
}

package() {
  depends+=('libssh2.so')
  cd "$_pkgbasename-$pkgver"
  make -C build DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{include,share,bin,sbin}
  install -vDm 644 {AUTHORS,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
