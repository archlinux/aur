# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Andrew Crerar <andrew (dot) crerar at gmail>
# Contributor: RKA KriK <rka_krik@mail.ru>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Truocolo <truocolo@aol.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
_pkg="gtk"
_project="gnome"
_pkgbase="${_pkg}3"
pkgbase="${_pkgbase}-git"
pkgname=(
  "${pkgbase}"
  "${_pkgbase}-demos-git"
  "${_pkgbase}-docs-git"
)
pkgver=3.24.41.r1.g40fe0985
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (GIT Version)"
arch=(
  'i686'
  'x86_64'
  'arm'
  'armv7h'
  'aarch64'
)
url="http://www.${_pkg}.org/"
license=(
  'LGPL-2.0-Only')
depends=(
  'at-spi2-atk'
  'atk'
  'cairo'
  'colord'
  'glib2'
  "${_pkg}-update-icon-cache"
  'libcups'
  'libepoxy'
  'libxcomposite'
  'libxcursor'
  'libxdamage'
  'libxi'
  'libxinerama'
  'libxkbcommon'
  'libxrandr'
  'pango'
  'shared-mime-info'
  'wayland'
  'wayland-protocols'
)
makedepends=(
  'gobject-introspection')
optdepends=(
  "${_project}-icon-theme: Default icon theme"
  "${_project}-themes-standard: Default widget theme")
conflicts=('gtk3' )
provides=(
  "${_pkgbase}=${pkgver}"
  "${_pkgbase}-print-backends"
  "lib${_pkg}-3.so"
  "libgdk-3.so"
  "libgailutil-3.so")
backup=("usr/share/${_pkg}-3.0/settings.ini")
_http="https://gitlab.${_project}.org"
_ns="GNOME"
_url="${_http}/${_ns}/${_pkg}"
_local="file://${HOME}/${_pkg}"
source=(
  "git+${_url}.git#branch=${_pkg}-3-24"
  # "git+${_local}#branch=${_pkg}-3-24"
  settings.ini
  "${_pkg}-query-immodules-3.0.hook"
)
sha256sums=('SKIP'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'a0319b6795410f06d38de1e8695a9bf9636ff2169f40701671580e60a108e229')

pkgver() {
  cd \
    "${_pkg}"
  git \
    describe \
    --long | \
    sed \
      -r \
        's/([^-]*-g)/r\1/;s/-/./g'
}

_meson_options=(
  -D broadway_backend=true
  -D cloudproviders=true
  -D colord=yes
  -D gtk_doc=false
  -D introspection=true
  -D man=true
  -D tracker3=true
)

build() {
  CFLAGS+=" -DG_DISABLE_CAST_CHECKS"
  arch-meson \
    "${_pkg}" \
    build \
      "${_meson_options[@]}"
  meson \
    compile \
    -C build
}

# build() {
#   cd "${_pkg}"
# 
#   ./autogen.sh --disable-schemas-compile \
#                --enable-broadway-backend \
#                --enable-gtk2-dependency \
#                --enable-wayland-backend \
#                --enable-x11-backend \
#                --localstatedir=/var \
#                --prefix=/usr \
#                --sysconfdir=/etc
# 
#   # https://bugzilla.gnome.org/show_bug.cgi?id=655517
#   sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
# 
#   make
# }

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir \
      -p \
      "$(dirname \
           "${d}")"
    mv \
      "${f}" \
      "$d"
    rmdir \
      -p \
      --ignore-fail-on-non-empty \
      "$(dirname \
           "${f}")"
  done
}

package_gtk3-git() {
  depends+=(
    "${_pkg}-update-icon-cache")
  optdepends=(
    'evince: Default print preview command')
  provides=(
    "${_pkgbase}-print-backends"
    libgailutil-3.so
    libgdk-3.so
    "lib${_pkg}-3.so"
  )
  conflicts=(
    "${_pkgbase}-print-backends")
  replaces=(
    "${_pkgbase}-print-backends<=3.22.26-1")
  install="${pkgbase}.install"

  meson \
    install \
      -C build \
      --destdir "${pkgdir}"

  install \
    -Dm644 \
    /dev/stdin \
    "${pkgdir}/usr/share/${_pkg}-3.0/settings.ini" <<END
[Settings]
${_pkg}-icon-theme-name = Adwaita
${_pkg}-theme-name = Adwaita
gtk-font-name = Cantarell 11
END

  install \
    -Dt \
    "${pkgdir}/usr/share/libalpm/hooks" \
    -m644 \
    "${_pkg}-query-immodules-3.0.hook"

  cd \
    "${pkgdir}"

  _pick \
    demo \
    "usr/bin/${_pkgbase}-"{demo,demo-application,icon-browser,widget-factory}
  _pick \
    demo \
    "usr/share/applications/${_pkgbase}-"{demo,icon-browser,widget-factory}".desktop"
  _pick \
    demo \
    "usr/share/glib-2.0/schemas/org.${_pkg}."{Demo,exampleapp}".gschema.xml"
  _pick \
    demo \
    "usr/share/icons/hicolor/"*"/apps/${_pkgbase}-"{demo,widget-factory}[-.]*
  _pick \
    demo 
    "usr/share/man/man1/${_pkgbase}-"{demo,demo-application,icon-browser,widget-factory}.1

  if [[ " ${_meson_options[*]} " =~ " gtk_doc=true "  ]]; then
    _pick \
      docs \
      "usr/share/${_pkg}-doc"
  fi

  # Built by GTK 4, shared with GTK 3
  rm \
    "usr/bin/${_pkg}-update-icon-cache"
  rm \
    "usr/share/man/man1/${_pkg}-update-icon-cache.1"
}

package_gtk3-demos-git() {
  pkgdesc+=" (demo applications)"
  depends=(
    "${_pkgbase}")
  mv \
    demo/* \
    "${pkgdir}"
}

package_gtk3-docs-git() {
  pkgdesc+=" (documentation)"
  depends=()
  if [[ " ${_meson_options[*]} " =~ " ${_pkg}_doc=true " ]]; then
    mv \
      "docs/"* \
      "${pkgdir}"
  fi
}

# vim:set sw=2 sts=-1 et:
