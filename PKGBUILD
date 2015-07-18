# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: jiribb <jiribb@gmail.com>
# Contributor: David Spicer <azleifel at googlemail dot com>
# Contributor: Andrew Brouwers
# Contributor: ponsfoot @ AUR
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: David Spicer <azleifel at gmail dot com>

# NOTE: Ignore the message that "lipo" and "xcodebuild" are not found; they are for Mac OS X builds only.

_srcname=HandBrake
pkgbase=handbrake-svn_p
pkgname=('handbrake-cli-svn_p' 'handbrake-gtk-svn_p')
pkgver=r7349
pkgrel=1
pkgdesc="Multiplatform, multithreaded DVD to MPEG-4/H264/Theora converter (uses mostly system libs)"
arch=('i686' 'x86_64')
url="http://handbrake.fr/"
license=('GPL')
depends=('dbus-glib' 'desktop-file-utils' 'gst-plugins-base-libs' 'gtk3' 'jansson' 'lame' 'libass' 
    'libogg' 'libvorbis'  'libtheora' 'libsamplerate' 'libbluray' 'x265-hg_p' 'libnotify' 
    'libtheora' 'libdvdnav' 'librsvg' 'libgudev' 'libvpx-git_p' 'ffmpeg-full-git_p'
    'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'gst-plugins-ugly' 'gst-libav')
makedepends=('cmake' 'intltool' 'python2' 'gettext' 'subversion' 'yasm')
options=('!makeflags')
source=("${_srcname}::svn://svn.handbrake.fr/HandBrake/trunk")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_srcname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "${srcdir}/${_srcname}"

    # python2 substitutions
    sed -i -e '1c#! /usr/bin/python2' "gtk/src/makedeps.py"
    sed -i -e '1c#! /usr/bin/python2' "make/configure.py"

    # Use more system libs
    # x265  Gave an error so we use the bundled one maybe check this at a later time again
    for module in autoconf automake bzip2 cmake fdk-aac ffmpeg fontconfig freetype fribidi jansson lame libass \
        libbluray libdvdnav libdvdread libgnurx libiconv libmfx libogg libsamplerate libtheora libtool \
        libvorbis libvpx libxml2 m4 pkgconfig pthreadw32 x264 yasm zlib; do
        sed -i -e "/MODULES += contrib\/$module/d" make/include/main.defs
    done
}

build() {
  cd "${srcdir}/${_srcname}"

  ./configure --build="build" \
    --prefix=/usr \
    --force \
    --disable-gtk-update-checks \
    --launch-jobs=0 \
    --fetch=curl \
    --enable-x265 \
    \
    --enable-fdk-aac \
    --enable-libav-aac \
    \
    --enable-local-yasm \
    --enable-local-autotools \
    --enable-local-cmake

  install -d -m755 "build/build_tmp"

  make -C "build" TMPDIR="$srcdir/$_srcname/build/build_tmp"
}

package_handbrake-cli-svn_p() {
  pkgdesc="Multiplatform, multithreaded DVD to MPEG-4/H264/Theora converter (CLI version)"
  depends=('jansson' 'libdvdnav' 'ffmpeg-full-git_p')
  provides=('handbrake-cli' 'handbrake-cli-svn')
  conflicts=('handbrake-cli' 'handbrake-cli-svn' 'handbrake-gtk2')

  install -D -m755 "$srcdir/${_srcname}/build/HandBrakeCLI" "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-gtk-svn_p() {
  pkgdesc="Multiplatform, multithreaded DVD to MPEG-4/H264/Theora converter (GUI version)"
  depends=('libdvdnav' 'dbus-glib' 'desktop-file-utils' 'gst-plugins-base-libs' 'ffmpeg-full-git_p' 'jansson' 'gtk3' 'libnotify')
  provides=('handbrake' 'handbrake-svn')
  conflicts=('handbrake' 'handbrake-svn' 'handbrake-gtk2')
  install=handbrake-gtk-svn_p.install

  cd "${srcdir}/${_srcname}"
  make -C "build" DESTDIR="$pkgdir/" install

  rm -f "$pkgdir/usr/bin/HandBrakeCLI"

  # icon-theme.cache will be rebuilt on install
  rm -f "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
}

