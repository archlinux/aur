# Maintainer: Alex Tharp <alex at toastercup dot io>
pkgname=coolvlviewer
pkgver=1.32.2.29
pkgrel=1
pkgdesc="A third-party viewer for Second Life and OpenSim grids (built from source)"
url="http://sldev.free.fr"
license=('GPL-2.0-or-later')
depends=(
  'apr-util'
  'atk'
  'gconf'
  'glib2>=2.32'
  'glu'
  'lib32-libidn'
  'lib32-libsndfile'
  'lib32-util-linux'
  'lib32-zlib'
  'libcups'
  'libgl'
  'libidn'
  'libxcomposite'
  'libxcursor'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'pangox-compat'
  'sdl'
)
optdepends=(
  'alsa-lib: for ALSA support'
  'gst-plugins-bad: for video support'
  'gst-plugins-good: for video support'
  'gst-plugins-ugly: for video support'
  'lib32-alsa-lib: for ALSA support'
  'lib32-freealut: for OpenAL support'
  'lib32-libidn11: for voice support'
  'libpulse: for PulseAudio support'
  'nvidia-utils: for NVIDIA support'
  'pepper-flash: for inworld Flash support'
  'wine: for SLVoice support'
)
makedepends=(
  'cmake'
  'bison'
  'flex'
  'python'
  'make'
  'bzip2'
  'glibc'
  'libx11'
  'libgl'
  'libxrender'
  'libidn'
  'libxinerama'
  'lib32-libxinerama'
)
arch=('x86_64')
conflicts=('coolvlviewer-bin')
provides=('coolvlviewer')
install=coolvlviewer.install
source=(
  "http://sldev.free.fr/sources/CoolVLViewer-src-${pkgver//./}.tar.bz2"
  "coolvlviewer.desktop"
  "coolvlviewer.launcher"
)
sha1sums=(
  'eb476ffddc6759c672093a1ab1b82b6051ebb2be'
  '314763ee16ca2e2224c402ec18bf5b24157ce8b8'
  '3ef1284a00a4437e4c34f809311ee0672604ef04'
)

build() {
  cd $srcdir/linden
  ./linux-build.sh
}

package() {
	install -D -m755 $srcdir/coolvlviewer.launcher $pkgdir/usr/bin/coolvlviewer
  install -D -m644 $srcdir/coolvlviewer.desktop $pkgdir/usr/share/applications/coolvlviewer.desktop
  install -D -m755 $srcdir/linden/indra/viewer-linux-x86_64-release/newview/CoolVLViewer-x86_64-$pkgver/cvlv_icon.png $pkgdir/usr/share/pixmaps/clvl_icon.png
  install -D -m644 $srcdir/linden/indra/viewer-linux-x86_64-release/newview/CoolVLViewer-x86_64-$pkgver/licenses.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # Move Data to Destination Directory
  install -d $pkgdir/opt/
  mv coolvlviewer/ $pkgdir/opt/

  # Change Permissions of files to root:games
  chown -R root:games $pkgdir/opt/coolvlviewer
  chmod -R g+rw $pkgdir/opt/coolvlviewer

  # Make Binary Group-Executable
  chmod g+x $pkgdir/opt/coolvlviewer/cool_vl_viewer
}
