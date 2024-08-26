# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=thunar-extended
pkgver=4.18.11
pkgrel=1
pkgdesc="Thunar with cursor audio preview and extra options for trash"
arch=(i686 x86_64)
license=('GPL2' 'LGPL2.1')
url="http://thunar.xfce.org"
groups=('xfce4')
conflicts=('thunar')
replaces=('thunar')
provides=('thunar=4.18.9')
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

sha256sums=('7d0bdae2076a568c137d403ab5600e06a7a4f7a02514d486da7b8414aa75d612'
            '1d2bb30a12076c2882585bfca6d6722e3d995e730afc604a4f01229220097452'
            '6bab6749d04e386b445870a782e9394b6476714f7edd6f2d7e89da2013a77c59')
