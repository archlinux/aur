# Maintainer: xiota / aur.chaotic.cx

# Copyright (c) 2022 Alex313031, JPratama7, and StarterX4.
# Contributor: JPratama7 <josepratama080@gmail.com>
# Contributor: Dominik Adrian Grzywak <starterx4 at gmail dot com>

# options - defaults
if [ -z "$_pkgver" ] || [ ! -z "$_srcinfo" ] ; then
  : ${_autoupdate:=true}
else
  : ${_autoupdate:=false}
fi

: ${_pkgver:=117.0.5938.157}
: ${_sse3:=false}

# basic info
_pkgname="thorium-browser"
pkgdesc="Chromium fork focused on high performance and security"
pkgver=117.0.5938.157
pkgrel=2

case "${_sse3::1}" in
  't'|'y'|'1')
    pkgname="$_pkgname-sse3-bin"
    url="https://github.com/Alex313031/Thorium-SSE3"
    dl_type="SSE3"
    ;;
  *)
    pkgname="$_pkgname-bin"
    url="https://github.com/Alex313031/Thorium"
    dl_type="amd64"
    ;;
esac

# update version
case "${_autoupdate::1}" in
  't'|'y'|'1')
    _response=$(curl "https://api.github.com/repos/${url#*.com/}/releases" -s)

    _regex='^.*thorium-browser_([0-9\.]+)_.*\.deb.*$'
    _pkgver_new=$(
      printf '%s' "$_response" \
        | grep -E "$_regex" | head -1 | sed -E "s@$_regex@\1@"
    )

    # update _pkgver
    if [ x"${_pkgver:?}" != x"${_pkgver_new:?}" ] ; then
      _pkgver="$_pkgver_new"
      sed -Ei "s@^(\s*: \\\$\{_pkgver):=.*\}\$@\1:=$_pkgver}@" "$startdir/PKGBUILD"
    fi
    ;;
esac

arch=('x86_64')
license=('GPL3')

depends=()
makedepends=()
optdepends=(
  'pipewire: WebRTC desktop sharing under Wayland'
  'kdialog: for file dialogs in KDE'
  'gnome-keyring: for storing passwords in GNOME keyring'
  'kwallet: for storing passwords in KWallet'
)

if [ x"$_pkgname" != x"$pkgname" ] ; then
  provides=("${pkgname%-*}")
  conflicts=("${pkgname%-*}")
fi

options=('!emptydirs' '!strip')
install="$_pkgname.install"

_dl_url="$url/releases/download/M${_pkgver:?}"
_dl_filename="${_pkgname}_${_pkgver:?}_$dl_type.deb"
source=(
  "$_dl_url/$_dl_filename"
  "$_pkgname.sh"
)
sha256sums=(
  'SKIP'
  'e09c5c523f45b8acfd58403514f9ad69047daa94600787bd7aee33d78080f9a9'
)

pkgver() {
  printf '%s' \
    "${_pkgver:?}"
}

