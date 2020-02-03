# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=mediahandling-git
_pkgname=mediahandling
pkgver=0.0.7.r58.g64b48a7
pkgrel=2
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="A library that decodes, encodes and reads properties of media-files"
url="https://github.com/jonno85uk/mediahandling"
license=('custom:BSD3')
depends=('gcc-libs')
makedepends=('cmake' 'ffmpeg' 'fmt' 'git')
conflicts=('mediahandling')
source=("$_pkgname::git+https://github.com/jonno85uk/mediahandling.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  if [ -d build ]
  then
    rm -rf build
  fi

  mkdir build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "../$_pkgname"
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  mv "$srcdir/$_pkgname/LICENSE" \
     "$pkgdir/usr/share/licenses/$pkgname"
}
