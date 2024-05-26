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

: ${_build_git:=false}

unset _pkgtype
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname="vala-panel-appmenu"
pkgbase="$_pkgname${_pkgtype:-}"
pkgver=24.02
pkgrel=2
pkgdesc="Global Menu (AppMenu) plugin"
url="https://gitlab.com/vala-panel-project/vala-panel-appmenu"
license=('LGPL-3.0-or-later')
arch=('i686' 'x86_64')

_main_package() {
  depends+=(
    'glib2'
  )
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
  _commit=0c914bb8

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#commit=$_commit")
  sha256sums+=('SKIP')

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  _pkgsrc="$_pkgname"
  _reg_path="subprojects/registrar"
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
  sed -e 's&^.*if mate_found or vala_panel_found or budgie_found.*$&if true&' -i vala-panel-appmenu/data/meson.build
}

_build_registrar() {
  [ "${_build_registrar::1}" != "t" ] && return
  local _reg_path="subprojects/registrar"
  arch-meson "$_pkgsrc/$_reg_path" build_registrar
  meson compile -C build_registrar
}

build() {
  sed -i 's/nb //' "${srcdir}/vala-panel-appmenu/po/LINGUAS"

  meson "${_opts[@]}" build "$_pkgsrc"
  meson compile -C build

  _build_registrar

  DESTDIR="$srcdir/fakeinstall" meson install -C build
}

_package_vala-panel-appmenu() {
  pkgdesc="metapackage - vala panel appmenu collection"

  depends=("${_depends_meta[@]}")
}

_package_vala-panel-appmenu-registrar() {
  pkgdesc="Small utility to hold DBusMenu menus"
  meson install -C build_registrar --destdir "$pkgdir"
}

_package_vala-panel-appmenu-common() {
  pkgdesc="Translations and common files"
  depends=('gdk-pixbuf2' 'dconf')

  conflicts=('appmenu-glib-translator-git')

  install -dm755 "$pkgdir"/{usr/lib,usr/share}
  mv "$srcdir"/fakeinstall/usr/include "$pkgdir"/usr/
  mv "$srcdir"/fakeinstall/usr/lib/pkgconfig "$pkgdir"/usr/lib/
  mv "$srcdir"/fakeinstall/usr/lib/libappmenu-glib-translator* "$pkgdir"/usr/lib/
  mv "$srcdir"/fakeinstall/usr/share/{gir-1.0,glib-2.0,locale,vala} "$pkgdir"/usr/share/

  # unneeded: usr/share/doc, usr/share/licenses
}

_package_vala-panel-appmenu-xfce() {
  pkgdesc+=" for xfce4-panel"
  depends=('xfce4-panel' 'xfconf' 'vala-panel-appmenu-common')

  install -dm755 "$pkgdir"/{usr/lib,usr/share}
  mv "$srcdir"/fakeinstall/usr/lib/xfce4 "$pkgdir"/usr/lib/
  mv "$srcdir"/fakeinstall/usr/share/xfce4 "$pkgdir"/usr/share/
}

_package_vala-panel-appmenu-valapanel() {
  pkgdesc+=" for vala-panel"
  depends=('vala-panel' 'vala-panel-appmenu-common')

  install -dm755 "$pkgdir"/{usr/lib,usr/share}
  mv "$srcdir"/fakeinstall/usr/lib/vala-panel "$pkgdir"/usr/lib/
  mv "$srcdir"/fakeinstall/usr/share/vala-panel "$pkgdir"/usr/share/
}

_package_vala-panel-appmenu-mate() {
  pkgdesc+=" for mate-panel"
  depends=('mate-panel' 'vala-panel-appmenu-common')

  install -dm755 "$pkgdir"/{usr/lib,usr/share}
  mv "$srcdir"/fakeinstall/usr/lib/mate-panel "$pkgdir"/usr/lib/
  mv "$srcdir"/fakeinstall/usr/share/mate-panel "$pkgdir"/usr/share/
}

_package_vala-panel-appmenu-budgie() {
  pkgdesc+=" for budgie-panel"
  depends=('budgie-desktop' 'vala-panel-appmenu-common')

  install -dm755 "$pkgdir"/usr/lib
  mv "$srcdir"/fakeinstall/usr/lib/budgie-desktop "$pkgdir"/usr/lib/
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
  "vala-panel-appmenu-common${_pkgtype:-}"
)

if [[ "${_build_registrar::1}" == "t" ]]; then
  pkgname+=("vala-panel-appmenu-registrar${_pkgtype:-}")
  _depends_meta+=("vala-panel-appmenu-registrar${_pkgtype:-}")
fi

if [[ "${_build_mate::1}" == "t" ]]; then
  _opts+=(-Dmate=enabled)
  pkgname+=("vala-panel-appmenu-mate${_pkgtype:-}")
  makedepends+=('mate-panel')
  _depends_meta+=("vala-panel-appmenu-mate${_pkgtype:-}")
fi

if [[ "${_build_xfce::1}" == "t" ]]; then
  _opts+=(-Dxfce=enabled)
  pkgname+=("vala-panel-appmenu-xfce${_pkgtype:-}")
  makedepends+=('xfce4-panel' 'xfconf')
  _depends_meta+=("vala-panel-appmenu-xfce${_pkgtype:-}")
fi

if [[ "${_build_vala::1}" == "t" ]]; then
  _opts+=(-Dvalapanel=enabled)
  pkgname+=("vala-panel-appmenu-valapanel${_pkgtype:-}")
  makedepends+=("vala-panel${_pkgtype:-}")
  _depends_meta+=("vala-panel-appmenu-valapanel${_pkgtype:-}")
fi

if [[ "${_build_budgie::1}" == "t" ]]; then
  _opts+=(-Dbudgie=enabled)
  pkgname+=("vala-panel-appmenu-budgie${_pkgtype:-}")
  makedepends+=('budgie-desktop')
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
