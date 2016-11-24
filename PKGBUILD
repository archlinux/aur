# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: M0Rf30
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgbase=protobuf2
pkgname=('protobuf2' 'python2-protobuf2')
pkgver=2.6.1
pkgrel=2
pkgdesc="Protocol Buffers v2 - Google's data interchange format"
arch=('i686' 'x86_64')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=('gcc-libs' 'zlib')
makedepends=('python2-setuptools')
source=(https://github.com/google/protobuf/releases/download/v$pkgver/protobuf-$pkgver.tar.bz2)
sha256sums=('ee445612d544d885ae240ffbcbf9267faa9f593b7b101f21d58beceb92661910')

build() {
  cd protobuf-$pkgver
  ./configure --prefix=/usr --program-prefix=protobuf2- --libdir=/usr/lib/protobuf2 --includedir=/usr/include/protobuf2
  make
}

check() {
  make -C protobuf-$pkgver check
}

package_protobuf2() {
  cd protobuf-$pkgver
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE

  install -Dm644 editors/protobuf-mode.el \
    "${pkgdir}"/usr/share/emacs/site-lisp/protobuf2-mode.el
}

package_python2-protobuf2() {
  pkgdesc='Python 2 bindings for Google Protocol Buffers v2'
  depends=('python2' 'protobuf2=${pkgver}')

  cd protobuf-$pkgver/python
  python2 setup.py install --prefix=/usr --root="${pkgdir}"

  install -d "${pkgdir}"/usr/share/licenses/$pkgname
  ln -s /usr/share/licenses/$pkgbase/LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/
  
  mv "${pkgdir}"/usr/lib/python2.7/site-packages/google/protobuf "${pkgdir}"/usr/lib/python2.7/site-packages/google/protobuf2
  cd "${pkgdir}"/usr/lib/python2.7/site-packages/google/protobuf2
  find . -type f -name "*.py" -exec sed -i 's/google.protobuf/google.protobuf2/g' {} + 
}
