# Maintainer:  Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Contributor: martadinata666 <martadinata666@gmail.com>

# Flag for whether to use marco
_use_marco=0

# Flag for whether to use GTK+3
# Autoset depending on marco option
_use_gtk3=0

_upstream="compiz-core"

pkgbase=compiz-core-git
pkgname=(compiz-core-git compiz-gtk-git)
pkgver=0.8.18.r0.gae031701
pkgrel=1
pkgdesc="This is the latest git release of Compiz without DE deps"
url="https://gitlab.com/compiz/${_upstream}"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('startup-notification' 'librsvg' 'dbus' 'glu' 'libxslt' 'libxrandr' 'libsm' 'libxcomposite' 'libxinerama' 'libxi' 'libxcursor')
makedepends=('intltool' 'libice' 'libxi' 'libxcursor')
options=(!libtool !emptydirs)
source=(
	"git+https://gitlab.com/compiz/${_upstream}.git"
	compiz-gtk-update-icon-cache.hook
	compiz-gtk-update-icon-cache.script
	compiz-gtk-remove-icon-cache.hook
	compiz-gtk-remove-icon-cache.script
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

pkgver() {
  cd "${srcdir}/${_upstream}"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
  cd "${srcdir}/${_upstream}"

  NOCONFIGURE=1 ./autogen.sh
  ./configure "${_configure_opts[@]}"

  if ! grep -q pkg_cv_GTK config.log;then
    # make sure only compiz-core-git is created if gtk is missing
    echo "Making sure only $pkgbase is made, gtk+2 or gtk+3 is missing" >&2
    pkgname=("$pkgbase")
  fi

  make
}

package_compiz-core-git() {
  cd "$srcdir/${_upstream}"

  pkgdesc+=" (Core w/o decorator)"
  depends+=('hicolor-icon-theme' 'libxi' 'libxcursor')
  provides=("compiz-core=$pkgver")
  conflicts=('compiz' 'compiz-core')

  make DESTDIR="$pkgdir" install

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

  install -Dm644 "${srcdir}/compiz-gtk-update-icon-cache.hook" "${pkgdir}/usr/share/libalpm/hooks/compiz-gtk-update-icon-cache.hook"
  install -Dm755 "${srcdir}/compiz-gtk-update-icon-cache.script" "${pkgdir}/usr/share/libalpm/scripts/compiz-gtk-update-icon-cache"
  install -Dm644 "${srcdir}/compiz-gtk-remove-icon-cache.hook" "${pkgdir}/usr/share/libalpm/hooks/compiz-gtk-remove-icon-cache.hook"
  install -Dm755 "${srcdir}/compiz-gtk-remove-icon-cache.script" "${pkgdir}/usr/share/libalpm/scripts/compiz-gtk-remove-icon-cache"
}

package_compiz-gtk-git()
{
  depends+=('compiz-core-git')
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
  provides=("compiz-gtk=$pkgver")
  conflicts=('compiz-gtk')

  cd "${srcdir}/${_upstream}/gtk-window-decorator"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/${_upstream}/images"
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

sha1sums=('SKIP'
          '157cc6fd3930d715a076a66a61969b99951871e5'
          'a40694c0fbcc5179a42fb6ced0842ef7dda9570e'
          'c40f1b1135695f4db834810d1307defe36ea1eab'
          'a572626cef5c368f54f08f99b51757ef6790a81c')
