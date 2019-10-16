# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Sebastian J. Bronner <waschtl@sbronner.com>
# Contributor: Patrick Jackson <PatrickSJackson gmail com>
# Contributor: Christoph Vigano <mail@cvigano.de>

pkgname=st
pkgver=0.8.2
pkgrel=6
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=(libxft)
makedepends=(libxext ncurses)
url="http://st.suckless.org"
source=(http://dl.suckless.org/st/$pkgname-$pkgver.tar.gz)
sha256sums=('aeb74e10aa11ed364e1bcc635a81a523119093e63befd2f231f8b0705b15bf35')

prepare() {
  sed '/@tic/d' -i $pkgname-$pkgver/Makefile

  # This package provides a mechanism to provide a custom config.h. Multiple
  # configuration states are determined by the presence of two files in
  # $BUILDDIR:
  #
  # * config.h: The user has supplied his or her configuration. The file will
  #   be copied to $srcdir and used during build.
  # * config.def.h only: The user was previously made aware of the
  #   configuration options and has opted not to make any configuration
  #   changes. The package is built using default values.
  # * neither file: Initial state. The user receives a message on how to
  #   configure this package. The build process is aborted after the copy
  #   operation below.
  #
  # After this test, config.def.h is copied from $srcdir to provide an up to
  # date template for the user. If neither file was present initially, further
  # build steps are aborted at this point. Even if no config.h is provided,
  # future runs will proceed with default values due to the presence of
  # config.def.h.
  abort=
  if [ -e "$BUILDDIR/config.h" ]
  then
    cp "$BUILDDIR/config.h" "$pkgname-$pkgver"
  elif [ ! -e "$BUILDDIR/config.def.h" ]
  then
    abort=1
    msg='This package can be configured in config.h. Copy config.def.h just '
    msg+='placed into the package directory to config.h and modify it to '
    msg+='change the configuration. Or just leave it alone to use default '
    msg+='values. Then restart the build process.'
    error "$msg"
  fi
  cp "$pkgname-$pkgver/config.def.h" "$BUILDDIR"
  test -z "$abort"
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
