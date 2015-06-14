# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=qwbfs
pkgver=1.2.5
pkgrel=2
pkgdesc="Cross platform WBFS file system manager"
arch=('i686' 'x86_64')
url="https://github.com/pasnox/qwbfsmanager"
license=('GPL2')
# Also 'openssl', but already satisfied:
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git')
install=${pkgname}.install
source=("qwbfs::git+https://github.com/pasnox/qwbfsmanager.git#tag=v1.2.5"
        "fresh::git+https://github.com/pasnox/fresh.git#commit=cd735c55c54ca8917704d231022e1ed46c3b42a8"
        "qmake-extensions::git+https://github.com/pasnox/qmake-extensions.git#commit=b60b99bccbfda40136c8aa1a54770543519feda8")
sha1sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "$srcdir/qwbfs"
  git submodule init
  git config submodule.fresh.git.url "$srcdir/fresh"
  git submodule update

  cd "fresh.git"
  git submodule init
  git config submodule.qmake-extensions.git.url "$srcdir/qmake-extensions"
  git submodule update
}

build() {
  cd "$srcdir/qwbfs"

  qmake PREFIX=/usr
  make
}

package() {
  cd "$srcdir/qwbfs"

  mkdir -p "$pkgdir/usr/bin"
  cp bin/qwbfsmanager "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/usr/share/applications"
  cp packages/QWBFSManager.desktop "$pkgdir/usr/share/applications"

  mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  cp qwbfs/resources/qwbfsmanager.png \
     "$pkgdir/usr/share/icons/hicolor/512x512/apps"
}
