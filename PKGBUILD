# Maintainer: xiota / aur.chaotic.cx
# Contributor: JPratama7 <josepratama080@gmail.com>
# Contributor: Dominik Adrian Grzywak <starterx4 at gmail dot com>

# options
if [ -n "$_srcinfo" ] || [ -n "$_pkgver" ] ; then
  : ${_autoupdate:=false}
else
  : ${_autoupdate:=true}
fi

# basic info
_pkgname="thorium-browser"
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

  _dl_url="https://github.com/Alex313031/Thorium/releases/download/M${_pkgver:?}"
  _dl_filename="${_pkgname}_${_pkgver:?}_amd64.deb"
  noextract+=("$_dl_filename")

  source=(
    "$_dl_url/$_dl_filename"
    "$_pkgname.sh"
  )
  sha256sums=(
    'SKIP'
    '8c6cd4c85389d9642afce9549c750d7b27ab9e2f4032a05fa03d02799cd8ac9b'
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

  # thorium-browser.xml
  sed -E \
    -e "s@/opt/chromium.org/thorium/@/opt/$_pkgname/@" \
    -i "${pkgdir:?}/usr/share/gnome-control-center/default-apps/thorium-browser.xml"

  # Icons
  for i in 16 24 32 48 64 128 256; do
    install -Dm644 "${pkgdir:?}/opt/$_pkgname/product_logo_${i}.png" \
      "${pkgdir:?}/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done

  install -Dm644 "${pkgdir:?}/opt/$_pkgname/thorium_shell.png" \
    "${pkgdir:?}/usr/share/icons/hicolor/256x256/apps/thorium-shell.png"

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

  local _response=$(curl -Ssf "$url/releases.atom")
  local _tag=$(
    printf '%s' "$_response" \
      | grep -E '"https://.*/releases/tag/.*"' \
      | sed -E 's@^.*/releases/tag/(.*)".*$@\1@' \
      | grep -Ev '[a-z]{2}' | sort -rV | head -1
  )
  local _pkgver_new="${_tag#M}"

  # update _pkgver
  if [ "$_pkgver" != "${_pkgver_new:?}" ] ; then
    _pkgver="${_pkgver_new:?}"
  fi
}

# execute
_main_package
