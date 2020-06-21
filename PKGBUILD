# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=kdelibs4support
pkgname=$_pkgname-git
pkgver=r945.b17aa990
pkgrel=1
pkgdesc='Porting aid from KDELibs4 (Git)'
arch=(i686 x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kunitconversion kitemmodels kemoticons kded kparts perl)
makedepends=(extra-cmake-modules git kdoctools qt5-tools networkmanager perl-uri kdesignerplugin)
conflicts=(kdelibs4support)
provides=(kdelibs4support)
groups=(kf5-aids)
source=("git+https://github.com/KDE/kdelibs4support.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$_pkgname
  mkdir -p build
}

build() {
  cd $srcdir/$_pkgname/build
  cmake ../ \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  make -j$(($(nproc) + 1))
}

package() {
  cd $srcdir/$_pkgname/build
  make DESTDIR="$pkgdir" install

# cert bundle seems to be hardcoded
# link it to the one from ca-certificates
  rm -f "$pkgdir"/usr/share/kf5/kssl/ca-bundle.crt
  ln -sf /etc/ssl/certs/ca-certificates.crt "$pkgdir"/usr/share/kf5/kssl/ca-bundle.crt

  install -Dm644 ../COPYING.LIB "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
