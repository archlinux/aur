# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=stp
pkgver=2.3.3
pkgrel=1
pkgdesc="Simple Theorem Prover"
arch=('i686' 'x86_64')
url="https://stp.github.io/"
license=('MIT')
depends=('bison' 'boost' 'cryptominisat5' 'flex' 'minisat-git' 'python2')
makedepends=('cmake' 'git')

source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz"
        'mandir.patch')
sha256sums=('ea6115c0fc11312c797a4b7c4db8734afcfce4908d078f386616189e01b4fffa'
            '4c09301c5a36cd89845a7177e1215008f8bbb23fa6f3c6cc941006825e28c327')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Correct the destination for man documentation.
  patch < "$srcdir/mandir.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p build && cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_PYTHON_INTERFACE=ON \
    ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install licenses
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 LICENSE_COMPONENTS "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install stp
  cd build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
