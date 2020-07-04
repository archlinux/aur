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
pkgver=3.12.3
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
sha512sums=('08701c1f421f410561c6ef8d027ba5834b6b36359c51bcc941d299d3064bf9e0cf52eb65cd73fa8155cf6cb341be251fb0781ace051d5bcb72b24a8d1df9c7ea')

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
