# Maintainer: saxophone <me@saxophone.is-a.dev>

# options
if [ -n "$_srcinfo" ] || [ -n "$_pkgver" ] ; then
  : ${_autoupdate:=false}
else
  : ${_autoupdate:=true}
fi

: ${_pkgtype:=-bin}

# basic info
_pkgname="mercury-browser-avx2"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=129.0.2
pkgrel=1
pkgdesc="Compiler optimized, private Firefox fork - WARNING: Unmaintained and vulnerable to CVE-2024-9680. Use at your own risk!"
url="https://github.com/Alex313031/Mercury"
license=('MPL-2.0')
arch=('x86_64')

# Add reference to the .install file
install="${_pkgname}.install"

# main package
_main_package() {
  _update_version

  depends=(
    'gtk3'          # GTK toolkit for rendering the interface
    'libx11'        # X11 support
    'libxt'         # X Toolkit Intrinsics library
    'dbus-glib'     # D-Bus support
    'glib2'         # Core library for GNOME
    'nss'           # Network Security Services for SSL/TLS
    'sqlite'        # For storing data like cookies and history
    'libvpx'        # VP8/VP9 video codec
    'icu'           # Unicode support
    'libevent'      # Asynchronous event notification
    'startup-notification' # Notification support for startup events
    'ffmpeg'        # Multimedia support
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

  _dl_filename="${_pkgname%-avx2}_${_pkgver:?}_AVX2.deb"
  _dl_url="$url/releases/download/v.$_pkgver/$_dl_filename"

  noextract+=("$_dl_filename")
  source=("$_dl_filename"::"${_dl_url}")

  sha256sums=('5be9cadb44466b6b63b73393443af064b5a0340a8f1bef88420f3c053582ac2d')
}

pkgver() {
  echo "${_pkgver:?}"
}

prepare() {
  # No need to copy files - they're already in the right place
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
    'libnotify' # notify-send
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

  # script
  rm -rf "$pkgdir/usr/bin/mercury-browser"
  install -Dm755 "${srcdir}/../mercury-browser-avx2.sh" "$pkgdir/usr/bin/$_pkgname"

  # icon
  install -Dm644 "$pkgdir/opt/$_pkgname/browser/chrome/icons/default/default128.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"  

  # .desktop
  rm -rf "$pkgdir/usr/share/applications/mercury-browser.desktop"
  install -Dm644 "${srcdir}/../mercury-browser-avx2.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # symlink duplicate file
  ln -sf "/usr/bin/$_pkgname" "$pkgdir/opt/$_pkgname/mercury-bin"

  # remove unnecessary folders
  rm -rf "$pkgdir/usr/lib/"
  rm -rf "$pkgdir/usr/share/doc/"
  rm -rf "$pkgdir/usr/share/icons"
  rm -rf "$pkgdir/usr/share/lintian/"
  rm -rf "$pkgdir/usr/share/man/"

  # fix permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

_package_deb() {
  # extract archive
  bsdtar -xf "$_dl_filename" data.tar.*
  bsdtar -xf data.tar.gz -C "$pkgdir/"
  rm data.tar.gz

  # move files from /lib to /opt
  install -dm755 "$pkgdir/opt/$_pkgname"
  mv "$pkgdir/usr/lib/mercury"/* "$pkgdir/opt/$_pkgname/"
}

_package_zip() {
  local _depth=$(
    bsdtar -tf "$_dl_filename" -- */mercury/mercury$ \
      | tr -cd '/' | wc -c
  )

  # extract archive
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
    "v.121.0.2" # windows only
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

  # update _pkgver
  if [ "$_pkgver" != "${_pkgver_new:?}" ] ; then
    _pkgver="${_pkgver_new:?}"
  fi
}

# execute
_main_package
