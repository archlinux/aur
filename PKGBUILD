# Maintainer: <aggraef at gmail.com>
# Contributor: <fero dot kiraly at gmail.com>

# This always builds the latest stable upstream release of pd-l2ork. To build
# the very latest git revision please use the pd-l2ork-git package instead.

# This package can be installed along with pd or pd-extended. To avoid
# conflicts with these, cyclist, pdsend and pdreceive can be found under
# /usr/lib/pd-l2ork/bin instead. Likewise, the Gem include files get installed
# under /usr/include/pd-l2ork.

pkgname=pd-l2ork
pkgver=20160619.r1716.a1424f0
pkgrel=1
pkgdesc="L2Ork (Linux Laptop Orchestra) version of PureData"
url="http://l2ork.music.vt.edu/main/?page_id=56"
arch=('i686' 'x86_64')
license=('BSD')
depends=('bluez-libs' 'desktop-file-utils' 'dssi' 'fftw'
  'flite1' 'fluidsynth' 'freeglut' 'ftgl' 'glew' 'gmerlin'
  'gsl' 'gsm' 'hicolor-icon-theme' 'imagemagick' 'jack' 'ladspa' 'lame'
  'libdc1394' 'libdv' 'libgl' 'libiec61883' 'libjpeg' 'libquicktime'
  'libxxf86vm' 'libtiff' 'libiec61883' 'libunicap' 'libraw1394'
  'libsndobj-git' 'libv4l' 'libvorbis' 'lua51' 'portaudio'
  'smpeg' 'speex' 'stk' 'tk' 'tkpng' 'vlc' 'xapian-tcl-bindings' 'zlib')
makedepends=('autoconf' 'automake' 'libtool' 'git')
conflicts=('pd-l2ork')
install=pd-l2ork.install
options=('!makeflags')
source=("$pkgname::git+https://github.com/pd-l2ork/pd.git#commit=a1424f03364e5cbb79a19ee4142c6b4c101f597c"
	"Gem-pix_colorclassify.patch"
	"RTcmix-pd-LCPLAY-stabilize.patch")
md5sums=('SKIP'
         '33dc1880e38ac8dbc7aa5075bfe49abd'
         '39c53063dc18681f29b12c08d9c453aa')

# Run 'makepkg buildopt=-b' for an incremental build (this skips recompiling
# Gem which takes a *long* time to build). Note that this will only produce a
# proper package if src still contains the results of a previous full build,
# otherwise Gem will be missing in the resulting package!
buildopt=${buildopt:--B}

pkgver() {
  cd $srcdir/$pkgname
  printf "%s.r%s.%s" "$(git log -1 --format=%cd --date=short | sed -e 's/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname
  # first make sure that we get any checked out submodules in pristine state
  # again, so that our patches apply cleanly
  git submodule foreach git checkout .
  # check out the latest source of all submodules
  git submodule update --init
  # make the sources compile with gcc 6.1+
  cd $srcdir/$pkgname/Gem && patch -Np1 < $srcdir/Gem-pix_colorclassify.patch
  cd $srcdir/$pkgname/l2ork_addons/rtcmix-in-pd && patch -Np1 < $srcdir/RTcmix-pd-LCPLAY-stabilize.patch
}

build() {
  unset CFLAGS
  unset LDFLAGS
  unset INCLUDES

  cd $srcdir/$pkgname/l2ork_addons
  ./tar_em_up.sh $buildopt -n
}

package() {
  cd "$srcdir/$pkgname/packages/linux_make/build"
  cp -a * "$pkgdir"
  # Remove init.d-related stuff.
  cd "$pkgdir/etc"
  rm -rf default init.d
  # Move pdsend and pdreceive to avoid conflicts with other Pd versions.
  cd "$pkgdir/usr"
  mv bin/cyclist bin/pdreceive bin/pdsend lib/pd-l2ork/bin
  # Get rid of the corresponding manpages
  rm -f share/man/man1/pdreceive.* share/man/man1/pdsend.*
  # Move the Gem include files into the pd-l2ork include directory to prevent
  # conflicts with other packages providing these files.
  mv include/Gem include/pd-l2ork
  # Edit the Gem pkgconfig file accordingly and rename it.
  sed -e 's?/include?/include/pd-l2ork?g' -e 's?/lib/pd/extra?/lib/pd-l2ork/extra?g' < lib/pkgconfig/Gem.pc > lib/pkgconfig/pd-l2ork-Gem.pc && rm -f lib/pkgconfig/Gem.pc
  # The Japanese filename causes woes with pacman, remove it.
  #rm -f lib/pd-l2ork/doc/manuals/StartHere/+ここからスタート.pd
  # Remove libtool archives and extra object files.
  rm -f lib/pd-l2ork/extra/*/*.la lib/pd-l2ork/extra/*/*.pd_linux_o
  # Sanitize permissions.
  cd "$pkgdir"
  chmod -R go-w *
  chmod -R a+r *
  chmod a-x usr/lib/pd-l2ork/default.settings
  #find . -executable -name '*.pd_linux' -exec chmod a-x {} +
  find . -executable -name '*.pd' -exec chmod a-x {} +
  find . -executable -name '*.txt' -exec chmod a-x {} +
  find . -executable -name '*.aif*' -exec chmod a-x {} +
  find . -type d -exec chmod a+x {} +
}

# vim:set ts=2 sw=2 et:
