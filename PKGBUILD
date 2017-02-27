# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: mikers <mikeonthecomputer@gmail.com>
# Contributor: Splex

pkgname=kokua-secondlife
pkgver=5.0.0.40327
_pkgver=5_0_0_40327
_pkgprever=5.0.0
pkgrel=1
pkgdesc="An Open Source third party viewer for Second Life® (secondlife), only."
url="http://www.kokuaviewer.org"
license=('GPL')
arch=('i686' 'x86_64')
depends=('apr-util' 'glib2>=2.32' 'libgl' 'libidn' 'mesa' 'sdl' 'glu' 'pangox-compat' 'gconf' 'libxss' 'libxrandr' 'libxcomposite' 'libgl' 'lib32-zlib' 'libcups' 'atk' 'lib32-util-linux' 'lib32-libidn' 'libxcursor' 'libxtst')
optdepends=('libpulse: for PulseAudio support' 'alsa-lib: for ALSA support'
	'nvidia-utils: for NVIDIA support' 'pepper-flash: for inworld Flash support'
	'gstreamer0.10: for video support, may need good, bad and ugly plugins'
	'lib32-freealut: for OpenAL support')
conflicts=('kokua-opensim')

source_i686=("http://downloads.sourceforge.net/project/kokua.team-purple.p/KokuaSL-${_pkgprever}/Kokua_${_pkgver}_i686.tar.txz"
             'kokua-secondlife.desktop'
             'kokua-secondlife.launcher')
source_x86_64=("http://downloads.sourceforge.net/project/kokua.team-purple.p/KokuaSL-${_pkgprever}/Kokua_64_${_pkgver}_x86_64.tar.txz"
		'kokua-secondlife.desktop'
		'kokua-secondlife.launcher')
md5sums_i686=('adf13b667e78211079fef1cd37b6c977'
              '3893a2c8ae9cb8e2adb4d7c47750029b'
              'e12fd7bd333f4f810dec66f1be17c71c')
md5sums_x86_64=('084de698922826a76162bf0d08e3d5f8'
                '3893a2c8ae9cb8e2adb4d7c47750029b'
                'e12fd7bd333f4f810dec66f1be17c71c')


package() {
cd $srcdir
  
# Rename Data Directory
if [ "$CARCH" = "i686" ]; then
mv Kokua_${_pkgver}_$CARCH kokua-secondlife
elif [ "$CARCH" = "x86_64" ]; then
mv Kokua_64_${_pkgver}_$CARCH kokua-secondlife
fi

# Install Desktop File
install -D -m644 $srcdir/kokua-secondlife.desktop \
  $pkgdir/usr/share/applications/kokua-secondlife.desktop

# Install Icon File
install -D -m644 $srcdir/kokua-secondlife/kokua_icon.png \
  $pkgdir/usr/share/pixmaps/kokua-secondlife.png

# Install Launcher
install -D -m755 $srcdir/kokua-secondlife.launcher \
  $pkgdir/usr/bin/kokua-secondlife

# Move Data to Destination Directory
install -d $pkgdir/opt
mv kokua-secondlife $pkgdir/opt/

# Change Permissions of files to root:games
chown -R root:games $pkgdir/opt/kokua-secondlife
chmod -R g+rw $pkgdir/opt/kokua-secondlife

# Make Binary Group-Executable
chmod g+x $pkgdir/opt/kokua-secondlife/kokua

# Do not re-register the application with the desktop system at every launch, saves from locally installed desktop files.
sed -i 's|./etc/refresh_desktop_app_entry.sh|#./etc/refresh_desktop_app_entry.sh|' $pkgdir/opt/kokua-secondlife/kokua
   
}