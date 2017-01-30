# Maintainer: Justin R. St-Amant <jstamant24 at gmail dot  com>
pkgname=camotics-git
pkgver=1.0.6.r127.g776b29b
pkgrel=2
pkgdesc="3-axis NC machining simulation software"
arch=('i686' 'x86_64')
url="http://camotics.org/"
license=('GPL2')
depends=('boost-libs'
         'bzip2'
         'cairo'
         'expat'
         'glu'
         'libffi'
         'libgl'
         'libmariadbclient'
         'openssl'
         'qt4'
         'sqlite'
         'v8'
         'zlib')
makedepends=('boost' 'scons')
provides=('camotics')
replaces=('openscam')
source=("$pkgname::git+https://github.com/CauldronDevelopmentLLC/CAMotics.git"
        "git+https://github.com/CauldronDevelopmentLLC/cbang.git"
        "camotics.desktop")
md5sums=('SKIP' 'SKIP' 'bca9df64570c6c6e6773e8428e27cfb8')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/cbang"
  scons qt_version=4
  export CBANG_HOME=$PWD

  cd "$srcdir/$pkgname"
  scons qt_version=4
}

package() {
  cd "$srcdir"
  install -Dm644 "camotics.desktop" \
          "$pkgdir/usr/share/applications/camotics.desktop"
  cd "$srcdir/$pkgname"
  install -Dm644 "images/camotics.png" "$pkgdir/usr/share/pixmaps/camotics.png"
  scons install compiler=gnu install_prefix="$pkgdir/usr" qt_version=4
}
