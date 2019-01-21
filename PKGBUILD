# Maintainer: dreieck
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

_pkgorigname=minizip
_pkgname="${_pkgorigname}2"
pkgname="${_pkgname}-2.3.3"
pkgdesc="Mini zip and unzip based on libbsd and zlib. Version 2.3.3 (specific version)."
_pkgver=2.3.3
pkgver="${_pkgver}"
pkgrel=2
arch=('x86_64')
license=('custom')
url="http://github.com/nmoinvaz/minizip"
depends=(
  # 'bzip2'
  'glibc'
  'libbsd'
  'zlib'
)
makedepends=(
  'cmake'
)
provides=(
  "${_pkgname}=${pkgver}"
  "lib${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "lib${_pkgname}"
)
source=(
  "${_pkgorigname}-${_pkgver}.tar.gz::https://github.com/nmoinvaz/${_pkgorigname}/archive/${_pkgver}.tar.gz"
)
sha256sums=(
  '8c74530d3095891525f53cda6aabe1df138255ef53d0f294791cb57c2cb5710c'
)

build() {
  cd "${srcdir}/${_pkgorigname}-${_pkgver}"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib/minizip2 \
    -DCMAKE_INSTALL_INCLUDEDIR=include/minizip2 \
    -DCMAKE_INSTALL_LIBEXECDIR=libexec/minizip2 \
    -DCMAKE_INSTALL_OLDINCLUDEDIR=/usr/include/minizip2 \
    -DBUILD_SHARED_LIBS=ON \
    -DUSE_AES=ON \
    -DUSE_BZIP2=ON \
    -DUSE_LZMA=ON \
    -DUSE_PKCRYPT=ON \
    -DUSE_ZLIB=ON \
    .

  make
}

package() {
  cd "${srcdir}/${_pkgorigname}-${_pkgver}"

  make DESTDIR="${pkgdir}" install

  install -D -v -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
