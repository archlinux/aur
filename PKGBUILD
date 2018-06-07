# Maintainer:  Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Contributor: martadinata666 <martadinata666@gmail.com>

# Flag for whether to use marco
_use_marco=0

# Flag for whether to use GTK+3
# Autoset depending on marco option
_use_gtk3=0

_upstream="compiz-core"
_pkgver=0.8.14
_micro=""

pkgbase=compiz-core
pkgname=(compiz-core compiz-gtk)
pkgver="${_pkgver}${_micro}"
pkgrel=6
pkgdesc="This is the latest stable release of Compiz without DE deps"
url="https://gitlab.com/compiz/${_upstream}/"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('startup-notification' 'librsvg' 'dbus' 'glu' 'libxslt' 'libxrandr' 'libsm' 'libxcomposite' 'libxinerama')
makedepends=('intltool' 'libice')
options=(!libtool !emptydirs)
source=("${url}-/archive/v${pkgver}/${_upstream}-v${pkgver}.tar.bz2")

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

if (("${_use_marco}" == 1));then
  _configure_opts+=("--enable-marco")
  makedepends+=("marco")
  _use_gtk3=1
  msg "Marco theme support enabled with GTK+3"
elif (("${_use_marco}" == 2));then
  _configure_opts+=("--enable-marco")
  makedepends+=("marco-gtk2")
  _use_gtk3=0
  msg "Marco theme support enabled with GTK+2"
else
  _configure_opts+=("--disable-marco")
  msg "Marco theme support disabled, rebuild with _use_marco=1 in the PKGBUILD if you want it"
  msg "Rebuild with _use_marco=2 in the PKGBUILD if you have marco-gtk2"
fi

if (("${_use_gtk3}" >= 1)); then
	_configure_opts+=("--with-gtk=3.0")
	msg "Using GTK+3 for gtk-window-decorator"
else
	_configure_opts+=("--with-gtk=2.0")
	msg "Using GTK+2 for gtk-window-decorator"
fi

build()
{
  cd "${srcdir}/${_upstream}-v${pkgver}"

  NOCONFIGURE=1 ./autogen.sh
  ./configure "${_configure_opts[@]}"

  if ! grep -q pkg_cv_GTK config.log;then
    # make sure only compiz-core is created if gtk is missing
    msg "Making sure only $pkgbase is made, gtk+2 or gtk+3 is missing"
    pkgname=("$pkgbase")
  fi
  make
}

package_compiz-core() {
  cd "${srcdir}/${_upstream}-v${pkgver}"

  pkgdesc+=" (Core w/o decorator)"
  conflicts=('compiz')

  make DESTDIR="${pkgdir}" install

  local REMOVE_THESE=(
    "${pkgdir}/usr/bin/gtk-window-decorator"
    "${pkgdir}/usr/share/glib-2.0/schemas/org.compiz-0.gwd.gschema.xml"
    "${pkgdir}/usr/share/icons/hicolor/"*"/apps/gtk-decorator."*
  )
  # Believe it or not, you CAN fill an array using wildcards in bash

  for fname in "${REMOVE_THESE[@]}";do
    if [ -e "$fname" ];then
      rm "$fname"
    fi
  done
}

package_compiz-gtk()
{
  #separating libmarco-private would be nice, but this is a workaround for now
  depends+=('compiz-core')
  #separating libmarco-private would be nice, but this is a workaround for now
  if (("${_use_marco}" == 1));then
    depends+=('marco')
  elif (("${_use_marco}" == 2));then
    depends+=('marco-gtk2')
  fi

  if (( "${_use_gtk3}" >= 1 ));then
    depends+=('libwnck3')
  else
    depends+=('libwnck')
  fi

  pkgdesc+=" (GTK+ window decorator)"

  cd "${srcdir}/${_upstream}-v${pkgver}/gtk-window-decorator"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/${_upstream}-v${pkgver}/images"
  make DESTDIR="${pkgdir}" install

  local REMOVE_THESE=(
    "${pkgdir}/usr/share/icons/hicolor/"*"/apps/compiz."*
    "${pkgdir}/usr/share/compiz/"*.png
    "${pkgdir}/usr/share/applications/compiz.desktop"
  )
  # Believe it or not, you CAN fill an array using wildcards in bash

  for fname in "${REMOVE_THESE[@]}";do
    if [ -e "$fname" ];then
      rm "$fname"
    fi
  done
}

sha256sums=('7d6b27be0f49abdf6a8ff064e7bc96f01815ec86d0453b94d5b9240587e91089')
