# Maintainer: James Bunton <jamesbunton@delx.net.au>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=('handbrake-fdkaac' 'handbrake-cli-fdkaac')
pkgver=0.10.5
pkgrel=2
arch=('i686' 'x86_64')
url="https://handbrake.fr/"
license=('GPL')
makedepends=('intltool' 'python2' 'yasm' 'wget' 'bzip2' 'gcc-libs' 'libnotify'
             'gst-plugins-base' 'gtk3' 'dbus-glib' 'fribidi' 'libass' 'lame'
             'fontconfig' 'freetype2' 'libxml2' 'libogg' 'libvorbis' 'cmake'
             'libtheora' 'libsamplerate' 'libbluray' 'x264' 'libx264'
             'libdvdnav' 'librsvg' 'libgudev' 'libfdk-aac')
source=(https://handbrake.fr/mirror/HandBrake-$pkgver.tar.bz2)
sha256sums=('fb9230dd121b456f6829d1d25ac8bbf76e503b51c4efc70f0a7fd2bb8607e2f0')

prepare() {
  cd "$srcdir/HandBrake-$pkgver"

  # Use more system libs
  # We had ffmpeg here as well but it broke PGS subtitle processing
  # https://forum.handbrake.fr/viewtopic.php?f=13&t=27581
  sed -i \
    -e '/MODULES += contrib\/libbluray/d' \
    -e '/MODULES += contrib\/libdvdnav/d' \
    -e '/MODULES += contrib\/libdvdread/d' \
    make/include/main.defs
}

build() {
  cd "$srcdir/HandBrake-$pkgver"

  export CXXFLAGS="${CXXFLAGS} -std=gnu++98"
  export CPPFLAGS="${CPPFLAGS} -std=gnu++98"
  ./configure \
    --prefix=/usr \
    --force \
    --disable-gtk-update-checks \
    --enable-fdk
  cd build
  make
}

package_handbrake-fdkaac() {
  pkgdesc="Multithreaded video transcoder"
  conflicts=('handbrake')
  depends=('bzip2' 'gcc-libs' 'gst-plugins-base' 'libnotify' 'dbus-glib'
           'fribidi' 'libass' 'lame' 'gtk3' 'fontconfig' 'freetype2' 'libxml2'
           'libogg' 'libvorbis' 'libtheora' 'libsamplerate' 'libbluray'
           'libx264' 'libdvdnav' 'librsvg' 'libgudev' 'desktop-file-utils'
           'hicolor-icon-theme' 'libfdk-aac')
  depends+=('libx264.so')
  optdepends=('gst-plugins-good: for video previews'
              'gst-libav: for video previews')

  cd "$srcdir/HandBrake-$pkgver/build"

  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-cli-fdkaac() {
  pkgdesc="Multithreaded video transcoder (CLI)"
  conflicts=('handbrake-cli')
  depends=('bzip2' 'gcc-libs' 'zlib' 'fribidi' 'libass' 'lame' 'libxml2'
           'libtheora' 'libsamplerate' 'libbluray' 'libx264' 'libdvdnav'
           'libfdk-aac')
  depends+=('libx264.so')

  cd "$srcdir/HandBrake-$pkgver/build"
  install -D HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
}

# vim:set ts=2 sw=2 et:
