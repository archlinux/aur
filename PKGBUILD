# Maintainer:
# Contributor: Sapphira Armageddos <shadowkyogre.public@gmail.com>

# Flag for whether to use marco
: ${_use_marco=0}

: ${_pkgtype=-git}

_pkgname="compiz-core"
pkgbase="$_pkgname${_pkgtype:-}"
pkgver=0.8.18.r23.gfe274c9
pkgrel=2
pkgdesc="Compositing manager without desktop-environment depends"
url="https://gitlab.com/compiz/compiz-core"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later' 'MIT')
arch=('i686' 'x86_64')

depends=(
  'dbus'
  'glu'
  'librsvg'
  'libsm'
  'libxcomposite'
  'libxcursor'
  'libxdamage'
  'libxi'
  'libxinerama'
  'libxrandr'
  'libxslt'
  'startup-notification'
)
makedepends=(
  'git'
  'intltool'
  'libice'
)

options=('!libtool' '!emptydirs')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

_configure_opts=(
  --prefix=/usr
  --enable-shared
  --enable-dbus
  --enable-dbus-glib
  --enable-librsvg
  --enable-glib
  --disable-static
  --disable-inotify
  --with-gtk=3.0
)

if (("${_use_marco}" == 0)); then
  echo "Marco theme support disabled, rebuild with _use_marco=1 if you want it" >&2
  _configure_opts+=("--disable-marco")
else
  echo "Marco theme support enabled" >&2
  _configure_opts+=("--enable-marco")
  makedepends+=("marco")
fi

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=2}"

  cd "$_pkgsrc"

  NOCONFIGURE=1 ./autogen.sh
  ./configure "${_configure_opts[@]}"

  make
}

_package_compiz-core() {
  pkgdesc+=" (Core w/o decorator)"

  provides=('compiz-core')
  conflicts=(
    'compiz'
    'compiz-core'
  )

  cd "$_pkgsrc"
  make DESTDIR="${pkgdir}" install

  local REMOVE_THESE=(
    "${pkgdir}/usr/bin/gtk-window-decorator"
    "${pkgdir}/usr/share/glib-2.0/schemas/org.compiz-0.gwd.gschema.xml"
    "${pkgdir}/usr/share/icons/hicolor/"*"/apps/gtk-decorator."*
    # "${pkgdir}/usr/share/applications/compiz.desktop"
  )
  # Believe it or not, you CAN fill an array using wildcards in bash

  for fname in "${REMOVE_THESE[@]}"; do
    if [ -e "$fname" ]; then
      rm "$fname"
    fi
  done
}

_package_compiz-gtk() {
  pkgdesc+=" (GTK+ window decorator)"
  depends+=(
    'compiz-core'
    'libwnck3'
  )

  provides=('compiz-gtk')
  conflicts=('compiz-gtk')

  if (("${_use_marco}" > 0)); then
    depends+=('marco')
  fi

  cd "$srcdir/$_pkgsrc/gtk-window-decorator"
  make DESTDIR="$pkgdir" install

  cd "$srcdir/$_pkgsrc/images"
  make DESTDIR="$pkgdir" install

  local REMOVE_THESE=(
    "$pkgdir"/usr/share/icons/hicolor/*/apps/compiz.*
    "$pkgdir"/usr/share/compiz/*.png
  )

  for fname in "${REMOVE_THESE[@]}"; do
    if [ -e "$fname" ]; then
      rm "$fname"
    fi
  done
}

pkgname=(
  "compiz-core${_pkgtype:-}"
  "compiz-gtk${_pkgtype:-}"
)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package_${_p%$_pkgtype}")
    _package_${_p%$_pkgtype}
  }"
done
