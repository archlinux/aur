# Maintainer: <aggraef at gmail.com>
# Contributor: <aggraef at gmail.com>

# This is Jonathan Wilkes' nw.js variant of Pd-L2Ork nick-named "Purr-Data".
# Basically, it is Pd-L2Ork with the Tk GUI replaced with a JavaScript GUI
# implemented using nw.js (http://nwjs.io/).

# This is a "stable" snapshot of purr-data, meaning that it will be updated
# less frequently, and ideally only after some testing. As an alternative,
# there's also the purr-data-git package which builds straight from the latest
# upstream source, also available from the AUR.

# NOTE: This is BETA software which is still under development, so expect some
# bugs and ongoing changes in some parts of the program and its library. If
# you want a stable version of Pd-L2Ork ready for production use, you may want
# to use the pd-l2ork or pd-l2ork-git package instead. That said, purr-data
# has been coming along nicely and should be ready for daily use already. If
# necessary, you can also install both purr-data and pd-l2ork on the same
# system.

# This package can be installed alongside pd-l2ork, as well as vanilla pd or
# pd-extended. To avoid conflicts with any of these, the main contents of the
# package can be found under /opt/purr-data by default (you can change this
# with the prefix variable below). Thus cyclist, pdsend, pdreceive and
# purr-data's main pd-l2ork binary itself can be found under
# /opt/purr-data/bin. The include and library files are under the same
# prefix. Also, a symbolic link purr-data is created under /usr/bin so that
# the program can be invoked easily from the command line. Likewise, links to
# the include and lib directories are created under /usr/include/purr-data and
# /usr/lib/purr-data, so that 3rd party externals know where to find these.

pkgname=purr-data
pkgver=2.0.r3321.6c86b010
pkgrel=1
pkgdesc="Jonathan Wilkes' nw.js variant of Pd-L2Ork (git version)"
url="https://git.purrdata.net/jwilkes/purr-data"
arch=('i686' 'x86_64')
license=('BSD')
depends=('bluez-libs' 'desktop-file-utils' 'dssi' 'fftw'
  'flite1' 'fluidsynth' 'freeglut' 'ftgl' 'glew' 'gmerlin'
  'gsl' 'gsm' 'hicolor-icon-theme' 'imagemagick' 'jack' 'ladspa' 'lame'
  'libdc1394' 'libdv' 'libgl' 'libiec61883' 'libjpeg' 'libquicktime'
  'libxxf86vm' 'libtiff' 'libiec61883' 'libunicap' 'libraw1394'
  'libsndobj-git' 'libv4l' 'libvorbis' 'lua51' 'portaudio'
  'smpeg' 'speex' 'stk' 'tk' 'tkpng' 'vlc' 'xapian-tcl-bindings' 'zlib'
  'alsa-lib' 'gconf' 'gtk2' 'nss' 'libxtst' 'libxss' 'ttf-dejavu')
makedepends=('autoconf' 'automake' 'libtool' 'git' 'rsync')
conflicts=('purr-data')
install=purr-data.install
options=('!makeflags' '!strip')
# This is jwilkes' upstream repo:
# "$pkgname::git+https://git.purrdata.net/jwilkes/purr-data.git"
# But we rather use a special "release" branch in our own fork instead, which
# is used solely for packaging purposes. This branch gets updated whenever we
# have a new (and tested) revision to be pushed out (as well as official
# releases once they start coming out). This is easier to maintain, doesn't
# depend on upstream tagging releases and candidates, and also allows us to
# deal with situations where upstream lags behind on already submitted merge
# requests with important bugfixes and additions.
source=("$pkgname::git+https://git.purrdata.net/aggraef/purr-data.git#branch=release"
	"RTcmix-pd-LCPLAY-stabilize.patch"
	"userconfig.patch")
md5sums=('SKIP'
         '39c53063dc18681f29b12c08d9c453aa'
         '056770a94f3c13799c09d3ece273154f')
# nw.js sdk binaries
nwjsname=nwjs-sdk
nwjsver=0.18.5
source_common="http://dl.nwjs.io/v$nwjsver/$nwjsname-v$nwjsver-linux"
source_i686=("$source_common-ia32.tar.gz")
source_x86_64=("$source_common-x64.tar.gz")
md5sums_i686=('1d5e9e25c36b7c3221e317baa7d94b64')
md5sums_x86_64=('3c6391a30c74531e918c7434caa2730f')

if [ "$CARCH" = "i686" ]; then
  _arch="ia32"
elif [ "$CARCH" = "x86_64" ]; then
  _arch="x64"
fi

# Installation prefix. This must be something other than /usr if you want to
# install Purr Data alongside Pd-L2Ork. Note that some items such as desktop
# files and icons will still be installed under /usr so that the system finds
# them, but they will be renamed to prevent name clashes with files from the
# pd-l2ork package.
prefix=${prefix:-/opt/purr-data}

