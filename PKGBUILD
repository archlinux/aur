# Maintainer: xiota / aur.chaotic.cx
# Contributor: JPratama7 <josepratama080@gmail.com>
# Contributor: Dominik Adrian Grzywak <starterx4 at gmail dot com>

## useful links:
# https://github.com/Alex313031/Thorium
# https://github.com/Alex313031/Thorium-SSE3

# options
if [ -n "$_srcinfo" ] || [ -n "$_pkgver" ] ; then
  : ${_autoupdate:=false}
else
  : ${_autoupdate:=true}
fi

# basic info
_pkgname="thorium-browser-sse3"
pkgname="$_pkgname-bin"
pkgver=120.0.6099.235
pkgrel=1
pkgdesc="Chromium fork focused on high performance and security"
url="https://github.com/Alex313031/Thorium"
license=('BSD')
arch=('x86_64')

# main package
_main_package() {
  _update_version

  depends=()
  makedepends=()
  optdepends=(
    'gnome-keyring: for storing passwords in GNOME keyring'
    'kdialog: for file dialogs in KDE'
    'kwallet5: for storing passwords in KWallet'
    'pipewire: WebRTC desktop sharing under Wayland'
  )

  options=('!emptydirs' '!strip')
  install="$_pkgname.install"

  _dl_url="$url/releases/download/M${_pkgver:?}"
  _dl_filename="${_pkgname%-sse3}_${_pkgver:?}_SSE3.deb"
  noextract+=("$_dl_filename")

  source=(
    "$_dl_url/$_dl_filename"
    "$_pkgname.sh"
  )
  sha256sums=(
    'SKIP'
    '7acd387f8b7d4dde66e4d3eb26f0f1161e02eab0f59b9922286ca3037ede2159'
  )

  pkgver() {
    printf '%s' "${_pkgver:?}"
  }
}

# common functions
package() {
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  depends+=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'libcups'
    'libnotify' # notify-send
    'libxcomposite'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'

    ## implicit
    #expat
    #glib2
    #libdrm
    #libx11
    #libxcb
    #libxdamage
    #libxext
    #libxfixes
  )

  echo "  -> Extracting the archive..."
  bsdtar -xf "$_dl_filename" data.tar.xz
  bsdtar -xf data.tar.xz -C "${pkgdir:?}/"
  rm data.tar.xz

  echo "  -> Moving files in place..."
  mv "${pkgdir:?}/opt/chromium.org/thorium" "${pkgdir:?}/opt/$_pkgname"
  unlink "${pkgdir:?}/usr/bin/thorium-browser"
  unlink "${pkgdir:?}/usr/bin/pak"

  # thorium-browser
  install -Dm755 "$_pkgname.sh" "${pkgdir:?}/usr/bin/$_pkgname"
  chmod 4755 "${pkgdir:?}/opt/$_pkgname/chrome-sandbox"

  # thorium-shell
  sed -E \
    -e "s@/opt/chromium.org/thorium/@/opt/$_pkgname/@" \
    -i "${pkgdir:?}/usr/bin/thorium-shell"

  mv "${pkgdir:?}/usr/bin/thorium-shell" "${pkgdir:?}/usr/bin/thorium-shell-${_pkgname: -4}"

  # thorium-browser.xml
  sed -E \
    -e "s@thorium-browser@$_pkgname@" \
    -e "s@/opt/chromium.org/thorium/@/opt/$_pkgname/@" \
    -i "${pkgdir:?}/usr/share/gnome-control-center/default-apps/thorium-browser.xml"

  mv "${pkgdir:?}/usr/share/gnome-control-center/default-apps/thorium-browser.xml" "${pkgdir:?}/usr/share/gnome-control-center/default-apps/$_pkgname.xml"

  # thorium-browser.appdata.xml
  sed -E \
    -e "s@thorium-browser@$_pkgname@" \
    -i "${pkgdir:?}/usr/share/appdata/thorium-browser.appdata.xml"

  mv "${pkgdir:?}/usr/share/appdata/thorium-browser.appdata.xml" "${pkgdir:?}/usr/share/appdata/$_pkgname.appdata.xml"

  # thorium-browser.desktop
  sed -E \
    -e "s@thorium-browser@$_pkgname@" \
    -e "s@thorium-shell@thorium-shell-${_pkgname: -4}@" \
    -e "s@^(Name\S*=.*)\$@\1 SSE3@" \
    -e "s@^(GenericName\S*=.*)\$@\1 SSE3@" \
    -i "${pkgdir:?}/usr/share/applications/thorium-browser.desktop"

  mv "${pkgdir:?}/usr/share/applications/thorium-browser.desktop" "${pkgdir:?}/usr/share/applications/$_pkgname.desktop"

  # thorium-shell.desktop
  sed -E \
    -e "s@^Icon=.*\$@Icon=thorium-shell-${_pkgname: -4}@" \
    -e "s@thorium-shell@thorium-shell-${_pkgname: -4}@" \
    -e "s@thorium_shell@thorium_shell_${_pkgname: -4}@" \
    -e "s@^(Name\S*=.*)\$@\1 SSE3@" \
    -e "s@^(GenericName\S*=.*)\$@\1 SSE3@" \
    -i "${pkgdir:?}/usr/share/applications/thorium-shell.desktop"

  mv "${pkgdir:?}/usr/share/applications/thorium-shell.desktop" "${pkgdir:?}/usr/share/applications/thorium-shell-${_pkgname: -4}.desktop"

  # man page
  mv "${pkgdir:?}/usr/share/man/man1/thorium-browser.1.gz" "${pkgdir:?}/usr/share/man/man1/$_pkgname.1.gz"

  # Icons
  for i in 16 24 32 48 64 128 256; do
    install -Dm644 "${pkgdir:?}/opt/$_pkgname/product_logo_${i}.png" \
      "${pkgdir:?}/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done

  install -Dm644 "${pkgdir:?}/opt/$_pkgname/thorium_shell.png" \
    "${pkgdir:?}/usr/share/icons/hicolor/256x256/apps/thorium-shell-${_pkgname: -4}.png"

  # clean-up
  echo "  -> Removing Debian Cron job, duplicate product logos and menu directory..."
  rm -r -- \
  "${pkgdir:?}/opt/chromium.org" \
    "${pkgdir:?}/etc/cron.daily/" \
    "${pkgdir:?}/usr/share/doc/" \
    "${pkgdir:?}/opt/$_pkgname/cron/" \
    "${pkgdir:?}/opt/$_pkgname"/product_logo_*.{png,xpm} \
    "${pkgdir:?}/usr/share/menu/"
}

# update version
_update_version() {
  : ${_pkgver:=${pkgver%%.r*}}

  if [[ "${_autoupdate::1}" != "t" ]] ; then
    return
  fi
  local _blacklist _response _tags _tag _pkgver_new

  _blacklist=(
  )
  _response=$(curl -Ssf "$url/releases.atom")
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
  _pkgver_new="${_tag#M}"

  # update _pkgver
  if [ "$_pkgver" != "${_pkgver_new:?}" ] ; then
    _pkgver="${_pkgver_new:?}"
  fi
}

# execute
_main_package
