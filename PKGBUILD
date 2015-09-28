# Maintainer: See AUR page for contact information.

pkgname=gst123-git
pkgver=0.3.3.r245
pkgrel=1
pkgdesc="Flexible command line media player based on Gstreamer, similar to ogg123, flac123, mpg123, mpg321 and modplug123. Development version."
arch=('i686' 'x86_64')
url="http://space.twc.de/~stefan/gst123.php"
license=('LGPL2.1')
depends=('gst-plugins-base' 'gst-plugins-good' 'gst-libav' 'gtk2')
optdepends=('xdg-utils: disable screensaver during playback')
makedepends=('ncurses')
optdepends=('gst-plugins-bad:  more codecs support'
            'gst-plugins-ugly: more codecs support')
source=("$pkgname::git+http://space.twc.de/public/git/gst123.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"

  printf "%s.r%s" \
    $(grep AC_INIT configure.ac | sed -e 's|^.\+\([0-9].[0-9].[0-9]\).\+|\1|') \
    $(git rev-list --count HEAD)
}

prepare () {
  cd "$srcdir/$pkgname"

  #
  # replace ncurses5 with ncursesw5
  #
  sed -i "s_ncurses5_ncursesw5_g" configure*
  
  #
  # from the gst123 AUR pkgbuild.
  # gtkwindow appears twice (workaround fix) - seems to be gone?
  #
  # sed -i '/ rc/d' src/gtkinterface.cc
}

build() {
  cd "$srcdir/$pkgname"
  
  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
