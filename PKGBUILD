# Maintainer:
# Contributer: Yamada Hayao <hayao@fascode.net>
# Contributer: rilian-la-te <ria.freelander@gmail.com>

## options
: ${_autoupdate:=false}

: ${_build_mate:=true}
: ${_build_xfce:=true}
: ${_build_vala:=true}
: ${_build_budgie:=true}

: ${_build_registrar:=true}
: ${_build_translator:=true}

: ${_build_git:=false}

unset _pkgtype
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname="vala-panel-appmenu"
pkgbase="$_pkgname${_pkgtype:-}"
pkgver=24.05
pkgrel=3
pkgdesc="Global Menu plugin"
url="https://gitlab.com/vala-panel-project/vala-panel-appmenu"
license=('LGPL-3.0-or-later')
arch=('i686' 'x86_64')

_main_package() {
  makedepends+=(
    'git'
    'meson'
    'vala'
    'gobject-introspection'
  )

  if [ "${_build_git::1}" != "t" ]; then
    _update_version
    _main_stable
  else
    _main_git
  fi
}

# stable package
_main_stable() {
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=$_pkgver")
  sha256sums+=('SKIP')

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"

    git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
  }
}

# common functions
prepare() {
  sed -e 's&^.*if mate_found or vala_panel_found or budgie_found.*$&if true&' \
    -i "$_pkgsrc/data/meson.build"

  sed -E -e "s&(importer_dep = dependency)\('appmenu-glib-translator'&\1('_appmenu_glib_translator_'&" \
    -i "$_pkgsrc/lib/meson.build"
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
    "vala-panel-appmenu-locale${_pkgtype:-}"
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
    "appmenu-glib-translator${_pkgtype:-}"
    'budgie-desktop'
  )

  install -dm755 "$pkgdir"/usr/lib
  mv "$srcdir"/fakeinstall/usr/lib/budgie-desktop "$pkgdir"/usr/lib/
}

_package_vala-panel-appmenu-mate() {
  pkgdesc+=" for mate-panel"
  depends=(
    "appmenu-glib-translator${_pkgtype:-}"
    'mate-panel'
  )

  install -dm755 "$pkgdir"/{usr/lib,usr/share}
  mv "$srcdir"/fakeinstall/usr/lib/mate-panel "$pkgdir"/usr/lib/
  mv "$srcdir"/fakeinstall/usr/share/mate-panel "$pkgdir"/usr/share/
}

_package_vala-panel-appmenu-valapanel() {
  pkgdesc+=" for vala-panel"
  depends=(
    "appmenu-glib-translator${_pkgtype:-}"
    'vala-panel'
  )

  install -dm755 "$pkgdir"/{usr/lib,usr/share}
  mv "$srcdir"/fakeinstall/usr/lib/vala-panel "$pkgdir"/usr/lib/
  mv "$srcdir"/fakeinstall/usr/share/vala-panel "$pkgdir"/usr/share/
}

_package_vala-panel-appmenu-xfce() {
  pkgdesc+=" for xfce4-panel"
  depends=(
    "appmenu-glib-translator${_pkgtype:-}"
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
  "vala-panel-appmenu${_pkgtype:-}"
  "vala-panel-appmenu-locale${_pkgtype:-}"
)

if [[ "${_build_registrar::1}" == "t" ]]; then
  pkgname+=("vala-panel-appmenu-registrar${_pkgtype:-}")
  _depends_meta+=("vala-panel-appmenu-registrar${_pkgtype:-}")
fi

if [[ "${_build_translator::1}" == "t" ]]; then
  pkgname+=("appmenu-glib-translator${_pkgtype:-}")
  _depends_meta+=("appmenu-glib-translator${_pkgtype:-}")
fi

if [[ "${_build_mate::1}" == "t" ]]; then
  _opts+=(-Dmate=enabled)
  pkgname+=("vala-panel-appmenu-mate${_pkgtype:-}")
  depends+=('mate-panel')
  _depends_meta+=("vala-panel-appmenu-mate${_pkgtype:-}")
fi

if [[ "${_build_xfce::1}" == "t" ]]; then
  _opts+=(-Dxfce=enabled)
  pkgname+=("vala-panel-appmenu-xfce${_pkgtype:-}")
  depends+=('xfce4-panel' 'xfconf')
  _depends_meta+=("vala-panel-appmenu-xfce${_pkgtype:-}")
fi

if [[ "${_build_vala::1}" == "t" ]]; then
  _opts+=(-Dvalapanel=enabled)
  pkgname+=("vala-panel-appmenu-valapanel${_pkgtype:-}")
  depends+=("vala-panel${_pkgtype:-}")
  _depends_meta+=("vala-panel-appmenu-valapanel${_pkgtype:-}")
fi

if [[ "${_build_budgie::1}" == "t" ]]; then
  _opts+=(-Dbudgie=enabled)
  pkgname+=("vala-panel-appmenu-budgie${_pkgtype:-}")
  depends+=('budgie-desktop')
  _depends_meta+=("vala-panel-appmenu-budgie${_pkgtype:-}")
fi

for _p in "${pkgname[@]}"; do
  if [ -z "${_pkgtype:-}" ]; then
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
  else
    _conflicts=(
      'appmenu-glib-translator'
      'vala-panel'
      'vala-panel-appmenu-budgie'
      'vala-panel-appmenu-common'
      'vala-panel-appmenu-jayatana'
      'vala-panel-appmenu-locale'
      'vala-panel-appmenu-mate'
      'vala-panel-appmenu-registrar'
      'vala-panel-appmenu-valapanel'
      'vala-panel-appmenu-xfce'
    )
  fi

  eval "package_$_p() {
    $(declare -f "_package_${_p#${_pkgtype:-}}")
    _package_${_p#${_pkgtype:-}}
    conflicts+=(${_conflicts[@]})

    chmod -R u+rwX,go+rX,go-w \"\$pkgdir\"
  }"
done

# update version
_update_version() {
  : ${_pkgver:=${pkgver%%.r*}}

  if [[ "${_autoupdate::1}" != "t" ]]; then
    return
  fi

  local _response=$(curl -Ssf "$url/-/tags?format=atom")
  local _tag=$(
    printf '%s' "$_response" \
      | grep '"https://.*/tags/.*"' \
      | sed -E 's@^.*/tags/(.*)".*$@\1@' \
      | grep -Ev '[a-z]{2}' | sort -rV | head -1
  )
  local _pkgver_new="${_tag#v}"

  # update _pkgver
  if [ "$_pkgver" != "${_pkgver_new:?}" ]; then
    _pkgver="${_pkgver_new:?}"
  fi
}

# execute
_main_package