package() {
  depends+=(
    'alsa-lib'
    'gtk3'
    'libcups'
    'libxss'
    'libxtst'
    'nss'
    'ttf-liberation'
    'xdg-utils'
  )

  echo "  -> Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "${pkgdir:?}/"

  echo "  -> Moving stuff in place..."
  mv "${pkgdir:?}/opt/chromium.org/thorium" "${pkgdir:?}/opt/${pkgname%-bin}"
  unlink "${pkgdir:?}/usr/bin/thorium-browser"
  unlink "${pkgdir:?}/usr/bin/pak"

  sed -E "s@/opt/chromium.org/thorium/@/opt/${pkgname%-bin}/@" \
    -i "${pkgdir:?}/usr/bin/thorium-shell"

  sed -E "s@/opt/chromium.org/thorium/@/opt/thorium-browser/@" \
    -i "${pkgdir:?}/usr/share/gnome-control-center/default-apps/thorium-browser.xml"

  case "${_sse3::1}" in
    't'|'y'|'1')
      local _type="-sse3"

      sed -E \
        -e "s@thorium-browser@${pkgname%-bin}@" \
        -i "${srcdir:?}/$_pkgname.sh"

      sed -E \
        -e "s@thorium-shell@thorium-shell$_type@" \
        -i "${pkgdir:?}/usr/bin/thorium-shell"

      mv "${pkgdir:?}/usr/bin/thorium-shell" "${pkgdir:?}/usr/bin/thorium-shell$_type"

      sed -E \
        -e "s@thorium-browser@${pkgname%-bin}@" \
        -i "${pkgdir:?}/usr/share/gnome-control-center/default-apps/thorium-browser.xml"

      mv "${pkgdir:?}/usr/share/gnome-control-center/default-apps/thorium-browser.xml" "${pkgdir:?}/usr/share/gnome-control-center/default-apps/${pkgname%-bin}.xml"

      sed -E \
        -e "s@thorium-browser@${pkgname%-bin}@" \
        -i "${pkgdir:?}/usr/share/appdata/thorium-browser.appdata.xml"

      mv "${pkgdir:?}/usr/share/appdata/thorium-browser.appdata.xml" "${pkgdir:?}/usr/share/appdata/${pkgname%-bin}.appdata.xml"

      sed -E \
        -e "s@$_pkgname@${pkgname%-bin}@" \
        -e "s@thorium-shell@thorium-shell$_type@" \
        -i "${pkgdir:?}/usr/share/applications/thorium-browser.desktop"

      mv "${pkgdir:?}/usr/share/applications/thorium-browser.desktop" "${pkgdir:?}/usr/share/applications/${pkgname%-bin}.desktop"

      sed -E \
        -e "s@^Icon=.*\$@Icon=thorium-shell$_type@" \
        -e "s@thorium-shell@thorium-shell$_type@" \
        -e "s@thorium_shell@thorium_shell${_type//-/_}@" \
        -i "${pkgdir:?}/usr/share/applications/thorium-shell.desktop"

      mv "${pkgdir:?}/usr/share/applications/thorium-shell.desktop" "${pkgdir:?}/usr/share/applications/thorium-shell$_type.desktop"

      mv "${pkgdir:?}/usr/share/man/man1/thorium-browser.1.gz" "${pkgdir:?}/usr/share/man/man1/${pkgname%-bin}.1.gz"
      ;;
  esac

  # Launcher
  install -Dm755 "$_pkgname.sh" "${pkgdir:?}/usr/bin/${pkgname%-bin}"
  chmod 4755 "${pkgdir:?}/opt/${pkgname%-bin}/chrome-sandbox"

  sed -E \
    -e "s@/opt/thorium-browser/@/opt/${pkgname%-bin}/@" \
    -i "${pkgdir:?}/usr/bin/${pkgname%-bin}"

  # Icons
  for i in 16 24 32 48 64 128 256; do
    install -Dm644 "${pkgdir:?}/opt/${pkgname%-bin}/product_logo_${i}.png" \
      "${pkgdir:?}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname%-bin}.png"
  done

  install -Dm644 "${pkgdir:?}/opt/${pkgname%-bin}/thorium_shell.png" \
    "${pkgdir:?}/usr/share/icons/hicolor/256x256/apps/thorium-shell$_type.png"

  echo "  -> Removing Debian Cron job, duplicate product logos and menu directory..."
  rm -r -- \
  "${pkgdir:?}/opt/chromium.org" \
    "${pkgdir:?}/etc/cron.daily/" \
    "${pkgdir:?}/usr/share/doc/" \
    "${pkgdir:?}/opt/${pkgname%-bin}/cron/" \
    "${pkgdir:?}/opt/${pkgname%-bin}"/product_logo_*.{png,xpm} \
    "${pkgdir:?}/usr/share/menu/"
}
