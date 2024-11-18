# Maintainer: saxophonedev <me@saxophone.is-a.dev>

# options
if [ -n "$_srcinfo" ] || [ -n "$_pkgver" ] ; then
  : ${_autoupdate:=false}
else
  : ${_autoupdate:=true}
fi

: ${_pkgtype:=-bin}

# basic info
_pkgname="mercury-browser-sse4"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=129.0.2
pkgrel=1
pkgdesc="Compiler optimized, private Firefox fork"
url="https://github.com/Alex313031/Mercury"
license=('MPL-2.0')
arch=('x86_64')

# main package
_main_package() {
  _update_version

  depends=(
    'gtk3'
    'libx11'
    'libxt'
    'dbus-glib'
    'glib2'
    'nss'
    'sqlite'
    'libvpx'
    'icu'
    'libevent'
    'startup-notification'
    'ffmpeg'
  )

  optdepends=(
    'networkmanager: For network connectivity detection'
    'pulseaudio: For sound support'
    'pipewire: Alternative sound support'
    'libnotify: For desktop notifications'
    'gst-plugins-good: For media decoding'
    'gst-libav: For additional media formats'
    'hunspell: For spell checking'
    'xdg-desktop-portal: For desktop integration'
  )

  options=('!emptydirs' '!strip')

  _dl_filename="${_pkgname%-sse4}_${_pkgver:?}_SSE4.deb"
  _dl_url="$url/releases/download/v.$_pkgver/$_dl_filename"

  noextract+=("$_dl_filename")
  source=("$_dl_filename"::"${_dl_url}")

  sha256sums=('489d6601bdfd1da4a4de90aff33d63046add2024bbe505529b106eb7cf10b855')
}

pkgver() {
  echo "${_pkgver:?}"
}

prepare() {
  true
}

package() {
  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  depends+=(
    'ffmpeg'
    'alsa-lib'
    'dbus-glib'
    'gtk3'
    'libnotify'
  )

  local _filetype="zip"
  if bsdtar -xf "$_dl_filename" -- data.tar.* &> /dev/null ; then
    _filetype="deb"
  fi

  if [[ "${_filetype::1}" == 'z' ]] ; then
    _package_zip
  else
    _package_deb
  fi

  rm -rf "$pkgdir/usr/bin/mercury-browser"
  install -Dm755 "${srcdir}/../mercury-browser-sse4.sh" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$pkgdir/opt/$_pkgname/browser/chrome/icons/default/default128.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"  

  rm -rf "$pkgdir/usr/share/applications/mercury-browser.desktop"
  install -Dm644 "${srcdir}/../mercury-browser-sse4.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  ln -sf "/usr/bin/$_pkgname" "$pkgdir/opt/$_pkgname/mercury-bin"

  rm -rf "$pkgdir/usr/lib/"
  rm -rf "$pkgdir/usr/share/doc/"
  rm -rf "$pkgdir/usr/share/icons"
  rm -rf "$pkgdir/usr/share/lintian/"
  rm -rf "$pkgdir/usr/share/man/"

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

_package_deb() {
  bsdtar -xf "$_dl_filename" data.tar.*
  bsdtar -xf data.tar.gz -C "$pkgdir/"
  rm data.tar.gz

  install -dm755 "$pkgdir/opt/$_pkgname"
  mv "$pkgdir/usr/lib/mercury"/* "$pkgdir/opt/$_pkgname/"
}

_package_zip() {
  local _depth=$(
    bsdtar -tf "$_dl_filename" -- */mercury/mercury$ \
      | tr -cd '/' | wc -c
  )

  install -dm755 "$pkgdir/opt/$_pkgname"
  bsdtar --strip-components="$_depth" -C "$pkgdir/opt/$_pkgname/" -xf "$_dl_filename" '*/mercury/*'
}

_update_version() {
  : ${_pkgver:=${pkgver%%.r*}}

  if [[ "${_autoupdate::1}" != "t" ]] ; then
    return
  fi

  local _blacklist _response _tags _tag _pkgver_new

  _blacklist=(
    "v.121.0.2"
  )
  _response=$(curl -Ssf "$url/releases.atom" --tlsv1.3)
  _tags=$(
    printf '%s' "$_response" \
      | grep '/releases/tag/' \
      | sed -E 's@^.*/releases/tag/(.*)".*$@\1@' \
      | grep -Ev '[a-z]{2}'
  )
  for i in "${_blacklist[@]}" ; do
    _tags=${_tags/$i}
  done
  _tag=$(printf '%s' "$_tags" | sort -rV | head -1)
  _pkgver_new="${_tag#v.}"

  if [ "$_pkgver" != "${_pkgver_new:?}" ] ; then
    _pkgver="${_pkgver_new:?}"
  fi
}

# execute
_main_package

