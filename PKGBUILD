# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=stp
pkgver=2.1.2
pkgrel=1
pkgdesc="Simple Theorem Prover"
arch=('i686' 'x86_64')
url="https://stp.github.io/"
license=('MIT')
depends=('bison' 'boost' 'flex' 'minisat-git')
makedepends=('cmake' 'git')

source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz"
        'cmake-git.patch')
sha256sums=('d7f118324a534cfa33cabe7302e717f960a3d29e01c5cabc9232d21683f0085d'
            'cedc57c9e375b145dcd9f3586505477737315194e260de0f689b7715b2088312')

prepare() {
  cd "$srcdir"

  # Since we're installing from a release archive, searching for a Git
  # directory can cause the build to fail.
  patch -p1 < cmake-git.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
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
