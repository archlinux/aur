# $Id$
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

_pkgname=AppImageLauncher
pkgname=appimagelauncher-git
pkgver=1alpha+git20180508.f871b20
pkgrel=1
pkgdesc="A Helper application for running and integrating AppImages."
arch=('x86_64')
url="https://github.com/TheAssassin/AppImageLauncher"
license=('MIT')
depends=('qt5-base' 'fuse' 'cairo' 'binutils' 'desktop-file-utils' 'shared-mime-info' 'inotify-tools' 'libarchive' 'libbsd')
makedepends=('git' 'cmake' 'wget' 'vim' 'qt5-tools')
source=("git://github.com/TheAssassin/$_pkgname#tag=continuous"
        'appimage-binfmt-remove.hook')
sha256sums=('SKIP'
            '72a2630cf79b8f90bc21eae1d9f40c07fe77ce22df46c511b500f514455d7c81')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "1alpha+git`date +%Y%m%d -u -d "$(git show -s --format=%ci $(git rev-parse HEAD))"`.%s" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"

  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$_pkgname"

  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr/ -DCMAKE_INSTALL_LIBDIR=/usr/lib

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

  # install license files
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$srcdir"

  # Install pacman hook
  install -Dm644 -t "$pkgdir"/usr/share/libalpm/hooks *.hook
}
