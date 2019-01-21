# Maintainer: dreieck
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

_pkgorigname=minizip
_pkgname="${_pkgorigname}2"
pkgname="${_pkgname}-2.3.3"
pkgdesc="Mini zip and unzip based on libbsd and zlib. Version 2.3.3 (specific version)."
_pkgver=2.3.3
pkgver="${_pkgver}"
pkgrel=5
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
  "minizip.pc.rename-minizip2.patch::http://ix.io/1yQu"
)
sha256sums=(
  '8c74530d3095891525f53cda6aabe1df138255ef53d0f294791cb57c2cb5710c'
  '0700dfdb6c637b1a36cf15018a5d4d3ee92cb51d637e33341f4aaae3d4f480ad'
)

prepare() {
  cd "${srcdir}/${_pkgorigname}-${_pkgver}"

  for _patch in 'minizip.pc.rename-minizip2.patch'; do
    msg2 "Applying patch '${_patch}' ..."
    patch -N -p1 --follow-symlinks -i "${srcdir}/${_patch}"
  done
}

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

  # install pkg-config file
  install -d -m755 -v "${pkgdir}/usr/lib/pkgconfig"
  pushd "${pkgdir}/usr/lib/pkgconfig"
  ln -sv "../minizip2/pkgconfig/minizip.pc" "minizip2.pc"
  popd

  install -D -v -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
