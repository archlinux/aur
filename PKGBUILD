# Maintainer:

: ${_plugins:=addons:autoclose:automark:geanylua:git-changebar:lsp:overview:projectorganizer:spellcheck:treebrowser:webhelper}

_plugins_split=(${_plugins//:/ })

: ${_lua:=lua54}
: ${_libsoup_ver=3}

_pkgbase="geany-plugins-split"
pkgbase="$_pkgbase-git"
pkgver=2.1.0.r29.g0cfd614
pkgrel=1
pkgdesc="Plugins for Geany (split)"
url="https://github.com/geany/geany-plugins"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  'geany'
)
makedepends=(
  'git'
  'intltool'
  'python-docutils'
  'vte3'
)

_pkgsrc="geany-plugins"
source=(
  "$_pkgsrc"::"git+https://github.com/geany/geany-plugins.git"
  '0001-GeanyLua-PR1238-Multiple-Lua.patch'
  '0002-Project-Organizer-Find-in-Project-Files-fallback.patch'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -d "$_pkgsrc" -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  export CFLAGS+=' -w'
  export PYTHON=/usr/bin/python

  # map folder name to flag name
  local -A _flag_map=(
    ['git-changebar']='gitchangebar'
    ['utils']='utilslib'
  )

  cd "$_pkgsrc"
  autoreconf -fi

  local _opts=(
    --prefix=/usr
    --libexecdir=/usr/lib
    --disable-static
    --with-lua-pkg="$_lua"
    --disable-all-plugins
  )

  for _plugin in utils "${_plugins_split[@]}"; do
    local flag="${_flag_map["${_plugin}"]:-$_plugin}"
    _opts+=(--enable-"${flag}")
  done

  ./configure "${_opts[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make

  for _plugin in utils "${_plugins_split[@]}"; do
    # utils needed for some plugins
    if [[ ${_plugin} =~ (debugger|geanynumberedbookmarks|scope|treebrowser|workbench) ]]; then
      make -C utils DESTDIR="$srcdir/$_plugin" install
    fi

    make -C "$_plugin" DESTDIR="$srcdir/$_plugin" install

    # unwanted
    rm -rf "$srcdir/$_plugin/usr/share/doc"

    # remove utils
    if [ "$_plugin" != "utils" ]; then
      rm -rf "$srcdir/$_plugin/usr/lib"/libgeanypluginutils.so*
    fi
  done
}

_pkgtype="${pkgbase#$_pkgbase}"
pkgname=("geany-plugin-utilslib${_pkgtype:-}")

eval "package_geany-plugin-utilslib${_pkgtype:-}() {
  pkgdesc='Plugin for Geany - Utils Library'

  optdepends=('vte3')

  provides=(
    'geany-plugin-conflict'
    'geany-plugin-utilslib'
  )
  conflicts=(
    'geany-plugin-conflict'
    'geany-plugin-utilslib'
    'geany-plugins'
  )

  cp -r utils/* \"\$pkgdir/\"
}"

declare -A _seen
for _plugin in "${_plugins_split[@]}"; do
  pkgname+=("geany-plugin-${_plugin}${_pkgtype:-}")

  # clear from last loop
  _depends=()
  _makedeps=()
  _optdeps=()

  case "$_plugin" in
    debugger | geanynumberedbookmarks | scope | treebrowser)
      _depends=('geany-plugin-utilslib' 'vte3')
      ;;
    geanygendoc)
      _depends=('ctpl')
      _makedeps=("${_depends[@]}")
      ;;
    geanylua)
      _depends=("${_lua//lua54/lua}")
      _makedeps=("${_depends[@]}")
      ;;
    geanypg)
      _depends=('gpgme')
      _makedeps=("${_depends[@]}")
      ;;
    geniuspaste | updatechecker)
      _depends=("libsoup${_libsoup_ver:-}")
      _makedeps=("${_depends[@]}")
      ;;
    git-changebar)
      _depends=('libgit2')
      _makedeps=("${_depends[@]}")
      ;;
    markdown | webhelper)
      _depends=("webkit2gtk${_webkit2gtk_ver:-}")
      _makedeps=(
        "${_depends[@]}"
        'glib2-devel'
      )
      ;;
    pretty-printer)
      _depends+=('libxml2')
      _makedeps=("${_depends[@]}")
      ;;
    spellcheck)
      _depends=('enchant')
      _makedeps=("${_depends[@]}")
      _optdeps=('hunspell-dictionary')
      ;;
    workbench)
      _depends=('geany-plugin-utilslib' 'vte3')
      _makedeps=('libgit2')
      ;;
  esac

  for _dep in "${_makedeps[@]}"; do
    if [ -z "${_seen[$_dep]}" ]; then
      makedepends+=("$_dep")
      _seen[$_dep]=1
    fi
  done

  if [[ "$_plugin" == "geanylua" ]]; then
    _plugin_desc="Plugin for Geany - $_plugin ($_lua)"
  else
    _plugin_desc="Plugin for Geany - $_plugin"
  fi

  eval "package_geany-plugin-${_plugin}${_pkgtype:-}() {
    pkgdesc='$_plugin_desc'

    provides=('geany-plugin-${_plugin}')
    conflicts=('geany-plugin-${_plugin}')

    depends+=(
      ${_depends[*]}
      geany-plugin-conflict
    )

    $(if [ -n "${_optdeps[*]}" ]; then
    echo "optdepends=(${_optdeps[*]})"
  fi)

    cp -r $_plugin/* \"\$pkgdir/\"
  }"
done
