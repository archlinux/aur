# MINGW port for the evince-light AUR package

pkgbase=mingw-w64-evince-light
_pkgbase=evince
pkgname=mingw-w64-evince-light
pkgver=3.22.1
pkgrel=1
pkgdesc="GNOME document viewer ported for win32, built with pdf support"
url="https://wiki.gnome.org/Apps/Evince"
arch=('any')
license=('GPL')
depends=(
          'mingw-w64-crt'
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
makedepends=('itstool' 'intltool' 'mingw-w64-gcc' 'mingw-w64-configure' 'mingw-w64-binutils' 'patch' 'wine')
provides=("${pkgbase}")

# Disable binary stripping (it is performed manually in the package() function)
# Allow static libraries to remain in package
# Disable user defined build parameters (CPP/C/LD/CXX FLAGS)
options=('!strip' 'staticlibs' '!buildflags')

install=${pkgbase}.install
source=("http://ftp.gnome.org/pub/GNOME/sources/${_pkgbase}/${pkgver%.*}/${_pkgbase}-${pkgver}.tar.xz"
        "ev_spawn.patch"
        "ev_poppler.patch"
)
sha256sums=('f3d439db3b5a5745d26175d615a71dffa1535235b1e3aa0b85d397ea33ab231c'
            '90d572fabbb33a91731807216c9ab57847b0a90f657b62c391a83e6510cfadcc'
            '4b13bc32d7656e4011baf11d84b1e201e8b0b97c2ed9094fa6a2463eb6ba2629'
           )

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build()
{
    cd ${srcdir}/${_pkgbase}-${pkgver}

  ## Apply patch to circumvent GIO's lack of win32 support for the
  #  g_app_info_create_from_commandline() function
  #
  #  More specifically, this patch restores functionnality for spawning new 
  #  evince windows. This is useful for the "new window", "Open copy" and "Open"
  #  menus. Instead of using gio's API, it makes evince use the win32 API
  #  directly (ShellExecute).
  patch -p2 < ../../ev_spawn.patch

  # Patch for missing include in ev-poppler.cc
  patch -p1 < ../../ev_poppler.patch

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
#        --enable-pdf if building with poppler-glib
#        --enable-ps if building with libspectre
#        --enable-djvu if building with djvulibre
#        --enable-dvi if building with texlive-bin
#        --enable-xps if building with libgxps
#        --enable-comics if you want comics support

    make LDFLAGS=${_LDFLAGS}
    cd ..
  done
}

package()
{
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    alias strip=${_arch}-strip
    make DESTDIR="${pkgdir}" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' | xargs -rtl1 ${_arch}-strip -g
    cd ..
  done
}

# vim: set tabstop=2 expandtab:
