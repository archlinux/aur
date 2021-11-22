# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=thunar-extended
pkgver=4.16.10
pkgrel=2
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
  patch -Np1 -i ../uca_num_files.patch
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

sha256sums=('f105c8f5abc50c411f6218f913561ae3a485826bd0cd09503a4772d015899c92'
            '84cb384722f32f37bd2e7f2c96c47ebbe7955cb8007260fe1a9efe26d235d478'
            'dff7a12776b488613eec99e70acfb700550d72534ecc8a26157af4da1b35d84d'
            '8d11bfc3a51d6ab0f5e9853b31d10d7e1af2e1c8b075ee140c64471e1df9ca68'
            '1e287aa82392bcabd747ab3b5e0c66815b3cfc22e3227cf8439a18f8f200e5ed')
