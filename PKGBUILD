# Maintainer:

# options - defaults
if [ x"${_srcinfo::1}" == "xt" ] ; then
  : ${_autoupdate:=false}
elif [ -z "$_pkgver" ] ; then
  : ${_autoupdate:=true}
else
  : ${_autoupdate:=false}
fi

# basic info
_pkgname="mapton"
pkgname="$_pkgname-latest-bin"
pkgver=3.1.0
pkgrel=2
pkgdesc="Some kind of map application"
url="https://github.com/trixon/mapton"
arch=('x86_64')
license=('Apache')

# main package
_main_package() {
  _autoupdate

  if [ x"$_pkgname" != x"$pkgname" ] ; then
    provides+=("$_pkgname")
    conflicts+=("$_pkgname")
  fi

  options=(!strip !debug)

  _url="$url/releases/download/v$_pkgver"
  _filename="$_pkgname-$_pkgver-linux.zip"
  _sha256sum=$(
    curl "$_url/$_filename.sha256" -Ls \
      | sed -E 's@^([a-f0-9]+).*$@\1@'
  )

  source+=(
    "$url/releases/download/v$_pkgver/$_filename"
    'mapton.desktop'
    'mapton.png'
  )
  sha256sums+=(
    "$_sha256sum"
    '3cd90ba12fb57b35a577fec6509916bd8480911c46de591316158e78de828478'
    '5d29c2dd3d9d0aae01154de243f11c73cbb1a2d4793164ed9d41c9dda646eaa5'
  )
}

# common functions
pkgver() {
  printf '%s' \
    "$_pkgver"
}

prepare() {
  # exec script
  sed -Ei \
    -e 's@(\s+DEFAULT_USERDIR_ROOT)=\$\{HOME\}/\.\$\{APPNAME\}$@\1="${XDG_CONFIG_HOME:-$HOME/.config}/mapton"@' \
    -e 's@(\s+DEFAULT_CACHEDIR_ROOT)=\$\{HOME\}/\.cache/\$\{APPNAME\}$@\1="${XDG_CACHE_HOME:-$HOME/.cache}/mapton"@' \
    "$_pkgname/bin/$_pkgname"

  # icon
  rm "$_pkgname/$_pkgname.png"
}

package() {
  # opt
  install -d "$pkgdir/opt/$_pkgname"
  mv "$srcdir/$_pkgname"/* "$pkgdir/opt/$_pkgname/"

  # symlink
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # icons
  install -Dm644 "$srcdir/$_pkgname.png" \
    -t "$pkgdir/usr/share/pixmaps/"

  # .desktop
  install -Dm644 "$srcdir/$_pkgname.desktop" \
    -t "$pkgdir/usr/share/applications/"
}

# update version
_autoupdate() {
  : ${_pkgver:=${pkgver%%.r*}}

  if [[ x"${_autoupdate::1}" != "xt" ]] ; then
    return
  fi

  _repo="${url#*//*/}"
  _response=$(curl -Ssf "https://api.github.com/repos/${_repo:?}/releases")

  _get() {
    printf '%s' "$_response" \
      | awk -F '"' '/"'"$1"'":/{print $4}' \
      | head -1 | sed 's/^v//'
  }
  _pkgver_new=$(_get tag_name)

  # update pkgver
  if [ x"$_pkgver" != x"${_pkgver_new:?}" ] ; then
    _pkgver="${_pkgver_new:?}"
  fi
}

# execute
_main_package
