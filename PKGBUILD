# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: ksj <podhorsky.ksj@gmail.com>
# Contributor: Yosef Or Boczko <yosefor3@walla.com>

pkgname=gimp-gtk3-git
epoch=1
pkgver=2.10.0.r679.g6f28c5e192
pkgrel=1
pkgdesc="GNU Image Manipulation Program build against GTK3 from gtk3-port git-branch"
arch=('i686' 'x86_64')
url="http://www.gimp.org"
license=('GPL' 'LGPL')
depends=('babl>=0.1.48' 'gegl>=0.4' 'lcms' 'libxpm' 'libwmf' 'libxmu' 'librsvg' 'libmng' 'libexif' 'gtk3'
	 'jasper' 'desktop-file-utils' 'libgexiv2' 'hicolor-icon-theme' 'mypaint-brushes' 'aalib')
makedepends=('git' 'glib-networking' 'intltool' 'poppler-glib' 'alsa-lib' 'iso-codes'
	     'gobject-introspection' 'curl' 'ghostscript' 'libxslt' 'appstream-glib'
	     'pygtk' 'python-cairo' 'gtk-doc' 'poppler-data')
optdepends=('gutenprint: for sophisticated printing only as gimp has built-in cups print support'
	    'libwebkit: for the help browser'
	    'libwebp: for support of the webp file format' 
	    'poppler-glib: for pdf support'
	    'openexr: for the openexr file format' 
	    'alsa-lib: for MIDI event controller module'
	    'curl: for URI support'
	    'xorg-server-xvfb: for xvfb-run'
	    'ghostscript: for postscript support')
options=('!libtool' '!makeflags')
provides=('gimp')
conflicts=('gimp')
source=(git+https://git.gnome.org/browse/gimp#branch=gtk3-port 'linux.gpl::https://git.archlinux.org/svntogit/packages.git/plain/trunk/linux.gpl?h=packages/gimp')
md5sums=('SKIP'
         'bb27bc214261d36484093e857f015f38')


pkgver() {
  cd ${pkgname%-gtk3-git}
  git describe --long | sed 's/GIMP_//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/\./g'
}

prepare() {
  cd ${pkgname%-gtk3-git}
  sed -i -e 's/automake-1.11/automake-1.14/g;s/aclocal-1.11/aclocal-1.14/g' autogen.sh
  sed -i  '/_Name=/ s/$/ '${pkgver}'/;s/Icon=gimp/&-'${pkgver}'/' desktop/gimp.desktop.in.in

  #fix non-existing theme
  sed -i 's/03-Dark/System/' app/config/gimpguiconfig.h

  if [ -f /usr/lib/pkgconfig/libmypaint-1.3.pc ]; then
          sed -i 's/libmypaint /libmypaint-1.3 /g' configure.ac
  fi
}

build() {
  cd ${pkgname%-gtk3-git}
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/bin \
	       --enable-mp --enable-gimp-console --enable-python \
	       --with-aa --without-webkit --enable-gtk-doc 
  make
}

package() {
  cd ${pkgname%-gtk3-git}
  make DESTDIR="$pkgdir/" install

  mv "${pkgdir}"/usr/share/applications/gimp.desktop \
     "${pkgdir}"/usr/share/applications/gimp-${pkgver}.desktop

  install -D -m644 "${srcdir}"/linux.gpl "${pkgdir}"/usr/share/gimp/3.0/palettes/Linux.gpl
  mv "${pkgdir}"/usr/share/aclocal/gimp-2.0.m4 "${pkgdir}"/usr/share/aclocal/gimp-${pkgver}.m4

  for _icon in 16 22 24 32 48 256; do
    mv "${pkgdir}"/usr/share/icons/hicolor/${_icon}x${_icon}/apps/gimp{,-${pkgver}}.png
  done
}
