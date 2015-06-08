# Maintainer: GordonGR <gordongr@freemail.gr>
# Contributor: Splex

pkgname=dolphinviewer
pkgver=3.6.99.32369
_pkgver=3_6_99_32369
pkgrel=1
pkgdesc="An Open Source third party viewers for Second Life® (secondlife) -- BETA."
url="http://dolphinviewer.eregion.de"
license=('LGPL')

[ "$CARCH" = "i686"   ] && depends=('apr-util' 'gtk2' 'libgl' 'libidn' 'libjpeg-turbo' 'mesa' 'nss' 'sdl' 'glu' 'pangox-compat' 'libxml2')
[ "$CARCH" = "i686"   ] && optdepends=('libpulse: for PulseAudio support' 'alsa-lib: for ALSA support' 'nvidia-utils: for NVIDIA support' 'flashplugin: for inworld Flash support' 'gstreamer0.10: for video support, may need good, bad and ugly plugins' 'lib32-freealut: for OpenAL support')
[ "$CARCH" = "x86_64" ] && depends=('apr-util' 'lib32-gtk2' 'lib32-libgl' 'lib32-libidn' 'lib32-libjpeg-turbo' 'lib32-mesa' 'lib32-nss' 'lib32-sdl' 'lib32-glu' 'lib32-pangox-compat' 'lib32-libxml2')
[ "$CARCH" = "x86_64"   ] && optdepends=('lib32-libpulse: for PulseAudio support' 'lib32-alsa-lib: for ALSA support' 'lib32-nvidia-utils: for NVIDIA support' 'lib32-flashplugin: for inworld Flash support' 'lib32-gstreamer0.10: for video support, may need good, bad and ugly plugins' 'lib32-freealut: for OpenAL support')

arch=('i686' 'x86_64')
#install=dolphinviewer.install
source=('dolphinviewer.desktop'
		'dolphinviewer.launcher'
		"http://dolphinsource.eregion.de/dolphinviewer3-beta/downloads/Dolphin_Viewer_3_BETA_${_pkgver}_i686.tar.bz2"
        'donotregister.patch')

md5sums=('30dd0d8e86032a38bca52fcf3d466cbe'
         '0879128702933080ad018898a003c699'
         '20569d73b57b637154a8183a90d1da45'
         '1b4db712c2db43c0ae4f69b6b5410c43')


package() {
cd $srcdir
  
# Rename Data Directory
mv Dolphin_Viewer_3_BETA_${_pkgver}_i686 dolphinviewer

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
