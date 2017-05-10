# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Kuba Serafinowski <zizzfizzix at gmail dot com>

pkgname=tomahawk-qt5
_pkgname=tomahawk
pkgver=0.8.4
pkgrel=4
pkgdesc="A Music Player App written in C++/Qt5"
arch=('i686' 'x86_64')
url='https://tomahawk-player.org/'
license=('GPL3')
depends=('attica-qt5' 'gnutls' 'libechonest-qt5' 'liblastfm-qt5' 'lucene++'
         'phonon-qt5' 'qca-qt5' 'qt5-svg' 'qt5-webkit' 'qtkeychain-qt5' 'quazip-qt5'
         'taglib>=1.10')
makedepends=('boost' 'cmake' 'sparsehash' 'qt5-tools')
optdepends=('telepathy-qt5: integration with Telepathy')
provides=('tomahawk')
conflicts=('tomahawk')
install="${_pkgname}.install"
source=("http://download.tomahawk-player.org/${_pkgname}-${pkgver}.tar.bz2"
        "arch-build.patch")
sha512sums=('5b312f593eac39d06de05e24d4ce429122d0777a9d52d6db8c65309ac283d7ae560c2fc189b186f0f8b1a7bbe1135ed0d59e1d850de6a93655e53efe4f5317c7'
            '305c355fa583a5420df5523f9fad0334e7feb7ed814ba277dc42d9e20edb3837304f1755f252ddf6fa2bb09d204fccaffc5e8c03e3f76faaf51359a8a40a499b')

prepare() {
  rm -rf "build"
  mkdir "build"

  patch -p0 -i "arch-build.patch"
}

build() {
  cd "build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR="lib/${pkgname}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_WITH_QT4=OFF \
        -DBUILD_HATCHET=OFF \
        -DTAGLIB_MIN_VERSION=1.10 \
        -Wno-dev \
        "../${_pkgname}-${pkgver}"
  make
}

package() {
  cd "build"
  make DESTDIR="${pkgdir}" install
}
