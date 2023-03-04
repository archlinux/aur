# Maintainer: DarthChungo <antonio@adaro.eu>

# Based on st-git by:
# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Static_Rocket
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: Sebastian J. Bronner <waschtl@sbronner.com>
# Contributor: Patrick Jackson <PatrickSJackson gmail com>
# Contributor: Christoph Vigano <mail@cvigano.de>

pkgname=st-usable-git
pkgver=0.9.r43.e6e4518
pkgrel=2
pkgdesc='A simple virtual terminal emulator for X, with popular patches included.'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=(libxft)
makedepends=('ncurses' 'libxext' 'git')
provides=(st)
conflicts=(st)
url=https://github.com/DarthChungo/st-usable/
source=(st-usable::git+https://github.com/DarthChungo/st-usable.git
	terminfo.patch)
sha256sums=(SKIP
            SKIP)
_gitname="st-usable"
_sourcedir="$_gitname"
_gitdir=${pkgname%'-git'}
_startdir=$PWD

pkgver() {
  cd "${_sourcedir}"
  _pkgver=$(awk '/VERSION/ {print $3}' config.mk|head -1)
  echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  patch -d"$_sourcedir" -p1 < terminfo.patch

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

  if [ -e "$BUILDDIR/config.h" ]; then
    cp "$BUILDDIR/config.h" "$_sourcedir"

  elif [ ! -e "$BUILDDIR/config.def.h" ]; then
    msg='This package can be configured in config.h. Copy the config.def.h '
    msg+='that was just placed into the package directory to config.h and '
    msg+='modify it to change the configuration. Or just leave it alone to '
    msg+='continue to use default values.'
    warning "$msg"
  fi

  cp "$_sourcedir/config.def.h" "$BUILDDIR"
}

build() {
  make -C "$_sourcedir" X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
  mkdir "$_sourcedir/terminfo"
  tic -sx -o "$_sourcedir/terminfo" "$_sourcedir/st.info"
}

package() {
  local shrdir="$pkgdir/usr/share"
  make -C "$_sourcedir" PREFIX=/usr DESTDIR="$pkgdir" install
  find "$_sourcedir/terminfo/s/" -type f -exec install -m 0644 -D -t "$shrdir/terminfo/s/" {} \;
  install -m 0644 -D -t "$shrdir/applications/" "$_sourcedir/st.desktop"
  install -m 0644 -D -t "$shrdir/licenses/$_gitname" "$_sourcedir/LICENSE"
  install -m 0644 -D -t "$shrdir/doc/$_gitname" "$_sourcedir/README.md"
  install -m 0644 -D -t "$shrdir/$_gitname" "$_sourcedir/st.info"
}
