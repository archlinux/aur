# MINGW port for the evince-light AUR package

pkgbase=mingw-w64-evince-light
pkgname=mingw-w64-evince-light
pkgver=3.16.1
pkgrel=1
pkgdesc="GNOME document viewer ported for win32, built with pdf support"
url="https://wiki.gnome.org/Apps/Evince"
arch=('i686' 'x86_64')
license=('GPL')
depends=(
         'gsettings-desktop-schemas'
         'mingw-w64-gtk3'
		 'mingw-w64-libxml2'
         'mingw-w64-poppler'
         )
# Add to depends:
#        'libspectre' for PostScript
#        'djvulibre' for DJVU
#        'texlive-bin' for DVI
#        'libgxps' for XPS
#        'gvfs' for bookmark and annotations
makedepends=('itstool' 'intltool' 'mingw-w64-gcc' 'mingw-w64-configure' 'mingw-w64-binutils')
provides=("${pkgbase}")

# Disable binary stripping (it is performed manually in the package() function)
options=(!strip)

install=${pkgbase}.install
source=("http://ftp.gnome.org/pub/GNOME/sources/${pkgbase}/${pkgver%.*}/${pkgbase}-${pkgver}.tar.xz")
sha256sums=('06ff75065b2a30cd588c402f6bd2ea88ee3166181805e0cc00bd54f71dbf6130')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build()
{
    cd ${srcdir}/${pkgbase}-${pkgver}

#        --enable-pdf if building with poppler-glib
#        --enable-ps if building with libspectre
#        --enable-djvu if building with djvulibre
#        --enable-dvi if building with texlive-bin
#        --enable-xps if building with libgxps
#        --enable-comics if you want comics support

  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"

	## Explicitely adding the stack smashing protector library to the LDFLAGS
	#  (-lssp)
	#  This solves missing symbols issues during link (inc. __stack_chk_fail,
	#  __stack_chl_guard)
	_LDFLAGS="-lssp"

    ${_arch}-configure \
		--exec-prefix=/usr/${_arch} \
        --sysconfdir=/etc \
        --prefix=/usr/${_arch} \
        --localstatedir=/var \
        --with-platform=win32 \
        --disable-debug \
        --disable-maintainer-mode \
        --disable-schemas-compile \
        --enable-viewer \
        --disable-previewer \
        --disable-thumbnailer \
        --enable-pdf \
        --disable-ps \
        --disable-djvu \
        --disable-dvi \
        --disable-xps \
        --disable-comics \
        --enable-t1lib \
        --enable-tiff \
        --disable-nautilus \
        --disable-browser-plugin \
        --disable-gtk-doc \
        --disable-introspection \
        --disable-dbus \
        --without-keyring \
        --without-gtk-unix-print \
        --disable-libgnome-desktop
    make LDFLAGS=${_LDFLAGS}
	cd ..
  done
}

package()
{
  cd "${srcdir}/${pkgbase}-${pkgver}"
  for _arch in ${_architectures}; do
    cd "build-${_arch}"
	alias strip=${_arch}-strip
    make DESTDIR="${pkgdir}" install
	find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' | xargs -rtl1 ${_arch}-strip -g
    cd ..
  done
}
