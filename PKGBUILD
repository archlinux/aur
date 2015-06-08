# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>
pkgname=cuberok
pkgver=0.1.0
pkgrel=2
pkgdesc="Yet another music player based on Qt4."
arch=('i686' 'x86_64')
url=('http://code.google.com/p/cuberok/')
license=('GPL')

# Comment/uncomment the lines with the engines you need. GStreamer is a
# dependency of qt, so phonon and gstreamer engines are built by default.
depends=('qt4' 'gstreamer0.10-good-plugins' 'phonon'
#         'audiere'                    # Audiere engine
#         'ffmpeg'                     # FFMpeg engine
        )
optdepends=('gstreamer0.10-bad-plugins: GStreamer support for aac'
            'gstreamer0.10-ugly-plugins: GStreamer support for mp3'
            'gstreamer0.10-ffmpeg: GStreamer support for wma, mp3, etc...'
)
makedepends=('make' 'pkgconfig' 'sed')
conflicts=('cuberok-svn')
source=("http://cuberok.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('edd7594997d54989a6c3a3671e6bd4c4')

build() {
  cd $srcdir/$pkgname-$pkgver
  # Archlinux compliance
  sed -i 's/64//g' ./plugins/plugins_path-x86-64.pri
  sed -i 's/64//g' ./plugins/plugins_path-x86_64.pri

  #Disable ffmpeg plugin as it is not compiling fine. If you are willing to test, comment it
  sed -i 's/SUBDIRS += plugins\/player_ffmpeg//g' Cuberok.pro
  sed -i s\|/usr/local\|$pkgdir/usr\| unix_build.sh
  sed -i s/sudo// unix_build.sh
  chmod +x ./unix_build.sh
  ./unix_build.sh || return 1
  #make INSTALL_ROOT=$pkgdir/usr install || return 1
}
