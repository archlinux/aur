# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: mikers <mikeonthecomputer@gmail.com>
# Contributor: Splex


pkgname=kokua-secondlife
pkgver=3.7.27.35441
_pkgver=3_7_27_35441
_pkgprever=3.7.27

pkgrel=1
pkgdesc="An Open Source third party viewer for Second Life® (secondlife), only."
url="http://www.kokuaviewer.org"
license=('GPL')
arch=('i686' 'x86_64')
depends=('apr-util' 'gtk2' 'libgl' 'libidn' 'libjpeg-turbo' 'mesa' 'nss' 'sdl' 'glu' 'pangox-compat')
optdepends=('libpulse: for PulseAudio support' 'alsa-lib: for ALSA support' 'nvidia-utils: for NVIDIA support' 'flashplugin: for inworld Flash support' 'gstreamer0.10: for video support, may need good, bad and ugly plugins' 'lib32-freealut: for OpenAL support')
replaces=('kokua-bin')
conflicts=('kokua-bin')


if [ "$CARCH" = "i686" ]; then
source=("http://sourceforge.net/projects/kokua.team-purple.p/files/Kokua-${_pkgprever}/Kokua_${_pkgver}_${CARCH}.tar.bz2"
		'kokua-secondlife.desktop'
		'kokua-secondlife.launcher')
md5sums=('181684238bf2531cbe0d6a8de4d6441a'
         '3893a2c8ae9cb8e2adb4d7c47750029b'
         'e12fd7bd333f4f810dec66f1be17c71c')
        
elif [ "$CARCH" = "x86_64" ]; then
source=("http://sourceforge.net/projects/kokua.team-purple.p/files/Kokua-${_pkgprever}/Kokua_64_${_pkgver}_${CARCH}.tar.bz2"
		'kokua-secondlife.desktop'
		'kokua-secondlife.launcher')
md5sums=('1cf635814d0fc6327978b320f29877d5'
		 '3893a2c8ae9cb8e2adb4d7c47750029b'
         'e12fd7bd333f4f810dec66f1be17c71c')
fi


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