# Run 'makepkg buildopt=-b' for an incremental build (this skips recompiling
# Gem which takes a *long* time to build). Note that this will only produce a
# proper package if src still contains the results of a previous full build,
# otherwise Gem will be missing in the resulting package!
buildopt=${buildopt:--B}

pkgver() {
  cd $srcdir/$pkgname
  printf "%s.r%s.%s" "$(grep PD_L2ORK_VERSION pd/src/m_pd.h | sed 's|^.define *PD_L2ORK_VERSION *"\(.*\)".*|\1|')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname
  # first make sure that we get any checked out submodules in pristine state
  # again, so that our patches apply cleanly
  git submodule foreach git checkout .
  # check out the latest source of all submodules
  git submodule update --init
  # copy the nw.js sources to where purr-data wants them
  rm -rf pd/nw/nw
  cp -a $srcdir/$nwjsname-v$nwjsver-linux-$_arch pd/nw/nw
  # make the sources compile with gcc 6.1+
  cd $srcdir/$pkgname/externals/rtcmix-in-pd && patch -Np1 < $srcdir/RTcmix-pd-LCPLAY-stabilize.patch
  # patch the user config dir name so that purr-data can coexist with pd-l2ork
  cd $srcdir/$pkgname && patch -Np1 < $srcdir/userconfig.patch
}

build() {
  unset CFLAGS
  unset LDFLAGS
  unset INCLUDES

  cd $srcdir/$pkgname/l2ork_addons
  inst_dir=$prefix ./tar_em_up.sh $buildopt -n
}

package() {
  cd "$srcdir/$pkgname/packages/linux_make/build"
  cp -a * "$pkgdir"
  # Create a link to the executable.
  mkdir -p "$pkgdir/usr/bin"
  ln -sf $prefix/bin/pd-l2ork "$pkgdir/usr/bin/purr-data"
  # Create links to the include and lib directories.
  mkdir -p "$pkgdir/usr/include"
  ln -sf $prefix/include/pd-l2ork "$pkgdir/usr/include/purr-data"
  mkdir -p "$pkgdir/usr/lib"
  ln -sf $prefix/lib/pd-l2ork "$pkgdir/usr/lib/purr-data"
  # Just remove all the /etc stuff and the Emacs mode for now, we don't really
  # need these.
  rm -rf "$pkgdir/etc" "$pkgdir/usr/share/emacs"
  # Edit the library paths in the default user.settings file so that it
  # matches our install prefix.
  cd "$pkgdir$prefix/lib/pd-l2ork"
  sed -e "s!/usr/lib/pd-l2ork!$prefix/lib/pd-l2ork!g" -i default.settings
  # Replace the pd-l2ork desktop/mime files and icons with purr-data ones, so
  # that pd-l2ork can be installed alongside purr-data. We also remove the K12
  # desktop files which aren't needed since K12 mode is not supported by
  # purr-data (yet).
  cd "$pkgdir/usr/share/applications"
  sed -e 's/pd-l2ork/purr-data/g' -e 's/Pd-L2Ork/Purr-Data/g' < pd-l2ork.desktop > purr-data.desktop
  sed -e 's/pd-l2ork/purr-data/g' -e 's/Pd-L2Ork/Purr-Data/g' < pd-l2ork-debug.desktop > purr-data-debug.desktop
  rm -f pd-l2ork*.desktop
  cd "$pkgdir/usr/share/mime/packages"
  sed -e 's/pd-l2ork/purr-data/g' < pd-l2ork.xml > purr-data.xml
  rm -f pd-l2ork.xml
  cd "$pkgdir/usr/share/icons/hicolor/128x128/apps/"
  rm -f pd-l2ork-k12*.png
  mv pd-l2ork.png purr-data.png
  mv pd-l2ork-red.png purr-data-red.png
  cd "$pkgdir/usr/share/icons/hicolor/128x128/mimetypes/"
  mv text-x-pd-l2ork.png text-x-purr-data.png
  # Remove libtool archives and extra object files.
  cd "$pkgdir$prefix"
  rm -f lib/pd-l2ork/extra/*/*.la lib/pd-l2ork/extra/*/*.pd_linux_o
  # Sanitize permissions.
  cd "$pkgdir"
  chmod -R go-w *
  chmod -R a+r *
  chmod a-x .$prefix/lib/pd-l2ork/default.settings
  find .$prefix/lib/pd-l2ork/bin/nw -executable -not -type d -exec chmod a+x {} +
  #find . -executable -name '*.pd_linux' -exec chmod a-x {} +
  find . -executable -name '*.pd' -exec chmod a-x {} +
  find . -executable -name '*.txt' -exec chmod a-x {} +
  find . -executable -name '*.aif*' -exec chmod a-x {} +
  find . -type d -exec chmod a+x {} +
}

# vim:set ts=2 sw=2 et:
