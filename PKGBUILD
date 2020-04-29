# Maintainer: Peter Hoeg <firstname at lastname dot com>

pkgname=tensor-git
pkgver=r296.f3f3056
pkgrel=1
pkgdesc='Cross-platform Qt5/QML-based Matrix client. Use tensor-quiark-git for newer fork.'
arch=('x86_64' 'i686')
url='https://github.com/davidar/tensor'
license=('GPL3')
depends=('qt5-quickcontrols')
makedepends=(git)
source=('git+https://github.com/davidar/tensor.git'
        'git+https://github.com/Fxrh/libqmatrixclient.git'
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
