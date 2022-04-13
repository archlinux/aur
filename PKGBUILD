# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Julian Sanin <sanin89julian at gmail dot com>

pkgname=liberasurecode
pkgver=1.6.3
pkgrel=1
pkgdesc="Erasure Code API library written in C with pluggable Erasure Code backends"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('BSD')
url="https://github.com/openstack/liberasurecode"
depends=('zlib')
makedepends=('doxygen')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/${pkgver}.tar.gz"
        "disable-doc-full-path-names.patch")
sha256sums=('8c1afa0a4d5f4909ae864a5d00381b963b4a179364ba591611ceb634c3c9eb99'
            'c64e3fd34c17ad929feaba016bb3284151fc0ab8c1fc2a5554a8fb617a491112')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/disable-doc-full-path-names.patch"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-mmi
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make test || true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
