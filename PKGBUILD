# Maintainer:  Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Contributor: martadinata666 <martadinata666@gmail.com>

# Flag for whether to use marco
_use_marco=0

# Flag for whether to use GTK+3
# Autoset depending on marco option
_use_gtk3=0

_upstream="compiz-core"
_pkgver=0.8.18
_micro=""

pkgbase=compiz-core
pkgname=(compiz-core compiz-gtk)
pkgver="${_pkgver}${_micro}"
pkgrel=3
pkgdesc="This is the latest stable release of Compiz without DE deps"
url="https://gitlab.com/compiz/${_upstream}/"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('startup-notification' 'librsvg' 'dbus' 'glu' 'libxslt' 'libxrandr' 'libsm' 'libxcomposite' 'libxinerama' 'libxi' 'libxcursor')
makedepends=('intltool' 'libice')
options=(!libtool !emptydirs)
source=("${url}-/archive/v${pkgver}/${_upstream}-v${pkgver}.tar.bz2"
"fix-rsvg-features-include.patch")

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
  echo "Marco theme support enabled with GTK+3" >&2
elif (("${_use_marco}" == 2));then
  _configure_opts+=("--enable-marco")
  makedepends+=("marco-gtk2")
  _use_gtk3=0
  echo "Marco theme support enabled with GTK+2" >&2
else
  _configure_opts+=("--disable-marco")
  echo "Marco theme support disabled, rebuild with _use_marco=1 in the PKGBUILD if you want it" >&2
  echo "Rebuild with _use_marco=2 in the PKGBUILD if you have marco-gtk2" >&2
fi

if (("${_use_gtk3}" >= 1)); then
	_configure_opts+=("--with-gtk=3.0")
	echo "Using GTK+3 for gtk-window-decorator" >&2
else
	_configure_opts+=("--with-gtk=2.0")
	echo "Using GTK+2 for gtk-window-decorator" >&2
fi

prepare()
{
  cd "${srcdir}/${_upstream}-v${pkgver}"
  patch -Np1 -i "${srcdir}/fix-rsvg-features-include.patch"
}

build()
{
  cd "${srcdir}/${_upstream}-v${pkgver}"

  NOCONFIGURE=1 ./autogen.sh
  ./configure "${_configure_opts[@]}"

  if ! grep -q pkg_cv_GTK config.log;then
    # make sure only compiz-core is created if gtk is missing
    echo "Making sure only $pkgbase is made, gtk+2 or gtk+3 is missing" >&2
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
    # "${pkgdir}/usr/share/applications/compiz.desktop"
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
  )
  # Believe it or not, you CAN fill an array using wildcards in bash

  for fname in "${REMOVE_THESE[@]}";do
    if [ -e "$fname" ];then
      rm "$fname"
    fi
  done
}

sha256sums=('e87018b2d6c9ab3da87d910b117a7ae35f64328eea485e6c2a532501b361144c'
            'eeeb8629fb4757a8305aa782aae7dba41e82ab12b330e461b10a2b5935f68f77')
