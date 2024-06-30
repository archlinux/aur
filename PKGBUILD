# Maintainer:
# Contributor: Oleg Shparber <trollixx+aur@gmail.com>

# options
if [ -n "$_srcinfo" ] || [ -n "$_pkgver" ]; then
  : ${_autoupdate:=false}
else
  : ${_autoupdate:=true}
fi

: ${_pkgtype=-git}

# basic info
_pkgname="material-icons"
pkgbase="$_pkgname${_pkgtype:-}"
pkgver=4.0.0.r94.gf2c8df1
pkgrel=1
pkgdesc="Material Design icons by Google"
url="https://github.com/google/material-design-icons"
license=('Apache-2.0')
arch=('any')

_main_package() {
  options=('!debug')

  _dl_url="https://github.com/google/material-design-icons/raw/${pkgver#*.g}"
  _dl_files=(
    "font/MaterialIcons-Regular.ttf"
    "font/MaterialIconsOutlined-Regular.otf"
    "font/MaterialIconsRound-Regular.otf"
    "font/MaterialIconsSharp-Regular.otf"
    "font/MaterialIconsTwoTone-Regular.otf"
  )
  for _src in ${_dl_files[@]}; do
    local _name="${_src#*/}"
    local _base="${_name%.*}"
    local _ext="${_name##*.}"
    source+=("$_base-$_pkgver.$_ext"::"$_dl_url/$_src")
    sha256sums+=('SKIP')
  done
}

# common functions
_package_otf-material-icons() {
  pkgdesc="metapackage - switch to ttf-material-icons-git"
  depends=('ttf-material-icons-git')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")
}

_package_ttf-material-icons() {
  pkgdesc+=" - classic fonts"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  for i in MaterialIcons*.?tf; do
    local _ext="${i##*.}"
    install -Dm644 "$i" "$pkgdir/usr/share/fonts/$_pkgname/${i%-$pkgver.$_ext}.$_ext"
  done
}

# update version
_update_version() {
  : ${_pkgver:=$pkgver}

  if [[ "${_autoupdate::1}" != "t" ]]; then
    return
  fi

  local _repo _path _response _hash _date _tag _revision

  _repo="${url#*//*/}"
  _path="font"
  _response=$(curl -Ssf "https://github.com/$_repo/commits/master/$_path")
  _hash=$(
    echo "$_response" \
      | grep -Eo '"\S+/commit/\S+"' \
      | head -1 \
      | sed -E 's@"\S+commit/@@;s@\\"@@'
  )
  _tag=$(
    curl -Ssf "https://github.com/$_repo/tags" \
      | grep -Eo '"\S+/tag/\S+"' \
      | sed -E 's@.*/v?@@;s@"@@g' \
      | sort -ruV \
      | head -1
  )
  _revision=$(
    curl -Ssf "https://api.github.com/repos/$_repo/compare/${_hash}...${_tag}" \
      | grep '"behind_by"' \
      | sed -E 's@^\s*"behind_by": ([0-9]+),$@\1@' \
      | head -1
  )

  _pkgver="${_tag:?}.r${_revision:?}.g${_hash::7}"

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# execute
_update_version
_main_package

pkgname=(
  otf-material-icons-git
  ttf-material-icons-git
)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package_${_p%$_pkgtype}")
    _package_${_p%$_pkgtype}
  }"
done
