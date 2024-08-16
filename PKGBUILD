# Maintainer:
# Contributor: Sapphira Armageddos <shadowkyogre.public@gmail.com>

# Flag for whether to use marco
: ${_use_marco=0}

: ${_pkgtype=}

_pkgname="compiz-core"
pkgbase="$_pkgname${_pkgtype:-}"
pkgver=0.8.18
pkgrel=5
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
  'intltool'
  'libice'
)

options=('!libtool' '!emptydirs')

_pkgsrc="$_pkgname-v$pkgver"
_pkgext="tar.bz2"
source=(
  "$url/-/archive/v${pkgver}/$_pkgsrc.$_pkgext"
  "0001-fix-libxml-2.12-compatibility-ea7b373.patch"::"https://gitlab.com/compiz/compiz-core/-/commit/ea7b3731b1a8a0f2fb7aa765a84374658b67b1b7.patch"
)
sha256sums=(
  'e87018b2d6c9ab3da87d910b117a7ae35f64328eea485e6c2a532501b361144c'
  '237fe7ef98ebde56bf262c6e86f2906837868d804327b90f100d60c7e5c08e2e'
)

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

prepare() {
  cd "$_pkgsrc"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done

  sed -E -e 's&\blibrsvg-features\.h\b&rsvg-features.h&' -i "plugins/svg.c"
  sed '1 i#include <stdlib.h>' -i "include/compiz-core.h"
}

build() {
  export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=2}"

  cd "$_pkgsrc"

  NOCONFIGURE=1 ./autogen.sh
  ./configure "${_configure_opts[@]}"

  make
}

_package_compiz-core() {
  cd "$_pkgsrc"

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
