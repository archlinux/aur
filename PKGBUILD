# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: jiribb <jiribb@gmail.com>
# Contributor: David Spicer <azleifel at googlemail dot com>
# Contributor: Andrew Brouwers
# Contributor: ponsfoot @ AUR
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: David Spicer <azleifel at gmail dot com>

pkgbase=handbrake-git
pkgname=('handbrake-gtk-git' 'handbrake-cli-git')
pkgver=r6637
pkgrel=1
pkgdesc="Multiplatform, multithreaded DVD to MPEG-4/H264/Theora converter"
arch=('i686' 'x86_64')
url="http://handbrake.fr/"
license=('GPL')
depends=('dbus-glib' 'desktop-file-utils' 'gst-plugins-base-libs'
	 'gtk3' 'jansson' 'lame' 'libass' 'libx264' 'libnotify'
	 'libsamplerate' 'libtheora')
makedepends=('cmake' 'intltool' 'python2' 'gettext' 'subversion' 'yasm')
options=('!makeflags')
md5sums=('SKIP')
makedepends=('git')
source=("git+https://github.com/HandBrake/HandBrake.git")
md5sums=('SKIP')
_gitname="HandBrake"

pkgver() {
  cd "$srcdir"/"$_gitname"
    printf "r%s" "$(git rev-list --count HEAD)"

}

build() {
  cd "$srcdir"/"$_gitname"

  ./configure --force --build="build" --prefix=/usr \
	      --disable-gtk-update-checks --launch-jobs=0 --fetch=curl

  # Create build-specific temporary directory for ffmpeg
  install -d -m755 "build/build_tmp"

  make -C "build" TMPDIR="$srcdir/$_gitname/build/build_tmp"
}

package_handbrake-gtk-git() {
  pkgdesc="Multiplatform, multithreaded DVD to MPEG-4/H264/Theora converter (GUI version)"
  optdepends=('gst-plugins-base: For Preview Window'
              'gst-plugins-bad: For Preview Window'
              'gst-plugins-good: For Preview Window'
              'gst-plugins-ugly: For Preview Window'
              'gst-libav: For Preview Window')
  provides=('handbrake')
  conflicts=('handbrake')
  install=${pkgbase}.install

  cd "$srcdir"/"$_gitname"
  make -C "build" DESTDIR="$pkgdir/" install

  rm -f "$pkgdir/usr/bin/HandBrakeCLI"

  # icon-theme.cache will be rebuilt on install
  rm -f "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
}

package_handbrake-cli-git() {
  pkgdesc="Multiplatform, multithreaded DVD to MPEG-4/H264/Theora converter (CLI version)"
  depends=('jansson' 'lame' 'libass' 'libsamplerate' 'libtheora' 'libx264' 'libxml2')
  provides=('handbrake-cli')
  conflicts=('handbrake-cli')

  install -D -m755 "$srcdir/$_gitname/build/HandBrakeCLI" "$pkgdir/usr/bin/HandBrakeCLI"
}
