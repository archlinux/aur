# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=thunar-extended
pkgver=4.18.3
pkgrel=1
pkgdesc="Thunar with cursor audio preview and extra options for trash"
arch=(i686 x86_64)
license=('GPL2' 'LGPL2.1')
url="http://thunar.xfce.org"
groups=('xfce4')
conflicts=('thunar')
replaces=('thunar')
provides=('thunar=4.18.3')
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
	preview.patch)

build() {
  cd "${srcdir}"/thunar-${pkgver}

  # Xfce bugs 7352, 7354
  patch -Np1 -i ../notrash.patch
  patch -Np1 -i ../preview.patch

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

sha256sums=('f402ea38519f3f803b8f06933c05ddbf8c0c61d2e8ef93fcbe1fc7f6525e3297'
            '84cb384722f32f37bd2e7f2c96c47ebbe7955cb8007260fe1a9efe26d235d478'
            'b9297f2a22d294264ad2bc9d50341842a27746320b7294b686fd37f074593f3a')
