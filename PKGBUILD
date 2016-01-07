# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Alad Wenter
# Contributor: Kuba Serafinowski <zizzfizzix at gmail dot com>

pkgname=tomahawk
pkgver=0.8.4
pkgrel=4
pkgdesc='A Music Player App written in C++/Qt'
arch=('i686' 'x86_64')
url='http://tomahawk-player.org/'
license=('GPL3')
# NOTE: The phonon VLC backend supposedly supports networking better than the gstreamer backend.
depends=('qtwebkit' 'phonon-qt4' 'quazip-qt4' 'qtkeychain-qt4' 'attica-qt4'
         'liblastfm' 'libechonest' 'sqlite' 'taglib>=1.10' 'lucene++' 'qjson' 'qca')
makedepends=('cmake' 'sparsehash' 'boost' 'websocketpp' 'gnutls')
optdepends=('kdelibs: integration with Plasma Desktop'
            'telepathy-qt4: integration with Telepathy'
            'jreen: Jabber support (required at build time)'
            'snorenotify: Notification support (required at build time)')

source=("http://download.tomahawk-player.org/${pkgname}-${pkgver}.tar.bz2"
        "libechonest-ver.patch")
sha256sums=('0fb04bc6b7009e17186b3d384057939727c6f289d22f7f9a5ed2c9c9cd800449'
            '424699b92eb8ea4bff654a425bddc6ecee0ba49176d088e362b545e97957fcf3')
install=tomahawk.install

prepare() {
  rm -rf "build-qt4"
  mkdir -p "build-qt4"

  # fix libechonest version
  patch -p0 -i "libechonest-ver.patch"
}

build() {
  cd "build-qt4"
  cmake "../${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR="lib/${pkgname}" \
        -DTAGLIB_MIN_VERSION=1.10
  make
}

package() {
  cd "build-qt4"
  make DESTDIR="${pkgdir}" install
}
