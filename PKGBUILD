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
pkgver=3.12.0
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
sha512sums=('5752329c13a903ef3015b1383632f0eba50521669052c5b3d834e798e3d3d3bca37b175a93d83516d1a9b96960ceb2087fe8577aaa71015decc8f9f4741471a2')

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
