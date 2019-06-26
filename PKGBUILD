# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=gnome-inform7
pkgver=6M62
pkgrel=4
pkgdesc="GNOME port of the Inform 7 IDE for the Inform 7 programming language for interactive fiction"
arch=('i686' 'x86_64')
url="https://github.com/ptomato/gnome-inform7"
license=('GPL3')
depends=('aspell-en' 'dconf' 'desktop-file-utils' 'goocanvas1' 'gtksourceview2'
         'gtkspell' 'hicolor-icon-theme' 'webkitgtk2' 'gst-plugins-base'
         'gst-plugins-bad' 'gst-plugins-good')
makedepends=('autoconf>=2.60' 'automake>=1.10' 'graphviz'
             'intltool' 'pkgconfig' 'texlive-core')
options=('!libtool')
install="${pkgname}.install"
source=("http://inform7.com/apps/${pkgver}/I7_${pkgver}_Linux_all.tar.gz"
        "https://github.com/ptomato/${pkgname}/releases/download/${pkgver}/Gnome_UI_Source_${pkgver}.tar.xz")
md5sums=('cf8a251a3531eadf29d9490c2bb53802'
         '71a4c55329e154e4cb667b5c114296d3')
[ "${CARCH}" = "i686" ]   && _arch='i386'
[ "${CARCH}" = "x86_64" ] && _arch='x86_64'

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  bsdtar -C src/ni --strip-components 3 -xf "${srcdir}/inform7-${pkgver}/inform7-compilers_${pkgver}_${_arch}.tar.gz" share/inform7/Compilers/ni
  CFLAGS="${CFLAGS} -fno-strict-aliasing" ./configure --prefix=/usr --sysconfdir=/etc --enable-manuals
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
  chown -R `id -u`:`id -g` "${pkgdir}/usr/share/gnome-inform7"/{Documentation,Extensions}
}

# vim:set ts=2 sw=2 et:
