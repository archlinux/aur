# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Iru Cai <mytbk920423@gmail.com>
# Contributor: Alexander Hunziker <alex.hunziker@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
pkgname=gimp-git
_pkgname=${pkgname%-git}
epoch=1
pkgver=2.99.1.5483ea8
pkgrel=1
pkgdesc="GNU Image Manipulation Program"
arch=('i686' 'x86_64')
url="https://www.gimp.org"
license=('GPL' 'LGPL')
depends=('pygtk' 'lcms2>=2.2' 'libwmf>=0.2.8' 'icu' 'enchant'
         'libgexiv2' 'librsvg>=2.16.1' 'desktop-file-utils'
         'libexif>=0.6.15' 'libart-lgpl>=2.3.19' 'dbus-glib' 'gtk-doc'
         'poppler-glib' 'poppler-data' 'openexr>=1.6.1' 'mypaint-brushes>=1.3.0'
         'babl>=0.1.47' 'gegl>0.4.9' 'cairo>=1.14' 'appstream-glib>=0.7.7')
makedepends=('git' 'gutenprint>=5.0.0' 'intltool>=0.40.1'
             'gnome-python>=2.16.2'
             'alsa-lib>=1.0.0' 'libxslt' 'glib-networking')
optdepends=('gutenprint: for sophisticated printing only as gimp has built-in cups print support'
            'alsa-lib: for MIDI event controller module'
            'curl: for URI support'
            'ghostscript: for postscript support')
options=('!libtool')
provides=('gimp')
conflicts=('gimp')
source=('git+https://gitlab.gnome.org/GNOME/gimp.git'
        'linux.gpl')
sha512sums=('SKIP'
            '6f33d57f242fa8ce04b65e06a712bd54677306a45b22cb853fbe348089cd4673bd4ed91073074fe067166fe8951c370f8bbbc386783e3ed5170d52e9062666fe')

pkgver() {
  cd $_pkgname

  echo $(grep '^m4_define(\[gimp_api_version\], \[.*\])' | sed -e 's|m4_define(\[gimp_api_version\], \[||' -e 's|\])||').$(git log --pretty=format:'%h' -n 1)
}

prepare() {
  cd $_pkgname

  if [ -f /usr/lib/pkgconfig/libmypaint-1.3.pc ]; then
    sed -i 's/libmypaint /libmypaint-1.3 /g' configure.ac
  fi

  PYTHON=/usr/bin/python2 autoreconf -if

  ./configure \
  	--prefix=/usr \
  	--sysconfdir=/etc \
  	--enable-mp \
  	--enable-gimp-console \
  	--enable-gimp-remote \
  	--enable-python \
  	--with-gif-compression=lzw \
  	--with-libcurl \
  	--without-aa \
  	--without-hal \
  	--without-gvfs \
  	--without-gnomevfs
}

build() {
  cd $_pkgname

  PYTHONPATH=/usr/share/glib-2.0:$PYTHONPATH make
}

package() {
  cd $_gitname

  make DESTDIR="$pkgdir" install

  install -Dm 644 "$srcdir"/linux.gpl "$pkgdir"/usr/share/gimp/2.0/palettes/Linux.gpl
}

