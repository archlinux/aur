# Maintainer: dreieck
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

_pkgorigname=minizip
_pkgname="${_pkgorigname}2"
pkgname="${_pkgname}-git"
pkgdesc="Mini zip and unzip based on bzip2, libbsd and zlib. Newest version (currently 2.x)."
pkgver=2.8.2+r1449.20190108.2ca7f39
pkgrel=2
arch=('x86_64')
license=('custom')
url="http://github.com/nmoinvaz/minizip"
depends=(
  'bzip2'
  'glibc'
  'libbsd'
  'zlib'
)
makedepends=(
  'cmake'
  'git'
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
  "${_pkgorigname}::git+git://github.com/nmoinvaz/${_pkgorigname}.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgorigname}"

  _ver="$(git describe --tags)"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"

  if [ -n "${_ver}" ]; then
    printf %s "${_ver}+r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgorigname}"
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
  cd "${srcdir}/${_pkgorigname}"

  make DESTDIR="${pkgdir}" install

  install -D -v -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
