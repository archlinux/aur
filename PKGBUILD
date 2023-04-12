# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=thunar-extended
pkgver=4.18.4
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

sha256sums=('c4463ce2fb1d628adce70a828e8b4de5fa0802236894d2c40f749471619bedcc'
            '1d2bb30a12076c2882585bfca6d6722e3d995e730afc604a4f01229220097452'
            'a9aec6e90ea6012fc7c24f9c4b368264e778998c1c761428f1a862be5187eff8')
