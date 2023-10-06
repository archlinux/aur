# Maintainer:
# Contributor: kevku <kevku@gmx.com>

pkgname=xsd
pkgver=4.2.0
pkgrel=1
pkgdesc='An open-source, cross-platform W3C XML Schema to C++ data binding compiler'
arch=(x86_64)
url='https://www.codesynthesis.com/products/xsd'
license=(GPL2)
depends=(gcc-libs
         glibc
         libcutl
         libxsd-frontend
         xerces-c)
makedepends=(build2)
source=(https://www.codesynthesis.com/download/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.gz)
sha256sums=('2bed17c601cfb984f9a7501fd5c672f4f18eac678f5bdef6016971966add9145')

build() {
  bpkg create -d build cc                       \
    config.cxx=g++                              \
    config.cc.coptions="${CXXFLAGS} ${LDFLAGS}"
  cd build
  bpkg add "$srcdir"/$pkgname-$pkgver --type dir
  bpkg rep-fetch
  bpkg build xsd ?sys:libxerces-c/* ?sys:libxsd-frontend/* ?sys:libcutl/*
}

package() {
  cd build
  bpkg install config.install.root="$pkgdir"/usr xsd
# Fix conflicts with mono
  mv "$pkgdir"/usr/bin/xsd{,cxx}
  mv "$pkgdir"/usr/share/man/man1/xsd{,cxx}.1

  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
