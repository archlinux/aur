# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Wang Jiajun <amesists@gmail.com>

pkgname=kdesrc-build-git
pkgver=v15.05.r9.g517c5b8
pkgrel=1
pkgdesc="A script to build KDE software from KDE's source repositories"
url='http://kdesrc-build.kde.org/'
arch=('any')
license=('GPL')
depends=('perl' 'perl-libwww' 'perl-xml-parser' 'dialog' 'perl-json')
makedepends=('git' 'cmake')
conflicts=('kdesrc-build')
provides=('kdesrc-build')
optdepends=('subversion: download source code using svn'
            'git: download source code using git')
source=('git://anongit.kde.org/kdesrc-build.git')
md5sums=('SKIP')

pkgver() {
  cd kdesrc-build
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdesrc-build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}"/usr/share/doc/samples
  install -Dm644 ../kdesrc-build/kdesrc-buildrc-{,kf5-}sample \
    "${pkgdir}"/usr/share/doc/samples/
  install -Dm644 ../kdesrc-build/kf5-{applications,frameworks,kdepim,qt5,workspace}-build-include \
    "${pkgdir}"/usr/share/doc/samples/
}
