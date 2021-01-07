# Maintainer: Bill Fraser <bill.fraser@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

_pkgbasename=libgit2
pkgname=lib32-libgit2
pkgver=1.1.0
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
        "$_pkgbasename-0.99.0-remove_http-parse_incompatible_tests.patch")
sha512sums=('347bb68900181b44fa58a0417506c91383adb965607fce049a5b4c57ac9cc286e0a140d164c339b50fb6cd6951f47757c2917a2df44ba004bfaa4fb643946bb8'
            'e73072424c9c1870eaaf93b3451295ef7333b59f6cb8a6897dd690b69a20aaeb70f00d15a692c1d9e0745d5ef16bbbb912fbd570d8bc83ca0b7d57f32025bf94')
b2sums=('2a1c1f71d2a2e06448c78eb46028fdcfd59682dccf2365851c4bd059cdd78842320f9a5ba7345e761611a5b4eba634faf2e26cc669097da0ba2e1c832c23059f'
        'cdca2012f772afea99436faa02f80697dc9042a6eb5ae14f8ee8ba9e100a65b936cdfaf84ec0361543c70859375c823a25cfee52b0face40b8dea2ec2cf1de59')

prepare() {
  cd "$_pkgbasename-$pkgver"
  # removing tests that are only compatible with the (modified) vendored
  # version of http-parser, but not with upstream http-parser
  patch -Np1 -i "../${_pkgbasename}-0.99.0-remove_http-parse_incompatible_tests.patch"
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
