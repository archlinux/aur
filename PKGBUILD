# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=singularityviewer
pkgver=1.8.7.6866
_pkgver=1_8_7_6866
pkgrel=3
_harfbuzzver=1.3.4-1
pkgdesc="A Second Life (secondlife) protocol compatible client application, used to access its service as well as a number of other such as those based upon OpenSim platform"
url="http://www.singularityviewer.org/"
license=('custom')
arch=('x86_64')
depends=('apr-util' 'gtk2' 'libgl' 'libidn' 'mesa' 'nss' 'sdl' 'libxss' 'lib32-libidn' 'lib32-libsndfile' 'lib32-zlib' 'gconf' 'lib32-util-linux')
optdepends=('libpulse: for PulseAudio support' 'alsa-lib: for ALSA support'
	'nvidia-utils: for NVIDIA support'
	'flashplugin: for inworld Flash support'
	'gstreamer0.10: for video support, may need good, bad and ugly plugins'
	'lib32-freealut: for OpenAL support'
	'openal'
	'libxtst')
source=("http://67.170.30.149/Singularity_${_pkgver}_$CARCH.tar.xz"
	"singularityviewer.desktop"
	"singularityviewer.launcher"
        "http://dl.dropboxusercontent.com/u/4361965/singularityviewer.png"
	"http://archive.archlinux.org/repos/2016/12/06/extra/os/x86_64/harfbuzz-1.3.4-1-x86_64.pkg.tar.xz")
md5sums=('26239218a3ca9a6343039906e5374f79'
         '3b6c5641f35a099af35ff4065733049f'
         'eb596f5cf7b6f2d0c55c0082fb99a905'
         '0c825fe422dadd0cac9010e7ff152cfa'
         '0a3e4654c3009d740a6be09e58a2d451')

package() {
cd $srcdir
  
# Rename Data Directory
mv Singularity_${_pkgver}_$CARCH singularityviewer
  
# Install Desktop File
install -D -m644 $srcdir/singularityviewer.desktop \
    $pkgdir/usr/share/applications/singularityviewer.desktop
  
# Install Icon File
install -D -m644 $srcdir/singularityviewer.png \
  $pkgdir/usr/share/pixmaps/singularityviewer_icon.png
  
# Install Launcher
install -D -m755 $srcdir/singularityviewer.launcher \
    $pkgdir/usr/bin/singularityviewer

# Install License file
install -D -m755 $srcdir/singularityviewer/licenses.txt \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE
    
# Move Data to Destination Directory
install -d $pkgdir/opt
mv singularityviewer $pkgdir/opt/
  
# Change Permissions of files to root:games
chown -R root:games $pkgdir/opt/singularityviewer
chmod -R g+rw $pkgdir/opt/singularityviewer

# Make Binary Group-Executable
chmod g+x $pkgdir/opt/singularityviewer/singularity
 
# Do not re-register the application with the desktop system at every launch, saves from locally installed desktop files.
sed -i 's|./refresh_desktop_app_entry.sh|#./refresh_desktop_app_entry.sh|' $pkgdir/opt/singularityviewer/singularity

# Install harfbuzz binaries
cd $srcdir/usr/lib/
cp *harfbuzz.so* $pkgdir/opt/singularityviewer/lib64/
    
}
