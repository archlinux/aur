# Maintainer: martadinata666 <martadinata666@gmail.com>

_use_marco=0

_upstream="compiz"

pkgbase=compiz-core-git
pkgname=(compiz-core-git compiz-gtk-git)
pkgver=0.8.12.3.r0.g59328f2
pkgrel=1
pkgdesc="This is the latest git release of Compiz without DE deps"
url="https://github.com/compiz-reloaded/${_upstream}"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('startup-notification' 'librsvg' 'dbus' 'glu' 'libxslt' 'libxrandr' 'libsm' 'libxcomposite' 'libxinerama')
makedepends=('intltool' 'libice')
options=(!libtool !emptydirs)
provides=("compiz-core=$pkgver")
source=(
	"git+https://github.com/compiz-reloaded/${_upstream}.git"
)

sha1sums=('SKIP')

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

pkgver() {
  cd "${srcdir}/${_upstream}"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
  cd "${srcdir}/${_upstream}"

  NOCONFIGURE=1 ./autogen.sh
  ./configure "${_configure_opts[@]}"

  make
}

package_compiz-core-git() {
  cd "$srcdir/${_upstream}"

  pkgdesc+=" (Core w/o decorator)"
  provides=("compiz-core=$pkgver")
  conflicts=('compiz' 'compiz-core')

  make DESTDIR="$pkgdir" install
  rm "${pkgdir}/usr/bin/gtk-window-decorator"
  rm "${pkgdir}/usr/share/glib-2.0/schemas/org.compiz-0.gwd.gschema.xml"
  rm "${pkgdir}/usr/share/icons/hicolor/"*"/apps/gtk-decorator."*
}

package_compiz-gtk-git()
{
  if (("${_use_marco}"));then
    #separating libmarco-private would be nice, but this is a workaround for now
    depends+=('marco')
  fi
  pkgdesc+=" (GTK+ window decorator)"
  provides=("compiz-gtk=$pkgver")
  conflicts=('compiz-gtk')

  cd "${srcdir}/${_upstream}/gtk"
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}/usr/share/applications/compiz.desktop"

  cd "${srcdir}/${_upstream}/images"
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}/usr/share/icons/hicolor/"*"/apps/compiz."*
  rm "${pkgdir}/usr/share/compiz/"*.png
}
