# Maintainer: maz-1 <loveayawaka at gmail dot com>

pkgname=gimp-painter-git
pkgver=20151004.g87851f6
pkgrel=1
pkgdesc="Fork of GIMP aiming to add drawing and painting features to GIMP. Git version"
arch=('i686' 'x86_64')
url="http://www.gimp.org"
license=('GPL' 'LGPL')
groups=()
depends=('lcms2>=2.2' 'libwmf>=0.2.8' 'webkitgtk2>=1.6.1' \
         'libgexiv2' 'librsvg>=2.16.1' 'libpng>=1.2.27' \
         'fontconfig>=2.2.0' 'desktop-file-utils' \
         'libexif>=0.6.15' 'libart-lgpl>=2.3.19' 'pygtk' 'dbus-glib' 'gtk-doc' \
          'openexr>=1.6.1' 'cairo>=1.12.2' 'hicolor-icon-theme') #'gegl'
makedepends=('gutenprint>=5.0.0' 'intltool>=0.40.1' \
  'gnome-python>=2.16.2' 'poppler>=0.12.4' 'pkgconfig>=0.21' \
  'alsa-lib>=1.0.0' 'libtool>=2.2' 'autoconf>=2.54' 'automake>=1.10' \
  'libxslt' 'pango>=1.29.4' 'curl>=7.15.1' 'gettext' 'git')
optdepends=('gimp-paint-studio: Extra brushes and accompanying tool presets'
			'gutenprint: for sophisticated printing only as gimp has built-in cups print support'
            'poppler-glib: for pdf support'
            'alsa-lib: for MIDI event controller module'
            'curl: for URI support'
            'ghostscript: for postscript support'
            )
options=('!libtool' '!makeflags')
conflicts=('gimp' 'gimp-painter')
replaces=()
backup=()
install='gimp-painter.install'
source=(git://github.com/seagetch/gimp-painter.git
		linux.gpl
		look_for_automake_1.15.patch
		use_gegl_3.patch)
md5sums=('SKIP'
         'bb27bc214261d36484093e857f015f38'
         'f900314ce2dbdc9ea5e78ce7b656c0f6'
         'fe939863cf9a4dc4fe76076a8e4a9645')

noextract=()

_gitname=gimp-painter

pkgver() {
	cd $_gitname
	GITREV=$(git describe --always|awk -F"-" '{print $NF}')
	echo `date +%Y%m%d`.${GITREV}
}
prepare() {
    cd "$srcdir/$_gitname"
    patch -p1 < ../look_for_automake_1.15.patch
    patch -p1 < ../use_gegl_3.patch
}

build() {
  cd "$srcdir/$_gitname"
  gtkdocize
  PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr --sysconfdir=/etc \
    --enable-mp --enable-gimp-console --enable-gimp-remote \
    --enable-python --with-gif-compression=lzw --with-libcurl \
    --without-aa --without-hal --without-gvfs --without-gnomevfs
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' "${pkgdir}"/usr/lib/gimp/2.0/plug-ins/*.py
  install -D -m644 "${srcdir}/linux.gpl" "${pkgdir}/usr/share/gimp/2.0/palettes/Linux.gpl"
  install -D -m644 "$srcdir/$_gitname/libgimp/gimpmypaintbrushselect_pdb.h" \
    "${pkgdir}/usr/include/gimp-2.0/libgimp/gimpmypaintbrushselect_pdb.h"
	
	GIMPBIN=` ls ${pkgdir}/usr/bin | grep -e 'gimp-2' `
	GIMPCLIBIN=` ls ${pkgdir}/usr/bin | grep -e 'gimp-console-2' `
  [ -f ${pkgdir}/usr/bin/gimp ] || ln -s $GIMPBIN ${pkgdir}/usr/bin/gimp
  [ -f ${pkgdir}/usr/bin/gimp-console ] || ln -s GIMPCLIBIN ${pkgdir}/usr/bin/gimp-console
}

