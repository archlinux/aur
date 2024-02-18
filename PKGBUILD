# Maintainer: Dave Wheeler <dwwheeler at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: mikers <mikeonthecomputer@gmail.com>
# Contributor: Splex

pkgname=kokua-secondlife
pkgver=6.6.16.55167
_pkgver=$(echo $pkgver | tr '.' '_')
_pkgprever=${pkgver%\.*}
pkgrel=1
pkgdesc="An Open Source third party viewer for Second Life® (secondlife), only."
url="https://kokua.atlassian.net"
license=('GPL')
arch=('x86_64')
depends=('apr-util' 'glib2>=2.32' 'libgl' 'libidn' 'mesa' 'sdl' 'glu' 'pangox-compat' 'gconf' 'libxss' 'libxrandr' 'libxcomposite' 'libgl' 'lib32-zlib' 'libcups' 'atk' 'lib32-libsndfile' 'lib32-util-linux' 'lib32-libidn' 'libxcursor' 'libxtst')
optdepends=('libpulse: for PulseAudio support'
	'alsa-lib: for ALSA support'
	'lib32-alsa-plugins: for voice support'
	'nvidia-utils: for NVIDIA support' 'pepper-flash: for inworld Flash support'
	'gstreamer0.10: for video support, may need good, bad and ugly plugins'
	'lib32-freealut: for OpenAL support'
	'lib32-libidn11: for voice support'
	'pangox-compat: for media_plugin_webkit to work')
conflicts=('kokua-opensim')

source=("https://bitbucket.org/kokua/downloads/downloads/Kokua_RLV_${_pkgver}_x86_64.tar.bz2"
	"file://kokua-secondlife.desktop"
	"file://kokua-secondlife.launcher")
b2sums=('5b50167ae6f0ffa0283ce9952042417b45fe41dae3dee483fa6ea72bf002a423ea1904dace1d1f0b09b59adf79cbd5b7d268946305d84227315c9d61b98610d8'
        'b5bea77466cd2a51c9b03bc1eb85649c1b96418c649a3da6bc345799fd924be5be58fbe9417f19a104ebca7bd1eb72a7bc4eb43d06915ac80e44efffe718f495'
        '1a397d19c5a9d56a3a2dd216cc4914dffb3416149386c05316289a9690640092280003c37f3274a60f7a544acaa92910e95c6ee3ff1eb39349398603cd2dedfd')

package(){
cd $srcdir
  
# Rename Data Directory
mv "Kokua_RLV_${_pkgver}_$CARCH" kokua-secondlife

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
