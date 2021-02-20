pkgname=st-luca
pkgver=0.8.4
pkgrel=1
pkgdesc='Lucas Version of Suckless terminal with (all) scrollback and newterm patches'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=(libxft)
url=https://github.com/quoteme/st
_patches=("https://raw.githubusercontent.com/Quoteme/st/master/st-scrollback-20200419-72e3f6c.diff"
          "https://raw.githubusercontent.com/Quoteme/st/master/st-scrollback-mouse-20191024-a2c479c.diff"
          "https://raw.githubusercontent.com/Quoteme/st/master/st-scrollback-mouse-altscreen-20200416-5703aa0.diff"
          "https://raw.githubusercontent.com/Quoteme/st/master/st-newterm-scrollbackfix.diff"
          "https://raw.githubusercontent.com/Quoteme/st/master/st-scientificafont.diff")
source=(https://dl.suckless.org/st/st-$pkgver.tar.gz
        "${_patches[@]}"
	)
sha256sums=('d42d3ceceb4d6a65e32e90a5336e3d446db612c3fbd9ebc1780bc6c9a03346a6'
            '1e41fe17a5ef5a8194eea07422b49d815e2c2bb4d58d84771f793be423005310'
            '319458d980195d18fa0f81a6898d58f8d046c5ff982ab872d741f54bb60e267d'
            'cb87eb654985da46ff63663407184402393ad3d3013c8795570552fe56a15b9d'
            '321cd37aca1cc99c47754d773e13bd8b9c7162f3b9f01e946495b594422a38c6'
            '77b7920577d2751f9bb68f5781d832bd09f0051b4b4115463d627bd864c47e13')
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
  install $installopts "$docdir" "$_sourcedir/README"
  install $installopts "$shrdir/st" "$_sourcedir/st.info"
}
