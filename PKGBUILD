# Maintainer: MoetaYuko <loli at yuko dot moe>

# options
if [ x"$_srcinfo" == "xt" ] ; then
  : ${_autoupdate:=false}
elif [ -z "$_pkgver" ] ; then
  : ${_autoupdate:=true}
else
  : ${_autoupdate:=false}
fi

# basic info
pkgbase=material-symbols-git
pkgname=(
  ttf-material-symbols-git
  woff2-material-symbols-git
)
pkgver=4.0.0.r91.ga90037f8
pkgrel=1
pkgdesc="Material Design icons by Google"
url="https://github.com/google/material-design-icons"
license=('Apache')
arch=(any)

# autoupdate
if [[ x"$_autoupdate::1" == "xt" ]] ; then
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
else
  : ${_pkgver:=$pkgver}
fi

# sources
_dl_url="https://raw.githubusercontent.com/google/material-design-icons/master"
_dl_files=(
  "variablefont/MaterialSymbolsOutlined[FILL,GRAD,opsz,wght].ttf"
  "variablefont/MaterialSymbolsRounded[FILL,GRAD,opsz,wght].ttf"
  "variablefont/MaterialSymbolsSharp[FILL,GRAD,opsz,wght].ttf"
  "variablefont/MaterialSymbolsOutlined[FILL,GRAD,opsz,wght].woff2"
  "variablefont/MaterialSymbolsRounded[FILL,GRAD,opsz,wght].woff2"
  "variablefont/MaterialSymbolsSharp[FILL,GRAD,opsz,wght].woff2"
)
for _src in ${_dl_files[@]} ; do
  local _name="${_src#*/}"
  local _base="${_name%.*}"
  local _ext="${_name##*.}"
  source+=("$_base-$_pkgver.$_ext"::"$_dl_url/$_src")
  sha256sums+=('SKIP')
done

# common functions
pkgver() {
  echo "${_pkgver:?}"
}

package_ttf-material-symbols-git() {
  pkgdesc+=" - variable fonts"
  for i in *wght*.ttf ; do
    local _ext="${i##*.}"
    install -Dm644 "$i" "$pkgdir/usr/share/fonts/${pkgname%-git}/${i%-$_pkgver.$_ext}.$_ext"
  done
}

package_woff2-material-symbols-git() {
  pkgdesc+=" - variable fonts"
  for i in *.woff2 ; do
    local _ext="${i##*.}"
    install -Dm644 "$i" "$pkgdir/usr/share/fonts/${pkgname%-git}/${i%-$_pkgver.$_ext}.$_ext"
  done
}
