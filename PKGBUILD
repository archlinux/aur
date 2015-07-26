# Maintainer: GordonGR <gordongr@freemail.gr>
# Contributor: Splex

pkgname=dolphinviewer
pkgver=3.4.14.27321
pkgrel=1
pkgdesc="An Open Source third party viewer for Second Life® (secondlife) (abandoned)."
url="http://dolphinviewer.eregion.de"
license=('LGPL')

depends_i686=('apr-util' 'gtk2' 'libgl' 'libidn' 'libjpeg-turbo' 'mesa' 'nss' 'sdl' 'glu' 'pangox-compat' 'libxml2')
optdepends_i686=('libpulse: for PulseAudio support' 'alsa-lib: for ALSA support' 'nvidia-utils: for NVIDIA support' 'flashplugin: for inworld Flash support' 'gstreamer0.10: for video support, may need good, bad and ugly plugins' 'lib32-freealut: for OpenAL support')
depends_x86_64=('apr-util' 'lib32-gtk2' 'lib32-libgl' 'lib32-libidn' 'lib32-libjpeg-turbo' 'lib32-mesa' 'lib32-nss' 'lib32-sdl' 'lib32-glu' 'lib32-pangox-compat' 'lib32-libxml2')
optdepends_x86_64=('lib32-libpulse: for PulseAudio support' 'lib32-alsa-lib: for ALSA support' 'lib32-nvidia-utils: for NVIDIA support' 'lib32-flashplugin: for inworld Flash support' 'lib32-gstreamer0.10: for video support, may need good, bad and ugly plugins' 'lib32-freealut: for OpenAL support')

arch=('i686' 'x86_64')
#install=dolphinviewer.install
source=('dolphinviewer.desktop'
		'dolphinviewer.launcher'
		"http://dolphinviewer.eregion.de/files/installers/DolphinViewer3-i686-linux-${pkgver}.tar.bz2"
        'donotregister.patch')
md5sums=('30dd0d8e86032a38bca52fcf3d466cbe'
         '0879128702933080ad018898a003c699'
         '2709f0e1004f1e628e3a68a3bed71079'
         '1b4db712c2db43c0ae4f69b6b5410c43')


package() {
cd $srcdir
  
# Rename Data Directory
mv DolphinViewer3-i686-linux-${pkgver} dolphinviewer

# Do not register the application (saves from badly-installed desktop files and icons)
patch dolphinviewer/secondlife donotregister.patch
rm dolphinviewer/etc/refresh_desktop_app_entry.sh
  
# Install Desktop File
install -D -m644 $srcdir/dolphinviewer.desktop \
  $pkgdir/usr/share/applications/dolphinviewer.desktop
  
# Install Icon File
install -D -m644 $srcdir/dolphinviewer/secondlife_icon.png \
  $pkgdir/usr/share/pixmaps/dolphinviewer.png
  
# Install Launcher
install -D -m755 $srcdir/dolphinviewer.launcher \
  $pkgdir/usr/bin/dolphinviewer

# Move Data to Destination Directory
install -d $pkgdir/opt
mv dolphinviewer $pkgdir/opt/
  
# Change Permissions of files to root:games
chown -R root:games $pkgdir/opt/dolphinviewer
chmod -R g+rw $pkgdir/opt/dolphinviewer
# Make Binary Group-Executable
chmod g+x $pkgdir/opt/dolphinviewer/secondlife
  
}
