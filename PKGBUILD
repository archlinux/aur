# Maintainer: éclairevoyant
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Giovanni Scafora <giovanni at archlinux dot org>
# Contributor: Tom Newsom <Jeepster at gmx dot co dot uk>

_pkgname=ccache
pkgname="$_pkgname-git"
pkgver=4.8.2.r4.2737d79e
pkgrel=1
pkgdesc='Compiler cache that speeds up recompilation by caching previous compilations'
arch=(i686 x86_64)
url="https://ccache.dev"
license=(GPL3)
depends=(gcc-libs glibc hiredis zstd libzstd.so)
makedepends=(asciidoctor cmake git perl)
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
source=("git+https://github.com/ccache/ccache.git")
b2sums=('SKIP')

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -Wno-dev \
    -B build \
    -S .
  make VERBOSE=1 -C build
}

check() {
  cd $_pkgname
  make VERBOSE=1 check -C build
}

package() {
  cd $_pkgname

  make DESTDIR="${pkgdir}" install -C build
  make DESTDIR="${pkgdir}" install -C build/doc

  install -Dm 644 doc/*.md doc/*.adoc -t "${pkgdir}/usr/share/doc/${pkgname}"

  install -d "${pkgdir}/usr/lib/ccache/bin"
  local _prog
  for _prog in gcc g++ c++; do
    ln -s /usr/bin/ccache "${pkgdir}/usr/lib/ccache/bin/$_prog"
    ln -s /usr/bin/ccache "${pkgdir}/usr/lib/ccache/bin/${CHOST}-$_prog"
  done
  for _prog in cc clang clang++; do
    ln -s /usr/bin/ccache "${pkgdir}/usr/lib/ccache/bin/$_prog"
  done
}
