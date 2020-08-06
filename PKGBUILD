# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=python2-protobuf
pkgver=3.12.4
pkgrel=1
pkgdesc='Python 2 bindings for Google Protocol Buffers'
arch=('x86_64')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=('gcc-libs'
         'glibc'
         'zlib'
         'python2-six'
         "protobuf=${pkgver}"
         )
makedepends=('unzip'
             'python2-setuptools'
             )
source=("https://github.com/protocolbuffers/protobuf/releases/download/v${pkgver}/protobuf-all-${pkgver}.tar.gz")
sha512sums=('166ebf405446a811ddfd354f4268d142326b2ff87ea13dc9643c2c035f54accb0c438e6248d2a043b6485211d8b9ff1d6c8c0dfff6fd2a3eecc34217980d3fa9')

prepare() {
  cd "protobuf-${pkgver}"
  autoreconf -vfi
}

build() {
  cd "protobuf-${pkgver}"
  cd python
  python2 setup.py build --cpp_implementation
}

check() {
  cd "protobuf-${pkgver}"

  cd python
  python2 setup.py test
}


package() {

  local python_version=$(python2 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  cd "protobuf-${pkgver}"
  (
    cd python
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}:PYTHONPATH" \
    python2 setup.py install --skip-build \
                            --cpp_implementation \
                            --optimize=1 \
                            --root="${pkgdir}"
  )
  install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
