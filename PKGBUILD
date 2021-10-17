# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=thunar-extended
pkgver=4.16.10
pkgrel=1
pkgdesc="Thunar with split view, cursor audio preview and extra options for trash, desktop files and user actions"
arch=(i686 x86_64)
license=('GPL2' 'LGPL2.1')
url="http://thunar.xfce.org"
groups=('xfce4')
conflicts=('thunar')
replaces=('thunar')
provides=('thunar=4.16.10')
depends=('desktop-file-utils' 'libexif' 'hicolor-icon-theme' 'libnotify' 'libgudev' \
         'exo' 'libxfce4util' 'libxfce4ui' 'libpng' 'gstreamer')
makedepends=('intltool' 'gobject-introspection' 'xfce4-panel' 'xfce4-dev-tools')
optdepends=('gvfs: for trash support, mounting with udisk and remote filesystems'
	    'tumbler: for thumbnail previews'
	    'thunar-volman: manages removable devices'
	    'thunar-archive-plugin: create and deflate archives'
	    'thunar-media-tags-plugin: view/edit id3/ogg tags')
options=('!libtool')
source=(https://archive.xfce.org/src/xfce/thunar/${pkgver%.*}/thunar-${pkgver}.tar.bz2
	notrash.patch
	uca_num_files.patch
	preview.patch
	split_pane.patch)

build() {
  cd "${srcdir}"/thunar-${pkgver}

  # Xfce bugs 7352, 7353, 7354 and 10232
  patch -Np1 -i ../notrash.patch
  # This one builds but still needs work
  #patch -Np1 -i ../uca_num_files.patch
  patch -Np1 -i ../preview.patch
  patch -Np1 -i ../split_pane.patch

  sed -i -e 's/Thunar_CFLAGS/thunar_CFLAGS/' -e 's/Thunar_LDADD/thunar_LDADD/' thunar/Makefile.am
  xdt-autogen
  
  ./configure --prefix=/usr --sysconfdir=/etc --disable-wallpaper-plugin \
    --enable-gstreamer --enable-gio-unix --enable-exif --enable-pcre --enable-gudev \
    --disable-gtk-doc --disable-startup-notification --enable-notifications --disable-debug
  
  make
}

package() {
  cd "${srcdir}"/thunar-${pkgver}
  make DESTDIR="${pkgdir}" install
}

md5sums=('6099a1d47de5b6d416883fd16cdd3a5a'
         '48ca4400bb38440b1cc404877b9e2cb6'
         '5182272e5db77880f66dbf4995aa3c07'
         '5bc65e0243a922ed47fc547a2e7200be'
         '86dae66607ef08442e2893201243ac54')
