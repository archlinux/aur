# Maintainer:
# Contributer: Yamada Hayao <hayao@fascode.net>
# Contributer: rilian-la-te <ria.freelander@gmail.com>

## options
: ${_build_mate:=true}
: ${_build_xfce:=true}
: ${_build_vala:=true}
: ${_build_budgie:=true}

: ${_build_registrar:=true}
: ${_build_translator:=true}

_pkgname="vala-panel-appmenu"
pkgbase="$_pkgname"
pkgver=25.04
pkgrel=1
pkgdesc="Global Menu plugin"
url="https://gitlab.com/vala-panel-project/vala-panel-appmenu"
license=('LGPL-3.0-or-later')
arch=('i686' 'x86_64')

makedepends=(
  'git'
  'glib2-devel'
  'gobject-introspection'
  'meson'
  'vala'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=$pkgver")
sha256sums=('843b24f98f02feb8cbfdda26630018ae95f8ac4959de9deb88cf1a13506f845f')

prepare() {
  sed -e 's&^.*if mate_found or vala_panel_found or budgie_found.*$&if true&' \
    -i "$_pkgsrc/data/meson.build"

  sed -E -e "s&(importer_dep = dependency)\('appmenu-glib-translator'&\1('_appmenu_glib_translator_'&" \
    -i "$_pkgsrc/lib/meson.build"

  sed -E -e "s&^(\s*version)\s*:\s*'[0-9.]'\s*,?\s*$&\1: '${pkgver}',&" \
  -i "$_pkgsrc/meson.build"
}

build() {
  sed -i 's/nb //' "${srcdir}/vala-panel-appmenu/po/LINGUAS"

  _build_registrar

  meson "${_opts[@]}" build "$_pkgsrc"
  meson compile -C build

  DESTDIR="$srcdir/fakeinstall" meson install -C build
}

_build_registrar() {
  [ "${_build_registrar::1}" != "t" ] && return
  local _path_reg="subprojects/registrar"
  arch-meson "$_pkgsrc/$_path_reg" build_registrar
  meson compile -C build_registrar
}

_package_vala-panel-appmenu-registrar() {
  pkgdesc="Small utility to hold DBusMenu menus"
  depends=('glib2')
  meson install -C build_registrar --destdir "$pkgdir"
}

_package_appmenu-glib-translator() {
  pkgdesc="GLib library to translate DBusMenu menus into GMenuModels"
  depends=(
    'dconf'
    'gdk-pixbuf2'
  )
  conflicts+=('vala-panel-appmenu-common')

  install -dm755 "$pkgdir"/{usr/lib,usr/share}
  mv "$srcdir"/fakeinstall/usr/include "$pkgdir"/usr/
  mv "$srcdir"/fakeinstall/usr/lib/pkgconfig "$pkgdir"/usr/lib/
  mv "$srcdir"/fakeinstall/usr/lib/libappmenu-glib-translator* "$pkgdir"/usr/lib/
  mv "$srcdir"/fakeinstall/usr/share/{gir-1.0,glib-2.0,vala} "$pkgdir"/usr/share/
}

_package_vala-panel-appmenu() {
  pkgdesc="metapackage - vala panel appmenu collection"
  arch=('any')
  depends=(
    "${_depends_meta[@]}"
    "vala-panel-appmenu-locale"
  )
}

_package_vala-panel-appmenu-locale() {
  pkgdesc="Translations for vala-panel-appmenu"
  arch=('any')
  depends=()
  conflicts+=('vala-panel-appmenu-common')

  install -dm755 "$pkgdir"/usr/share
  mv "$srcdir"/fakeinstall/usr/share/locale "$pkgdir"/usr/share/
}

_package_vala-panel-appmenu-budgie() {
  pkgdesc+=" for budgie-panel"
  depends=(
    "appmenu-glib-translator"
    'budgie-desktop'
  )

  install -dm755 "$pkgdir"/usr/lib
  mv "$srcdir"/fakeinstall/usr/lib/budgie-desktop "$pkgdir"/usr/lib/
}

_package_vala-panel-appmenu-mate() {
  pkgdesc+=" for mate-panel"
  depends=(
    "appmenu-glib-translator"
    'mate-panel'
  )

  install -dm755 "$pkgdir"/{usr/lib,usr/share}
  mv "$srcdir"/fakeinstall/usr/lib/mate-panel "$pkgdir"/usr/lib/
  mv "$srcdir"/fakeinstall/usr/share/mate-panel "$pkgdir"/usr/share/
}

_package_vala-panel-appmenu-valapanel() {
  pkgdesc+=" for vala-panel"
  depends=(
    "appmenu-glib-translator"
    'vala-panel' # AUR
  )

  install -dm755 "$pkgdir"/{usr/lib,usr/share}
  mv "$srcdir"/fakeinstall/usr/lib/vala-panel "$pkgdir"/usr/lib/
  mv "$srcdir"/fakeinstall/usr/share/vala-panel "$pkgdir"/usr/share/
}

_package_vala-panel-appmenu-xfce() {
  pkgdesc+=" for xfce4-panel"
  depends=(
    "appmenu-glib-translator"
    'xfce4-panel'
    'xfconf'
  )

  install -dm755 "$pkgdir"/{usr/lib,usr/share}
  mv "$srcdir"/fakeinstall/usr/lib/xfce4 "$pkgdir"/usr/lib/
  mv "$srcdir"/fakeinstall/usr/share/xfce4 "$pkgdir"/usr/share/
}

# subpackages
_opts=(
  --prefix=/usr
  --libdir=lib
  --libexecdir=lib
  -Dauto_features=disabled
)

pkgname=(
  "vala-panel-appmenu"
  "vala-panel-appmenu-locale"
)

if [[ "${_build_registrar::1}" == "t" ]]; then
  pkgname+=("vala-panel-appmenu-registrar")
  _depends_meta+=("vala-panel-appmenu-registrar")
fi

if [[ "${_build_translator::1}" == "t" ]]; then
  pkgname+=("appmenu-glib-translator")
  _depends_meta+=("appmenu-glib-translator")
fi

if [[ "${_build_mate::1}" == "t" ]]; then
  _opts+=(-Dmate=enabled)
  pkgname+=("vala-panel-appmenu-mate")
  depends+=('mate-panel')
  _depends_meta+=("vala-panel-appmenu-mate")
fi

if [[ "${_build_xfce::1}" == "t" ]]; then
  _opts+=(-Dxfce=enabled)
  pkgname+=("vala-panel-appmenu-xfce")
  depends+=('xfce4-panel' 'xfconf')
  _depends_meta+=("vala-panel-appmenu-xfce")
fi

if [[ "${_build_vala::1}" == "t" ]]; then
  _opts+=(-Dvalapanel=enabled)
  pkgname+=("vala-panel-appmenu-valapanel")
  depends+=("vala-panel")
  _depends_meta+=("vala-panel-appmenu-valapanel")
fi

if [[ "${_build_budgie::1}" == "t" ]]; then
  _opts+=(-Dbudgie=enabled)
  pkgname+=("vala-panel-appmenu-budgie")
  depends+=('budgie-desktop')
  _depends_meta+=("vala-panel-appmenu-budgie")
fi

_conflicts=(
  'appmenu-glib-translator-git'
  'vala-panel-git'
  'vala-panel-appmenu-budgie-git'
  'vala-panel-appmenu-common-git'
  'vala-panel-appmenu-jayatana-git'
  'vala-panel-appmenu-locale-git'
  'vala-panel-appmenu-mate-git'
  'vala-panel-appmenu-registrar-git'
  'vala-panel-appmenu-valapanel-git'
  'vala-panel-appmenu-xfce-git'
)

for _p in "${pkgname[@]}"; do
  eval "package_${_p}() {
    $(declare -f "_package_${_p}")
    _package_${_p}
    conflicts+=(${_conflicts[@]})

    chmod -R u+rwX,go+rX,go-w \"\$pkgdir\"
  }"
done
