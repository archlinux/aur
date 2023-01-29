# -*- shell-script -*-
# Maintainer: <aggraef at gmail.com>
# Contributor: <aggraef at gmail.com>

# This is Jonathan Wilkes' nw.js variant of Pd-L2Ork nick-named "Purr-Data".
# Basically, it is Pd-L2Ork with the Tk GUI replaced with a JavaScript GUI
# implemented using nw.js (http://nwjs.io/).

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

pkgname=purr-data-git
pkgver=2.19.0.r5002.58e47c1fb
pkgrel=1
pkgdesc="Jonathan Wilkes' nw.js variant of Pd-L2Ork (git version)"
url="https://git.purrdata.net/jwilkes/purr-data"
arch=('i686' 'x86_64')
license=('BSD')
depends=('bluez-libs' 'desktop-file-utils' 'dssi' 'fftw'
  'flite' 'fluidsynth' 'freeglut' 'ftgl' 'glew'
  'gsl' 'gsm' 'hicolor-icon-theme' 'imagemagick' 'jack' 'ladspa' 'lame'
  'libdc1394' 'libdv' 'libgl' 'libiec61883' 'libjpeg'
  'libxxf86vm' 'libtiff' 'libiec61883' 'libraw1394'
  'libv4l' 'libvorbis' 'portaudio'
  'smpeg' 'speex' 'stk' 'zlib' 'lua'
  'alsa-lib' 'gconf' 'gtk2' 'nss' 'libxtst' 'libxss' 'ttf-dejavu')
makedepends=('autoconf' 'automake' 'libtool' 'git' 'rsync')
provides=('purr-data')
conflicts=('purr-data')
install=purr-data.install
options=('!makeflags' '!strip')
source=("$pkgname::git+https://git.purrdata.net/jwilkes/purr-data.git")
md5sums=('SKIP')
# nw.js sdk binaries
nwjsname=nwjs-sdk
nwjsver=0.28.3
source_common="http://dl.nwjs.io/v$nwjsver/$nwjsname-v$nwjsver-linux"
source_i686=("$source_common-ia32.tar.gz")
source_x86_64=("$source_common-x64.tar.gz")
md5sums_i686=('858a5269dc7072c8d9e8ce9e880e4112')
md5sums_x86_64=('c80b2b25b8b482568754f2bb586030a9')

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
  # first make sure that we get any checked out submodules in pristine state
  # again, so that our patches apply cleanly
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
