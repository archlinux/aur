# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Michael Laß <bevan@bi-co.net>
# Contributor: Marat "Morion" Talipov <morion.self@gmail.com>

pkgname=keepassx2
pkgver=2.0.3
pkgrel=2
pkgdesc="Cross platform password manager"
url="https://www.keepassx.org"
arch=('x86_64')
license=('GPL2' 'GPL3')
depends=('libxtst' 'qt4' 'shared-mime-info')
makedepends=('intltool' 'cmake' 'optipng')
options=('!emptydirs')
source=(https://www.keepassx.org/releases/${pkgver}/keepassx-${pkgver}.tar.gz{,.sig})
sha512sums=('bf1a4ffa49fc4a6b7a27e6292981c9c13920712b4cd86759a99976f7e0593a243ea14575c57d664ba7e55d2449b5d83bc3d43a64a9a6972335e52234da79d773'
            'SKIP')
validpgpkeys=('164C70512F7929476764AB56FE22C6FD83135D45') # Felix Geyer <felix@fobos.de>

prepare() {
  cd keepassx-${pkgver}
  mkdir build
  sed -r 's|(keepassx)|\12|g' -i CMakeLists.txt share/linux/keepassx.desktop
  sed -r 's|(keepassx)(\.desktop\|\.xml)|\12\2|g' -i share/CMakeLists.txt
  sed -r 's|(KeePassX)|\1 2|g' -i share/linux/keepassx.desktop
  rename 'keepassx' 'keepassx2' share/linux/keepassx.{desktop,xml}
  find -name '*.png' -exec optipng -quiet -force -fix {} \;
}

build() {
  cd keepassx-${pkgver}/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release ..
  make
}

check() {
  cd keepassx-${pkgver}/build
  make test
}

package() {
  cd keepassx-${pkgver}/build
  make DESTDIR="${pkgdir}" install
  rename 'keepassx' 'keepassx2' "${pkgdir}"/usr/share/icons/hicolor/*/*/keepassx.png
}

# vim: ts=2 sw=2 et:
