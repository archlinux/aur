# Maintainer: xiota / aur.chaotic.cx
# Contributor: Alexey Peschany <archlinux at sandboiii dot xyz>

# options
if [ -z "$_pkgver" ] ; then
  : ${_autoupdate:=true}
else
  : ${_autoupdate:=false}
fi

: ${_pkgver:=115.4.0}

: ${_pkgtype:=bin}

# basic info
_pkgname="mercury-browser"
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=115.4.0
pkgrel=4
pkgdesc="Compiler optimized, private Firefox fork"
url="https://github.com/Alex313031/Mercury"
license=('MPL' 'GPL' 'LGPL')
arch=('x86_64')

# main package
_main_package() {
  _update_version

  optdepends=(
    'ffmpeg: H264/AAC/MP3 decoding'
    'hunspell: Spell checking'
    'hyphen: Hyphenation'
    'networkmanager: Location detection via available WiFi networks'
    'pulseaudio: Sound'
    'upower: Battery API'
  )

  options=('!emptydirs' '!strip')
  install="$_pkgname.install"

  _dl_filename="${_pkgname}_${_pkgver:?}_amd64.deb"
  noextract+=("$_dl_filename")
  source=(
    "$_dl_filename"::"$_dl_url"
    "$_pkgname.sh"
  )
  sha256sums=(
    'SKIP'
    'f76a772f2c377c319c4e8bd737d219891b0c439bd8e07efd96584021c2e74bbb'
  )
}

# common functions
pkgver() {
  printf '%s' \
    "${_pkgver:?}"
}

package() {
  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  depends+=(
    'dbus-glib'
    'gtk3'
    'libnotify' # notify-send
    'libxt'
    'nss'
  )

  # extract archive
  bsdtar -xf "$_dl_filename" data.tar.gz
  bsdtar -xf data.tar.gz -C "${pkgdir:?}/"
  rm data.tar.gz

  # move and copy files into position
  install -Dm755 "$_pkgname.sh" "${pkgdir:?}/usr/bin/$_pkgname"

  install -dm755 "${pkgdir:?}/opt/$_pkgname"
  mv "${pkgdir:?}/usr/lib/mercury"/* "${pkgdir:?}/opt/$_pkgname/"

  install -Dm644 "${pkgdir:?}/usr/share/doc/mercury-browser/copyright" "${pkgdir:?}/usr/share/licenses/$pkgname/LICENSE"

  # fix permissions
  chmod -R u+rwX,go+rX,go-w "${pkgdir:?}/"

  # remove unnecessary folders
  \rm -rf "${pkgdir:?}/usr/lib/"
  \rm -rf "${pkgdir:?}/usr/share/doc/"
  \rm -rf "${pkgdir:?}/usr/share/lintian/"
}

# update version
_update_version() {
  if [ x"${_autoupdate::1}" != "xt" ] ; then
    return
  fi

  _response=$(curl "https://api.github.com/repos/${url#*.com/}/releases" -s)

  _get() {
    printf '%s' "$_response" \
      | awk -F '"' '/"'"$1"'":/{print $4}' \
      | grep -E '_amd64\.deb' \
      | head -1 | sed 's/^v//'
  }

  _dl_url=$(_get browser_download_url)

  _regex='^.*mercury-browser_([0-9\.]+)_.*\.deb.*$'
  _pkgver_new=$(
    printf '%s' "$_dl_url" \
      | grep -E "$_regex" | head -1 | sed -E "s@$_regex@\1@"
  )

  # update _pkgver
  if [ x"$_pkgver" != x"${_pkgver_new:?}" ] ; then
    _pkgver="$_pkgver_new"
    sed -Ei "s@^(\s*: \\\$\{_pkgver):=.*\}\$@\1:=${_pkgver:?}}@" "$startdir/PKGBUILD"
  fi
}

# execute
_main_package
