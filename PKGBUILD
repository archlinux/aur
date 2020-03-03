# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=sowm
pkgver=1.6
pkgrel=1
pkgdesc='An itsy bitsy floating window manager'
arch=('x86_64')
license=('MIT')
depends=('libx11')
url=https://github.com/dylanaraps/sowm
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/dylanaraps/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('7e1d1391f8cf8d1b04458d0b4bb3b61684b535dddcc1dd7d37266e81efd57e02')

_sourcedir=$pkgname-$pkgver
_makeopts=""

prepare() {
  # This package provides a mechanism to provide a custom config.h. Multiple
  # configuration states are determined by the presence of two files in
  # $BUILDDIR:
  #
  # config.h  config.def.h  state
  # ========  ============  =====
  # absent    absent        Initial state. The user receives a message on how
  #                         to configure this package.
  # absent    present       The user was previously made aware of the
  #                         configuration options and has not made any
  #                         configuration changes. The package is built using
  #                         default values.
  # present                 The user has supplied his or her configuration. The
  #                         file will be copied to $srcdir and used during
  #                         build.
  #
  # After this test, config.def.h is copied from $srcdir to $BUILDDIR to
  # provide an up to date template for the user.
  if [ -e "$BUILDDIR/config.h" ]
  then
    cp "$BUILDDIR/config.h" "$_sourcedir"
  elif [ ! -e "$BUILDDIR/config.def.h" ]
  then
    msg='This package can be configured in config.h. Copy the config.def.h '
    msg+='that was just placed into the package directory to config.h and '
    msg+='modify it to change the configuration. Or just leave it alone to '
    msg+='continue to use default values.'
    warning "$msg"
  fi
  cp "$_sourcedir/config.def.h" "$BUILDDIR"
}

build() {
  cd $_sourcedir
  make $_makeopts
}

package() {
  cd $_sourcedir
  local installopts='--mode 0644 -D --target-directory'
  local shrdir="$pkgdir/usr/share"
  local licdir="$shrdir/licenses/$pkgname"
  local docdir="$shrdir/doc/$pkgname"
  make $_makeopts PREFIX=/usr DESTDIR="$pkgdir" install
  install $installopts "$licdir" "LICENSE.md"
  install $installopts "$docdir" "README.md"
}

