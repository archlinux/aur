# Maintainer: Ben Isenhart <bisenhar(at)uvm(dot)edu>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Wang Jiajun <amesists@gmail.com>

pkgname=kdesrc-build-git
pkgver=r2051.a9d08e8
pkgrel=1
pkgdesc="A script to build KDE software from KDE's source repositories"
url='https://kdesrc-build.kde.org/'
arch=('any')
license=('GPL')
depends=('perl-libwww' 'perl-xml-parser' 'dialog' 'perl-json' 'perl-io-socket-ssl' 'perl-net-ssleay' 'perl-yaml-syck')
makedepends=('cmake' 'git')
optdepends=('subversion: download source code using svn'
            'git: download source code using git')
conflicts=('kdesrc-build')
provides=('kdesrc-build')
source=("git://anongit.kde.org/kdesrc-build.git")
md5sums=('SKIP')

pkgver() {
  cd kdesrc-build
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  install -Dm644 ../kdesrc-build/kdesrc-buildrc-kf5-sample \
    "${pkgdir}"/usr/share/doc/samples/
  install -Dm644 ../kdesrc-build/kf5-{applications,frameworks,kdepim,qt5,workspace}-build-include \
    "${pkgdir}"/usr/share/doc/samples/
}
