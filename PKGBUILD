# Maintainer:

pkgname=libxsd-frontend
pkgver=2.1.0
_xsdver=4.2
pkgrel=2
pkgdesc='A compiler frontend for the W3C XML Schema definition language'
arch=(x86_64)
url='https://www.codesynthesis.com/projects/libxsd-frontend/'
license=(MIT)
depends=(gcc-libs
         glibc
         libcutl
         xerces-c)
makedepends=(build2)
source=(https://www.codesynthesis.com/download/xsd/$_xsdver/$pkgname-$pkgver.tar.gz)
sha256sums=('98321b9c2307d7c4e1eba49da6a522ffa81bdf61f7e3605e469aa85bfcab90b1')

build() {
  bpkg create -d build cc          \
    config.cxx=g++                 \
    config.cc.coptions="${CXXFLAGS} ${LDFLAGS}"
  cd build
  bpkg add "$srcdir"/$pkgname-$pkgver --type dir
  bpkg rep-fetch
  bpkg build libxsd-frontend ?sys:libxerces-c/* ?sys:libcutl/*
}

package() {
  cd build
  bpkg install config.install.root="$pkgdir"/usr libxsd-frontend
  rm "$pkgdir"/usr/lib/pkgconfig/libxsd-frontend.static.pc

  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
