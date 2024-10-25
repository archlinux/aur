# Maintainer: MoetaYuko <loli at yuko dot moe>

## options
if [ -z "$_srcinfo" ] && [ -z "$_pkgver" ]; then
  : ${_autoupdate:=true}
fi

# basic info
pkgbase="material-symbols-git"
pkgname=(
  ttf-material-icons-git
  ttf-material-symbols-variable-git
  woff2-material-symbols-variable-git
)
pkgver=4.0.0.r119.gc51274e9
pkgrel=1
pkgdesc="Material Design icons by Google"
url="https://github.com/google/material-design-icons"
license=('Apache-2.0')
arch=('any')

_source_main() {
  _dl_url="https://github.com/google/material-design-icons/raw/refs/heads/master"
  _dl_files=(
    "font/MaterialIcons-Regular.ttf"
    "font/MaterialIconsOutlined-Regular.otf"
    "font/MaterialIconsRound-Regular.otf"
    "font/MaterialIconsSharp-Regular.otf"
    "font/MaterialIconsTwoTone-Regular.otf"
    "variablefont/MaterialSymbolsOutlined[FILL,GRAD,opsz,wght].ttf"
    "variablefont/MaterialSymbolsOutlined[FILL,GRAD,opsz,wght].woff2"
    "variablefont/MaterialSymbolsRounded[FILL,GRAD,opsz,wght].ttf"
    "variablefont/MaterialSymbolsRounded[FILL,GRAD,opsz,wght].woff2"
    "variablefont/MaterialSymbolsSharp[FILL,GRAD,opsz,wght].ttf"
    "variablefont/MaterialSymbolsSharp[FILL,GRAD,opsz,wght].woff2"
  )
  for _src in ${_dl_files[@]}; do
    local _name="${_src#*/}"
    local _base="${_name%.*}"
    local _ext="${_name##*.}"

    _src="${_src//[/%5B}"
    _src="${_src//]/%5D}"

    source+=("$_base-$_pkgver.$_ext"::"$_dl_url/$_src")
    sha256sums+=('SKIP')
  done
}

pkgver() {
  echo "${_pkgver:?}"
}

package_ttf-material-symbols-variable-git() {
  pkgdesc+=" - variable fonts"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  for i in *wght*.ttf; do
    local _ext="${i##*.}"
    local _filename="${i%-$_pkgver.$_ext}"
    install -Dm644 "$i" "$pkgdir/usr/share/fonts/${pkgname%-git}/$_filename.$_ext"
  done
}

package_woff2-material-symbols-variable-git() {
  pkgdesc+=" - variable fonts"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  for i in *.woff2; do
    local _ext="${i##*.}"
    local _filename="${i%-$_pkgver.$_ext}"
    install -Dm644 "$i" "$pkgdir/usr/share/fonts/${pkgname%-git}/$_filename.$_ext"
  done
}

package_ttf-material-icons-git() {
  pkgdesc+=" - classic fonts"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  for i in MaterialIcons*.?tf; do
    local _ext="${i##*.}"
    install -Dm644 "$i" "$pkgdir/usr/share/fonts/$_pkgname/${i%-$pkgver.$_ext}.$_ext"
  done
}

_update_version() {
  if [ "${_autoupdate::1}" != "t" ]; then
    : ${_pkgver:=$pkgver}
    return
  fi

  _repo="${url#*//*/}"
  _path="variablefont"
  _response=$(curl -Ssf "https://api.github.com/repos/$_repo/commits?path=$_path")

  _hash=$(
    echo "$_response" \
      | grep -E '^\s*"sha": "' \
      | sed -E 's@^\s*"sha": "([a-f0-9]+)".*$@\1@' \
      | head -1
  )
  _date=$(
    echo "$commit_history" \
      | grep -E '^\s*"(committer|date)": "' \
      | sort -ur | head -1 \
      | sed -E 's@^.*"([0-9]{4})-([0-9]{2})-([0-9]{2})T.*$@\1.\2.\3@'
  )
  _tag=$(
    git ls-remote --tags "$url" \
      | sed -E 's@.*/v?@@' \
      | sort -V \
      | tail -1
  )
  _response_2=$(curl -Ssf "https://api.github.com/repos/$_repo/compare/$_hash...$_tag")

  _revision=$(
    echo "$_response_2" \
      | grep '"behind_by"' \
      | sed -E 's@^\s*"behind_by": ([0-9]+),$@\1@' \
      | head -1
  )

  _pkgver="${_tag}.r${_revision}.g${_hash::8}"
}

_update_version
_source_main
