# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: ksj <podhorsky.ksj@gmail.com>
# Contributor: Yosef Or Boczko <yosefor3@walla.com>

_version=2.99
_gitname=gimp
pkgname=${_gitname}-gtk3-git
pkgver=2.9.8.r741.g8b3a6bcf5c
pkgrel=1
pkgdesc="GNU Image Manipulation Program"
arch=('i686' 'x86_64')
url="http://www.gimp.org"
license=('GPL' 'LGPL')
depends=('babl-git' 'gegl-git' 'lcms' 'libxpm' 'libwmf' 'libxmu' 'librsvg' 'libmng' 'libexif' 'gtk3'
	 'jasper' 'desktop-file-utils' 'libgexiv2' 'hicolor-icon-theme' 'mypaint-brushes')
makedepends=('git' 'glib-networking' 'intltool' 'poppler-glib' 'alsa-lib' 'iso-codes'
	     'gobject-introspection' 'curl' 'ghostscript' 'libxslt' 'appstream-glib'
	     'pygtk' 'python-cairo')
optdepends=('gutenprint: for sophisticated printing only as gimp has built-in cups print support'
	    'libwebkit: for the help browser'
	    'libwebp: for support of the webp file format' 
	    'poppler-glib: for pdf support'
	    'openexr: for the openexr file format' 
	    'alsa-lib: for MIDI event controller module'
	    'curl: for URI support'
	    'xorg-server-xvfb: for xvfb-run'
	    'ghostscript: for postscript support')
options=('!libtool')
provides=("gimp")
conflicts=("gimp")
source=(git+https://git.gnome.org/browse/gimp#branch=gtk3-port 'linux.gpl::https://git.archlinux.org/svntogit/packages.git/plain/trunk/linux.gpl?h=packages/gimp'
)
md5sums=('SKIP'
         'bb27bc214261d36484093e857f015f38')

pkgver() {
  cd $_gitname
  git describe --long | sed 's/GIMP_//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/\./g'
}

prepare() {
  cd $_gitname
  sed -i -e 's/automake-1.11/automake-1.14/g;s/aclocal-1.11/aclocal-1.14/g' autogen.sh
  sed -i 's/gimp.desktop/gimp-'${_version}'.desktop/g' desktop/org.gimp.GIMP.appdata.xml.in.in
  sed -i  '/_Name=/ s/$/ '${_version}'/;s/Icon=gimp/&-'${_version}'/' desktop/gimp.desktop.in.in

  #fix non-existing theme
  sed -i 's/03-Dark/System/' app/config/gimpguiconfig.h

  if [ -f /usr/lib/pkgconfig/libmypaint-1.3.pc ]; then
          sed -i 's/libmypaint /libmypaint-1.3 /g' configure.ac
  fi
}

build() {
  cd $_gitname

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --enable-mp --enable-gimp-console \
	       --enable-python --with-gif-compression=lzw --with-libcurl --without-aa \
	       --without-hal --without-gvfs --without-gnomevfs --without-webkit \
	       --enable-gtk-doc
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install

  mv "${pkgdir}"/usr/share/appdata/org.gimp.GIMP.appdata.xml \
     "${pkgdir}"/usr/share/appdata/gimp-${_version}.appdata.xml
  mv "${pkgdir}"/usr/share/applications/gimp.desktop \
     "${pkgdir}"/usr/share/applications/gimp-${_version}.desktop

  install -D -m644 "${srcdir}"/linux.gpl "${pkgdir}"/usr/share/gimp/3.0/palettes/Linux.gpl
  mv "${pkgdir}"/usr/share/aclocal/gimp-2.0.m4 "${pkgdir}"/usr/share/aclocal/gimp-${_version}.m4

  for _icon in 16 22 24 32 48 256; do
    mv "${pkgdir}"/usr/share/icons/hicolor/${_icon}x${_icon}/apps/gimp{,-${_version}}.png
  done
}

