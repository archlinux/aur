# Maintainer: Ashley Whetter <(firstname) @ awhetter.co.uk>
# Maintainer: Anton Hvornum <torxed@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname='protobuf3.12'
pkgver=3.12.4
pkgrel=2
pkgdesc="Protocol Buffers - Google's data interchange format"
arch=('x86_64')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('unzip' 'python-setuptools')
source=("https://github.com/protocolbuffers/protobuf/releases/download/v$pkgver/protobuf-all-$pkgver.tar.gz"
        "gcc_13_fix.patch")
sha512sums=('166ebf405446a811ddfd354f4268d142326b2ff87ea13dc9643c2c035f54accb0c438e6248d2a043b6485211d8b9ff1d6c8c0dfff6fd2a3eecc34217980d3fa9'
            '43d023624c99f99b8e7bffbfb99a83b378feda506aad3e76661764afa61fe93d08bd605d531c795726a844d19fe3442166bfd4805b17006d7ae5fe42058e89e3')

prepare() {
  cd "protobuf-$pkgver"
  
  # This patch deals with the Python 3.11 changes and gcc 13+, where certain object functions
  # have been replaced with Py* function calls.
  # For more information see:
  # * https://docs.python.org/3.11/whatsnew/3.11.html#whatsnew311-c-api-porting
  # * https://github.com/sirfz/tesserocr/issues/298#issuecomment-1100035852
  patch python/google/protobuf/pyext/descriptor.cc ../gcc_13_fix.patch

  autoreconf -vfi
}

build() {
  cd "protobuf-$pkgver"
  ./configure --prefix=/usr --program-suffix=3.12
  make
  cd python
  python setup.py build --cpp_implementation
}

check() {
  cd "protobuf-$pkgver"

  # https://bugzilla.redhat.com/show_bug.cgi?id=1838470
  # https://github.com/protocolbuffers/protobuf/issues/7514
  # Also ignore deprecation warnings. This is an old version of a library
  # so deprecations are inevitable and we won't fix them.
  make check CXXFLAGS+=' -Wno-error=type-limits -Wno-error=deprecated-declarations'

  cd python
  python setup.py test
}

package() {
  cd "protobuf-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -rf $pkgdir/usr/include
  rm -rf $pkgdir/usr/lib/pkgconfig
  rm -f $pkgdir/usr/lib/*.so

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
