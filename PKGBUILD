# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=thunar-extended
pkgver=1.6.16
pkgrel=1
pkgdesc="Thunar with split view, cursor audio preview and extra options for trash, desktop files and user actions"
arch=(i686 x86_64)
license=('GPL2' 'LGPL2.1')
url="http://thunar.xfce.org"
groups=('xfce4')
conflicts=('thunar')
replaces=('thunar')
provides=('thunar=1.6.16')
depends=('desktop-file-utils' 'libexif' 'hicolor-icon-theme' 'libnotify' 'udev' \
         'gtk2' 'exo' 'libxfce4util' 'libxfce4ui' 'libpng' 'gstreamer')
makedepends=('intltool' 'pkgconfig' 'xfce4-panel' 'xfce4-dev-tools')
optdepends=('gvfs: for trash support, mounting with udisk and remote filesystems'
	    'gamin: for monitoring file changes without gvfs'
            'xfce4-panel: for trash applet'
	    'tumbler: for thumbnail previews'
	    'thunar-volman: manages removable devices'
	    'thunar-archive-plugin: create and deflate archives'
	    'thunar-media-tags-plugin: view/edit id3/ogg tags')
options=('!libtool')
source=(https://archive.xfce.org/src/xfce/thunar/1.6/Thunar-${pkgver}.tar.bz2
	notrash.patch
	uca_num_files.patch
	preview.patch
	split_pane.patch)

build() {
  cd "${srcdir}"/Thunar-${pkgver}

  # Xfce bugs 7352, 7353, 7354 and 10232
  patch -Np1 -i ../notrash.patch
  patch -Np1 -i ../uca_num_files.patch
  patch -Np1 -i ../preview.patch
  patch -Np1 -i ../split_pane.patch

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

md5sums=('a98fed11d1a1c12974ed784c17af006c'
         'd87f154a5fbd3709511ded0c9b9b0317'
         'ed289801d509fe72b82c01fbb6f5f715'
         '60d3bb7fc185f5f881b5884bd7f28c87'
         'ce443cf896934131427b7789da130097')
