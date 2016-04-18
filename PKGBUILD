# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=thunar-extended
pkgver=1.6.10
pkgrel=2
pkgdesc="Thunar with split view, cursor audio preview and extra options for trash, desktop files and user actions"
arch=(i686 x86_64)
license=('GPL2' 'LGPL2.1')
url="http://thunar.xfce.org"
groups=('xfce4')
conflicts=('thunar')
replaces=('thunar')
provides=('thunar=1.6.10')
depends=('desktop-file-utils' 'libexif' 'hicolor-icon-theme' 'libnotify' 'udev' \
         'gtk2' 'exo' 'libxfce4util' 'libxfce4ui' 'libpng' 'gstreamer0.10')
makedepends=('intltool' 'pkgconfig' 'xfce4-panel' 'xfce4-dev-tools')
optdepends=('gvfs: for trash support, mounting with udisk and remote filesystems'
	    'gamin: for monitoring file changes without gvfs'
            'xfce4-panel: for trash applet'
	    'tumbler: for thumbnail previews'
	    'thunar-volman: manages removable devices'
	    'thunar-archive-plugin: create and deflate archives'
	    'thunar-media-tags-plugin: view/edit id3/ogg tags')
options=('!libtool')
install=thunar.install
source=(http://archive.xfce.org/src/xfce/thunar/1.6/Thunar-${pkgver}.tar.bz2
	notrash.patch
	uca_num_files.patch
	preview.patch
	split_pane.patch
	bug11983.patch)

build() {
  cd "${srcdir}"/Thunar-${pkgver}

  # Xfce bugs 7352, 7353, 7354 and 10232
  patch -Np1 -i ../notrash.patch
  patch -Np1 -i ../uca_num_files.patch
  patch -Np1 -i ../preview.patch
  patch -Np1 -i ../split_pane.patch
  # Upstream one
  patch -Np1 -i ../bug11983.patch

  mkdir m4
  sed -i -e 's/Thunar_CFLAGS/thunar_CFLAGS/' -e 's/Thunar_LDADD/thunar_LDADD/' thunar/Makefile.am
  xdt-autogen
  
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --disable-static --disable-wallpaper-plugin \
    --enable-gstreamer --enable-gio-unix --enable-dbus --enable-exif \
    --enable-pcre --enable-gudev --disable-startup-notification \
    --enable-notifications
  
  make
}

package() {
  cd "${srcdir}"/Thunar-${pkgver}
  make DESTDIR="${pkgdir}" install
}

md5sums=('3089e1dca6e408641b07cd9c759dea5e'
         'd87f154a5fbd3709511ded0c9b9b0317'
         '69aa416e8694b8b608f767769b6dcd98'
         '6302de8c5061fbf769bc2b24e67256f9'
         'ce443cf896934131427b7789da130097'
	 '053c83b6d88d2e01d1aa7fe7b5dd8a6e')
