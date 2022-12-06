# Maintainer: Ashley Whetter <(firstname) @ awhetter.co.uk>
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
pkgrel=1
pkgdesc="Protocol Buffers - Google's data interchange format"
arch=('x86_64')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('unzip' 'python-setuptools')
source=("https://github.com/protocolbuffers/protobuf/releases/download/v$pkgver/protobuf-all-$pkgver.tar.gz")
sha512sums=('166ebf405446a811ddfd354f4268d142326b2ff87ea13dc9643c2c035f54accb0c438e6248d2a043b6485211d8b9ff1d6c8c0dfff6fd2a3eecc34217980d3fa9')

prepare() {
  cd "protobuf-$pkgver"
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
