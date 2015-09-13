# $Id$
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: James Rayner <iphitus@gmail.com>
# Contributor: Sergio Jovani Guzman <moret@paretux.org>

pkgname=konversation-legacy
pkgver=1.5.1
pkgrel=1
pkgdesc="A user friendly IRC client for KDE"
arch=('i686' 'x86_64')
url="http://konversation.kde.org"
depends=('kdebase-runtime' 'kdepimlibs')
makedepends=('automoc4' 'cmake' 'pkgconfig' 'docbook-xml' 'optipng')
optdepends=('python: python scripting support'
            'kdebase-konsole: open a terminal in konversation'
            'qca-ossl: Diffie-Hellman key exchange and Blowfish ECB/CBC support')
conflicts=('konversation' 'konversation-git')
license=('GPL2' 'FDL')
install=konversation.install
source=("http://download.kde.org/download.php?url=stable/konversation/${pkgver}/src/konversation-${pkgver}.tar.xz"
        'use-qdbus-qt4.patch')
sha1sums=('1b69db93d2c0a38b631dd92065fa6e7490ffbfbe'
          'a21aed6079de7693e67abe13798807920de01f6a')

prepare() {
  mkdir build

  cd konversation-${pkgver}
  patch -p1 -i "${srcdir}"/use-qdbus-qt4.patch
}

build() {
  cd build
  cmake ../konversation-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  
  # Remove a bunch of symlinks pointing to non-existant files
  for _lang in pt_BR uk sv et de en nl it fr es ca; do
     rm -f "${pkgdir}"/usr/share/doc/kde/html/${_lang}/konversation/common
  done
}
