# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: mikers <mikeonthecomputer@gmail.com>
# Contributor: Splex


pkgname=kokua-secondlife
pkgver=3.8.4.37073
_pkgver=3_8_4_37073
_pkgprever=3.8.4
pango_ver=1.36.8

pkgrel=2
pkgdesc="An Open Source third party viewer for Second Life® (secondlife), only."
url="http://www.kokuaviewer.org"
license=('GPL')
arch=('i686' 'x86_64')
depends=('apr-util' 'gtk2' 'libgl' 'libidn' 'libjpeg-turbo' 'mesa' 'nss' 'sdl' 'glu' 'pangox-compat')
optdepends=('libpulse: for PulseAudio support' 'alsa-lib: for ALSA support' 'nvidia-utils: for NVIDIA support' 'flashplugin: for inworld Flash support' 'gstreamer0.10: for video support, may need good, bad and ugly plugins' 'lib32-freealut: for OpenAL support')
replaces=('kokua-bin')
conflicts=('kokua-bin')

#http://sourceforge.net/projects/kokua.team-purple.p/files/Kokua-${_pkgprever}/Kokua_${_pkgver}_${CARCH}.tar.bz2"
source_i686=("http://bitbucket.org/kokua/downloads/downloads/Kokua_${_pkgver}_i686.tar.bz2"
             'kokua-secondlife.desktop'
             'kokua-secondlife.launcher'
             "http://download.gnome.org/sources/pango/${pango_ver:0:4}/pango-${pango_ver}.tar.xz")
        
#"http://sourceforge.net/projects/kokua.team-purple.p/files/Kokua-${_pkgprever}/Kokua_64_${_pkgver}_${CARCH}.tar.bz2"
source_x86_64=("http://bitbucket.org/kokua/downloads/downloads/Kokua_64_${_pkgver}_x86_64.tar.bz2"
		'kokua-secondlife.desktop'
		'kokua-secondlife.launcher'
		"http://download.gnome.org/sources/pango/${pango_ver:0:4}/pango-${pango_ver}.tar.xz")

md5sums_i686=('e0e7e2a8981152594511d08709307de2'
              '3893a2c8ae9cb8e2adb4d7c47750029b'
              'e12fd7bd333f4f810dec66f1be17c71c'
              '217a9a753006275215fa9fa127760ece')
md5sums_x86_64=('956c11edeefcdf296b9e00514b62ace7'
                '3893a2c8ae9cb8e2adb4d7c47750029b'
                'e12fd7bd333f4f810dec66f1be17c71c'
                '217a9a753006275215fa9fa127760ece')

package() {
# Workaround for http://sourceforge.net/p/team-purple/kokua/tickets/380/
cd $srcdir/pango-${pango_ver}
./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --with-included-modules=basic-fc
make
mkdir ../pango-install
make -j1 DESTDIR=$(pwd)/../pango-install install
cd ..
if [ "$CARCH" = "i686" ]; then
    cp -aiv pango-install/usr/lib/libpangoft2-1.0.so* Kokua_${_pkgver}_$CARCH/lib/
    rm -v Kokua_${_pkgver}_$CARCH/lib/libgdk_pixbuf-2.0.so*
elif [ "$CARCH" = "x86_64" ]; then
    cp -aiv pango-install/usr/lib/libpangoft2-1.0.so* Kokua_64_${_pkgver}_$CARCH/lib64/
    rm -v Kokua_64_${_pkgver}_$CARCH/lib64/libgdk_pixbuf-2.0.so*
fi

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