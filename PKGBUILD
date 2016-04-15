# Maintainer: ksj <podhorsky.ksj@gmail.com>
# Contributor: ksj <podhorsky.ksj@gmail.com>
# Contributor: Yosef Or Boczko <yosefor3@walla.com>

_gitname=gimp
_version=2.99
pkgname=${_gitname}-gtk3-git
pkgver=2.9.2.r933.gfc73b32
pkgrel=1
pkgdesc="GNU Image Manipulation Program"
arch=('i686' 'x86_64')
url="http://www.gimp.org"
license=('GPL' 'LGPL')
depends=('babl-git' 'gegl-git' 'lcms' 'libxpm' 'libwmf' 'libxmu' 'librsvg' 'libmng'
         'libexif' 'jasper' 'desktop-file-utils' 'libgexiv2' 'hicolor-icon-theme' 'libmypaint-git')
makedepends=('git' 'intltool' 'poppler-glib' 'alsa-lib' 'iso-codes' 'gobject-introspection' 
'curl' 'ghostscript' 'libxslt')
optdepends=('gutenprint: for sophisticated printing only as gimp has built-in cups print support'
			'libwebkit: for the help browser' 
			'poppler-glib: for pdf support'
			'alsa-lib: for MIDI event controller module'
			'curl: for URI support'
			'xorg-server-xvfb: for xvfb-run'
			'ghostscript: for postscript support')
options=('!libtool' '!makeflags')
install=$pkgname.install
replaces=("gimp-${_version}")
provides=("gimp-${_version}")
conflicts=("gimp-${_version}")
source=(git://git.gnome.org/gimp#branch=gtk3-port
		linux.gpl)
md5sums=('SKIP' #generate with 'makepkg -g'
         'bb27bc214261d36484093e857f015f38')

pkgver() {
	cd $_gitname
	git describe --long | sed 's/GIMP_//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/\./g'
}

prepare() {
	cd $_gitname
	sed -i -e 's/automake-1.11/automake-1.14/g;s/aclocal-1.11/aclocal-1.14/g' autogen.sh
	sed -i 's/gimp.desktop/gimp-'${_version}'.desktop/g' desktop/gimp.appdata.xml.in
	sed -i  '/_Name=/ s/$/ '${_version}'/;s/Icon=gimp/&-'${_version}'/' desktop/gimp.desktop.in.in

	#fix non-existing theme
	sed -i 's/03-Dark/System/' app/config/gimpguiconfig.h
}

build() {
	cd $_gitname

	./autogen.sh --prefix=/usr --sysconfdir=/etc \
	--enable-mp --enable-gimp-console \
	--disable-python --with-gif-compression=lzw --with-libcurl \
	--without-aa --without-hal --without-gvfs --without-gnomevfs \
	--disable-gtk-doc
	make
}

package() {
	cd $_gitname
	make DESTDIR="$pkgdir/" install

	mv "${pkgdir}/usr/share/appdata/gimp.appdata.xml" "${pkgdir}/usr/share/appdata/gimp-${_version}.appdata.xml"
	mv "${pkgdir}/usr/share/applications/gimp.desktop" "${pkgdir}/usr/share/applications/gimp-${_version}.desktop"

	install -D -m644 "${srcdir}/linux.gpl" "${pkgdir}/usr/share/gimp/3.0/palettes/Linux.gpl"
	mv "${pkgdir}/usr/share/aclocal/gimp-2.0.m4" "${pkgdir}/usr/share/aclocal/gimp-${_version}.m4"

	for _icon in 16 22 24 32 48 256; do
		mv "${pkgdir}"/usr/share/icons/hicolor/${_icon}x${_icon}/apps/gimp{,-${_version}}.png
	done
}

