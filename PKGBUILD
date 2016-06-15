# Maintainer: <aggraef at gmail.com>
# Contributor: <fero dot kiraly at gmail.com>

# This always builds the latest git revision of pd-l2ork. Note that this may
# be broken at times due to intermittent upstream changes. For the latest
# *stable* release please use the pd-l2ork package instead.

# This package can be installed along with pd or pd-extended. To avoid
# conflicts with these, cyclist, pdsend and pdreceive can be found under
# /usr/lib/pd-l2ork/bin instead. Likewise, the Gem include files get installed
# under /usr/include/pd-l2ork.

pkgname=pd-l2ork-git
pkgver=r1705.ea4eb01
pkgrel=1
pkgdesc="L2Ork (Linux Laptop Orchestra) version of PureData (git version)"
url="http://l2ork.music.vt.edu/main/?page_id=56"
arch=('i686' 'x86_64')
license=('BSD')
depends=('bluez-libs' 'desktop-file-utils' 'dssi' 'fftw'
  'flite1' 'fluidsynth' 'freeglut' 'ftgl' 'glew' 'gmerlin'
  'gsl' 'gsm' 'hicolor-icon-theme' 'imagemagick' 'jack' 'ladspa' 'lame'
  'libdc1394' 'libdv' 'libgl' 'libiec61883' 'libjpeg' 'libquicktime'
  'libxxf86vm' 'libtiff' 'libiec61883' 'libunicap' 'libraw1394'
  'libsndobj-cvs' 'libv4l' 'libvorbis' 'lua51' 'portaudio'
  'smpeg' 'speex' 'stk' 'tk' 'tkpng' 'vlc' 'xapian-tcl-bindings' 'zlib')
makedepends=('autoconf' 'automake' 'libtool' 'git')
provides=('pd-l2ork')
conflicts=('pd-l2ork')
install=pd-l2ork.install
options=('!makeflags')
source=("$pkgname::git+https://github.com/pd-l2ork/pd.git"
	"Gem-pix_colorclassify.patch"
	"RTcmix-pd-LCPLAY-stabilize.patch")
md5sums=('SKIP'
         '33dc1880e38ac8dbc7aa5075bfe49abd'
         '39c53063dc18681f29b12c08d9c453aa')

pkgver() {
  cd $srcdir/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname
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
  inst_dir=/usr ./tar_em_up.sh -F -n
}

package() {
  cd "$srcdir/$pkgname/packages/linux_make/build"
  mv usr "$pkgdir"
  # Extra L2Ork-specific stuff that doesn't get installed automatically.
  cd "$srcdir/$pkgname"
  cp -Rf l2ork_addons/K12 "$pkgdir/usr/lib/pd-l2ork/extra"
  install -d "$pkgdir/etc/bash_completion.d"
  cp -f scripts/bash_completion/pd-l2ork "$pkgdir/etc/bash_completion.d"
  # Remove extra packaging files.
  cd "$pkgdir/usr"
  rm -f Makefile README.txt
  # Move pdsend and pdreceive to avoid conflicts with other Pd versions.
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
  # Extra icons, desktop files and mime types.
  cd "$srcdir/$pkgname/packages/linux_make"
  cp -f pd-l2ork.gif "$pkgdir/usr/lib/pd-l2ork"
  install -d "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  cp -f pd-l2ork*.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/"
  install -d "$pkgdir/usr/share/icons/hicolor/128x128/mimetypes"
  cp -f text-x-pd-l2ork.png "$pkgdir/usr/share/icons/hicolor/128x128/mimetypes/"
  install -d "$pkgdir/usr/share/applications"
  cp -f pd-l2ork*.desktop "$pkgdir/usr/share/applications/"
  install -d "$pkgdir/usr/share/mime/packages"
  cp -f pd-l2ork.xml "$pkgdir/usr/share/mime/packages/"
  # Default prefs file.
  install -d "$pkgdir/etc/pd-l2ork"
  ln -s -f /usr/lib/pd-l2ork/default.settings "$pkgdir/etc/pd-l2ork/default.settings"
  cp -f default.settings "$pkgdir/usr/lib/pd-l2ork"
}

# vim:set ts=2 sw=2 et:
