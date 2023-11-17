# Maintainer: xiota / aur.chaotic.cx
# Contributor: JPratama7 <josepratama080@gmail.com>
# Contributor: Dominik Adrian Grzywak <starterx4 at gmail dot com>

# options
if [ ! -z "$_srcinfo" ] ; then
  _autoupdate=false
elif [ -z "$_pkgver" ] ; then
  : ${_autoupdate:=true}
else
  : ${_autoupdate:=false}
fi

: ${_pkgver:=117.0.5938.157}

# basic info
_pkgname="thorium-browser"
pkgname="$_pkgname-bin"
pkgver=117.0.5938.157
pkgrel=4
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
    '76dc15b6001053edc422dbed7041273a21315b5f59225f62f8b21b6385f6f9ba'
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
    'gtk3'
    'libcups'
    'libnotify' # notify-send
    'libxss'
    'libxtst'
    'nss'
    'ttf-liberation'
    'xdg-utils'
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
  case "${_autoupdate::1}" in
    't'|'y'|'1')
      _repo="${url#*//*/}"
      _response=$(curl "https://api.github.com/repos/${_repo:?}/releases" -s)

      _regex='^.*thorium-browser_([0-9\.]+)_.*\.deb.*$'
      _pkgver_new=$(
        printf '%s' "$_response" \
          | grep -E "$_regex" | head -1 | sed -E "s@$_regex@\1@"
      )

      # update _pkgver
      if [ x"$_pkgver" != x"${_pkgver_new:?}" ] ; then
        _pkgver="${_pkgver_new:?}"
        sed -Ei 's@^(\s*: \$\{_pkgver):=.*\}$@\1:='"${_pkgver:?}"'}@' "$startdir/PKGBUILD"
      fi
      ;;
  esac
}

# execute
_main_package
