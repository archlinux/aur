# Maintainer: martadinata666 <martadinata666@gmail.com>

_use_marco=0

_upstream="compiz"
_pkgver=0.8.12
_micro=.3

pkgbase=compiz-core
pkgname=(compiz-core compiz-gtk)
pkgver="${_pkgver}${_micro}"
pkgrel=1
pkgdesc="This is the latest stable release of Compiz without DE deps"
url="https://github.com/compiz-reloaded/${_upstream}/"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('startup-notification' 'librsvg' 'dbus' 'glu' 'libxslt' 'libxrandr' 'libsm' 'libxcomposite' 'libxinerama')
makedepends=('intltool' 'libice')
options=(!libtool !emptydirs)
source=("${url}/releases/download/v${pkgver}/${_upstream}-${pkgver}.tar.xz")

_configure_opts=(
  --prefix=/usr
  --enable-shared
  --enable-dbus
  --enable-dbus-glib
  --enable-librsvg
  --enable-glib
  --disable-static
  --disable-inotify
)

if (("${_use_marco}"));then
  _configure_opts+=("--enable-marco")
  makedepends+=("marco")
  msg "Marco theme support enabled"
else
  _configure_opts+=("--disable-marco")
  msg "Marco theme support disabled, rebuild with _use_marco=1 in the PKGBUILD if you want it"
fi

build()
{
  cd "${srcdir}/${_upstream}-${pkgver}"

  NOCONFIGURE=1 ./autogen.sh
  ./configure "${_configure_opts[@]}"
        
  make
}

package_compiz-core() {
  cd "${srcdir}/${_upstream}-${pkgver}"

  pkgdesc+=" (Core w/o decorator)"
  provides=("compiz-core=$pkgver")
  conflicts=('compiz' 'compiz-core-git' 'compiz-git')

  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}/usr/bin/gtk-window-decorator"
  rm "${pkgdir}/usr/share/glib-2.0/schemas/org.compiz-0.gwd.gschema.xml"
  rm "${pkgdir}/usr/share/icons/hicolor/"*"/apps/gtk-decorator."*
}

package_compiz-gtk()
{
  if (("${_use_marco}"));then
    #separating libmarco-private would be nice, but this is a workaround for now
    depends+=('marco')
  fi
  pkgdesc+=" (GTK+ window decorator)"
  conflicts=('compiz-gtk-git')

  cd "${srcdir}/${_upstream}-${pkgver}/gtk"
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}/usr/share/applications/compiz.desktop"

  cd "${srcdir}/${_upstream}-${pkgver}/images"
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}/usr/share/icons/hicolor/"*"/apps/compiz."*
  rm "${pkgdir}/usr/share/compiz/"*.png
}

sha256sums=('6fc5176e3af5d6f434f26d1b654460aeeb3faf723db37f0957b46c2c23955032')
