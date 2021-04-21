# Maintainer: Philip Johansson <philipphuket at gmail dotcom>
pkgname=st-pajas
pkgver=0.8.4
pkgrel=1
pkgdesc='Pajas version of suckless with scrollback, alpha, nordtheme and Vertcenter'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=(libxft)
provides=('st')
url=https://github.com/flyingpeakock/st
_patches=( https://raw.githubusercontent.com/flyingpeakock/st/main/patch-$pkgver.diff )
source=(https://dl.suckless.org/st/st-$pkgver.tar.gz
        "${_patches[@]}"
	)
sha256sums=('d42d3ceceb4d6a65e32e90a5336e3d446db612c3fbd9ebc1780bc6c9a03346a6'
            '144f56606e2119990eeadfc10a3eda8ba7e481c1dcf15dc16588956d958bbc06')
_sourcedir=st-$pkgver
_makeopts="--directory=$_sourcedir"

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
  for patch in "${_patches[@]}"; do
    echo "Applying patch $(basename $patch)..."
	ls
    patch --directory="$_sourcedir" < $(basename $patch)
  done
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
  make $_makeopts X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  local installopts='--mode 0644 -D --target-directory'
  local shrdir="$pkgdir/usr/share"
  local licdir="$shrdir/licenses/st"
  local docdir="$shrdir/doc/st"
  make $_makeopts PREFIX=/usr DESTDIR="$pkgdir" install
  install $installopts "$licdir" "$_sourcedir/LICENSE"
  install $installopts "$docdir" "$_sourcedir/README.md"
  install $installopts "$shrdir/st" "$_sourcedir/st.info"
}
