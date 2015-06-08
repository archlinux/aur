# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=qmlvlc-git
pkgver=147.f87a2ca
pkgrel=1
pkgdesc="libvlc wrapper for Qt Quick 2/Qml"
arch=('i686' 'x86_64')
url="https://github.com/RSATom/QmlVlc"
license=('GPL3')
depends=('vlc' 'qt5-declarative')
makedepends=()
provides=('qmlvlc')
conflicts=('qmlvlc')
source=("git+https://github.com/RSATom/QmlVlc" "enable-qmake.diff::https://patch-diff.githubusercontent.com/raw/RSATom/QmlVlc/pull/39.diff" "git+https://github.com/RSATom/ya-libvlc-wrapper")
sha256sums=('SKIP'
            '0d8afaa149e3a69b0fa68318d778cdc9cb4800423575c88ecf120fd8173afa0a'
            'SKIP')
_gitname=QmlVlc

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  patch -p1 < "$srcdir/enable-qmake.diff"
  sed -i"" -e 's,^#include "QmlVlcVideoSurface.h",class QmlVlcVideoSurface;,g' QmlVlcSurfacePlayerProxy.h
  sed -i"" -e 's,^class QmlVlcSurfacePlayerProxy; //\(.*\),\1,g' QmlVlcVideoSurface.h
}

build() {
  cd "$srcdir/$_gitname"
  git submodule init
  git config submodule.libvlc_wrapper.url "$srcdir/ya-libvlc-wrapper"
  git submodule update
  qmake .
  make
}

package() {
  cd "$srcdir/$_gitname"
  make INSTALL_ROOT="$pkgdir" install
}
