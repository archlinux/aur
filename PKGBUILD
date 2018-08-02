# Maintainer: Marcin Mikołajczak <me@m4sk@in>
# Author: Peter Hoeg <firstname at lastname dot com>

pkgname=tensor-quiark-git
pkgver=r369.4b8a041
pkgrel=1
pkgdesc='Quiark’s fork of cross-platform Qt5/QML-based Matrix client'
arch=('x86_64' 'i686')
url='https://github.com/Quiark/tensor'
license=('GPL3')
provides=('tensor')
conflicts=('tensor-git')
depends=('qt5-quickcontrols')
source=('git+https://github.com/Quiark/tensor.git'
        'git+https://github.com/Quiark/libqmatrixclient.git'
        'tensor.desktop')
sha1sums=('SKIP'
          'SKIP'
          '4f03c6d93dce615c02360f3b2ab42e6aee883147')

pkgver() {
  cd ${srcdir}/tensor
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd ${srcdir}/tensor
  git config submodule.lib.url $srcdir/libqmatrixclient
  git submodule update --init
}

build() {
  cd ${srcdir}/tensor
  qmake
  make
}

package() {
  cd ${srcdir}/tensor

  mkdir -p $pkgdir/usr/bin
  install -m755 tensor $pkgdir/usr/bin/tensor

  mkdir -p $pkgdir/usr/share/applications
  install -m644 $srcdir/tensor.desktop $pkgdir/usr/share/applications/tensor.desktop
}

# vim:set ts=2 sw=2 et:
