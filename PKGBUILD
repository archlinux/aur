pkgname=augety-st
pkgver=0.9.2
pkgrel=2
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('MIT')
depends=('libxft' 'ttf-hack-nerd')
url="http://augety.net/augety/st"
source=(terminfo.patch
        README.terminfo.rst
        "$pkgname::git+http://augety.net/augety/st.git")
sha256sums=('f9deea445a5c6203a0e8e699f3c3b55e27275f17fb408562c4dd5d649edeea23'
            '95be3197f7de77a0fe2e4f527202e17e910ee24e1ed6bc39beb320a1304bb7e1'
            'SKIP')
_sourcedir=$pkgname

prepare() {
  patch -d "$_sourcedir" -p 0 < terminfo.patch

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
  #                         file will be copied to $_sourcedir and used during
  #                         build.
  #
  # After this test, config.def.h is copied from $_sourcedir to $BUILDDIR to
  # provide an up to date template for the user.
}

build() {
  make -C "$_sourcedir"
}

package() {
  local shrdir="$pkgdir/usr/share"
  make -C "$_sourcedir" PREFIX=/usr DESTDIR="$pkgdir" install
  install -D -m 0644 -t "$shrdir/licenses/$pkgname" "$_sourcedir/LICENSE"
  install -D -m 0644 -t "$shrdir/doc/$pkgname" "$_sourcedir/README" README.terminfo.rst
  install -D -m 0644 -t "$shrdir/$pkgname" "$_sourcedir/st.info"
}
