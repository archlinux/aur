# Maintainer: Alex Tharp <alex@toastercup.io>

pkgname=coolvlviewer
pkgver=1.28.2.55
_pkgver=128255
pkgrel=1
pkgdesc="A third-party viewer for Second Life (C) (secondlife) and OpenSim (opensimulator) grids. ('VL' stands for virtual life, formerly known as 'Cool SL Viewer'; built from source)"
url="http://sldev.free.fr"
license=('custom')
depends=('apr-util' 'glib2>=2.32' 'libgl' 'libidn' 'mesa' 'sdl' 'glu' 'pangox-compat' 'gconf' 'libxss' 'libxrandr' 'libxcomposite' 'libgl' 'lib32-zlib' 'libcups' 'atk' 'lib32-util-linux' 'lib32-libsndfile' 'lib32-libidn' 'libxcursor' 'libxtst')
optdepends=(
	'libpulse: for PulseAudio support'
	'alsa-lib: for ALSA support'
	'lib32-alsa-lib: for ALSA support'
	'nvidia-utils: for NVIDIA support'
	'pepper-flash: for inworld Flash support'
	'gst-plugins-good: for video support'
	'gst-plugins-bad: for video support'
	'gst-plugins-ugly: for video support'
	'lib32-freealut: for OpenAL support'
	'lib32-libidn11: for voice support'
	'wine: for SLVoice support')
makedepends=("cmake" "bison" "flex" "python2" "make" "bzip2" "glibc" "libx11" "libgl" "libxrender" "libidn" "libxinerama" "lib32-libxinerama")
arch=('x86_64')
conflicts=('coolvlviewer-bin' 'coolvlviewer-experimental' 'coolvlviewer-experimental-bin')
install=coolvlviewer.install
source=("http://sldev.free.fr/sources/CoolVLViewer-src-${_pkgver}.tar.bz2"
        "coolvlviewer.desktop"
        "coolvlviewer.launcher")
sha1sums=('5a44ff657e5bea2dcc26a1738c55c1e29c4eff84'
          '76de75412aad003b680bcb58ae54e51096642b0e'
          '3ef1284a00a4437e4c34f809311ee0672604ef04')

build() {
	cd $srcdir/linden
	./linux-build.sh
}

package() {
	# Install Desktop File
	install -D -m644 $srcdir/coolvlviewer.desktop \
		$pkgdir/usr/share/applications/coolvlviewer.desktop
	
	# Install Icon File
	install -D -m755 $srcdir/linden/indra/viewer-linux-x86_64-release/newview/CoolVLViewer-x86_64-$pkgver/cvlv_icon.png \
		$pkgdir/usr/share/pixmaps/clvl_icon.png
	
	# Install Launcher
	install -D -m755 $srcdir/coolvlviewer.launcher \
		$pkgdir/usr/bin/coolvlviewer
	
	# Install License
	install -D -m644 $srcdir/linden/indra/viewer-linux-x86_64-release/newview/CoolVLViewer-x86_64-$pkgver/licenses.txt \
		$pkgdir/usr/share/licenses/$pkgname/LISENSE
	
	# Move Data to Destination Directory
	mv $srcdir/linden/indra/viewer-linux-x86_64-release/newview/CoolVLViewer-x86_64-$pkgver/ $srcdir/coolvlviewer
	install -d $pkgdir/opt/
	mv coolvlviewer/ $pkgdir/opt/
	
	# Change Permissions of files to root:games
	chown -R root:games $pkgdir/opt/coolvlviewer
	chmod -R g+rw $pkgdir/opt/coolvlviewer
	
	# Make Binary Group-Executable
	chmod g+x $pkgdir/opt/coolvlviewer/cool_vl_viewer
}
