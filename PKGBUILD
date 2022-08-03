# -*- shell-script -*-
# Maintainer: <aggraef at gmail.com>
# Contributor: <aggraef at gmail.com>

# This is Jonathan Wilkes' nw.js variant of Pd-L2Ork nick-named "Purr-Data".
# Basically, it is Pd-L2Ork with the Tk GUI replaced with a JavaScript GUI
# implemented using nw.js (http://nwjs.io/).

# This is a "stable" snapshot of purr-data, meaning that it will be updated
# less frequently, and ideally only after some testing. As an alternative,
# there's also the purr-data-git package which builds straight from the latest
# upstream source, also available from the AUR.

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
pkgver=2.17.0.r4864.8345b481
pkgrel=1
pkgdesc="Jonathan Wilkes' nw.js variant of Pd-L2Ork (git version)"
url="https://agraef.github.io/purr-data/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('bluez-libs' 'desktop-file-utils' 'dssi' 'fftw'
  'flite' 'fluidsynth' 'freeglut' 'ftgl' 'glew'
  'gsl' 'gsm' 'hicolor-icon-theme' 'imagemagick' 'jack' 'ladspa' 'lame'
  'libdc1394' 'libdv' 'libgl' 'libiec61883' 'libjpeg'
  'libxxf86vm' 'libtiff' 'libraw1394'
  'libv4l' 'libvorbis' 'portaudio'
  'smpeg' 'speex' 'stk' 'zlib' 'lua'
  'alsa-lib' 'gconf' 'gtk2' 'gtk3' 'nss' 'libxtst' 'libxss' 'ttf-dejavu')
makedepends=('autoconf' 'automake' 'libtool' 'git' 'rsync' 'python2')
conflicts=('purr-data')
install=purr-data.install
options=('!makeflags' '!strip')
# jwilkes' upstream repo is available at:
# "$pkgname::git+https://git.purrdata.net/jwilkes/purr-data.git"
# But we use the "release" branch in our own fork instead, which is used
# solely for packaging purposes.
source=("$pkgname::git+https://bitbucket.org/agraef/purr-data.git#branch=release")
# nw.js sdk binaries
nwjsname=nwjs-sdk
nwjsver=0.28.1
source_common="http://dl.nwjs.io/v$nwjsver/$nwjsname-v$nwjsver-linux"
source_i686=("$source_common-ia32.tar.gz")
source_x86_64=("$source_common-x64.tar.gz")

sha256sums=('SKIP')
sha256sums_i686=('3957c21f2fd7902bb940e6d02c33a30afdaddf76cf1972ac3828524859cb3304')
sha256sums_x86_64=('016cff36d5a79eb2163d5b399c00456b898613c3de4839c56325a2dcc0822c19')

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

# Run 'makepkg buildopt=incremental' for an incremental build (this skips
# recompiling Gem which takes a *long* time to build) or 'makepkg
# buildopt=light' for a light one (only essential externals).
buildopt=${buildopt:-}

pkgver() {
  cd $srcdir/$pkgname
  printf "%s.r%s.%s" "$(grep PD_L2ORK_VERSION pd/src/m_pd.h | sed 's|^.define *PD_L2ORK_VERSION *"\(.*\)".*|\1|')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname
  # first make sure that we get the sources in pristine state again, so that
  # our patches apply cleanly
  make realclean
  # check out the latest source of all submodules
  make checkout
  # copy the nw.js sources to where purr-data wants them
  rm -rf pd/nw/nw
  cp -a $srcdir/$nwjsname-v$nwjsver-linux-$_arch pd/nw/nw
}

build() {
  unset CFLAGS CPPFLAGS CXXFLAGS DEBUG_CFLAGS DEBUG_CXXFLAGS LDFLAGS INCLUDES
  cd $srcdir/$pkgname
  make prefix="$prefix" $buildopt
}

package() {
  cd $srcdir/$pkgname
  make install prefix="$prefix" DESTDIR="$pkgdir"
  cd "$srcdir/$pkgname/packages/linux_make/build"
  # Create a link to the executable.
  mkdir -p "$pkgdir/usr/bin"
  ln -sf $prefix/bin/pd-l2ork "$pkgdir/usr/bin/purr-data"
  # Create links to the include and lib directories.
  mkdir -p "$pkgdir/usr/include"
  ln -sf $prefix/include/pd-l2ork "$pkgdir/usr/include/purr-data"
  mkdir -p "$pkgdir/usr/lib"
  ln -sf $prefix/lib/pd-l2ork "$pkgdir/usr/lib/purr-data"
  # Edit bash completion file.
  sed -e 's/pd-l2ork/purr-data/g' < "$pkgdir/etc/bash_completion.d/pd-l2ork" > "$pkgdir/etc/bash_completion.d/purr-data"
  rm -f "$pkgdir/etc/bash_completion.d/pd-l2ork"
  # For now we just remove the Emacs mode as it will conflict with the
  # pd-l2ork package.
  rm -rf "$pkgdir/usr/share/emacs/site-lisp"
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
