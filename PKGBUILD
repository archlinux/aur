# Maintainer: xiota / aur.chaotic.cx

# Copyright (c) 2022 Alex313031, JPratama7, and StarterX4.
# Contributor: JPratama7 <josepratama080@gmail.com>
# Contributor: Dominik Adrian Grzywak <starterx4 at gmail dot com>

# options
if [ ! -z "$_srcinfo" ] ; then
  _autoupdate=false
  _sse3=true
  _sse4=true
fi

if [ -z "$_pkgver" ] ; then
  : ${_autoupdate:=true}
else
  : ${_autoupdate:=false}
fi

: ${_sse3:=false}

case "${_sse3::1}" in
  't'|'y'|'1')
    : ${_sse4:=false}
    ;;
  *)
    : ${_sse4:=true}
    ;;
esac

: ${_pkgver:=117.0.5938.157}

# basic info
_pkgname="thorium-browser"
pkgbase="$_pkgname-bin"
pkgdesc="Chromium fork focused on high performance and security"
pkgver=117.0.5938.157
pkgrel=3
arch=('x86_64')
license=('GPL3')

case "${_sse3::1}" in
  't'|'y'|'1')
    pkgname+=("$_pkgname-sse3-bin")
    url="https://github.com/Alex313031/Thorium-SSE3"
    ;;
esac

case "${_sse4::1}" in
  't'|'y'|'1')
    pkgname+=("$_pkgname-bin")
    url="https://github.com/Alex313031/Thorium"
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

depends=()
makedepends=()
optdepends=(
  'pipewire: WebRTC desktop sharing under Wayland'
  'kdialog: for file dialogs in KDE'
  'gnome-keyring: for storing passwords in GNOME keyring'
  'kwallet: for storing passwords in KWallet'
)

options=('!emptydirs' '!strip')
install="$_pkgname.install"

source=("$_pkgname.sh")
sha256sums=('e09c5c523f45b8acfd58403514f9ad69047daa94600787bd7aee33d78080f9a9')

case "${_sse3::1}" in
  't'|'y'|'1')
    _dl_type="SSE3"
    _dl_url="$url/releases/download/M${_pkgver:?}"
    _dl_filename="${_pkgname}_${_pkgver:?}_$_dl_type.deb"
    noextract+=("$_dl_filename")
    source+=("$_dl_url/$_dl_filename")
    sha256sums+=('SKIP')
    ;;
esac

case "${_sse4::1}" in
  't'|'y'|'1')
    _dl_type="amd64"
    _dl_url="$url/releases/download/M${_pkgver:?}"
    _dl_filename="${_pkgname}_${_pkgver:?}_$_dl_type.deb"
    noextract+=("$_dl_filename")
    source+=("$_dl_url/$_dl_filename")
    sha256sums+=('SKIP')
    ;;
esac

pkgver() {
  printf '%s' \
    "${_pkgver:?}"
}

_package() {
  echo "  -> Extracting the archive..."
  case "${_build_sse3::1}" in
    't'|'y'|'1')
      _dl_type="SSE3"
      ;;
    *)
      _dl_type="amd64"
      ;;
  esac

  _dl_filename="${_pkgname}_${_pkgver:?}_$_dl_type.deb"
  bsdtar -xf "$_dl_filename" data.tar.xz
  bsdtar -xf data.tar.xz -C "${pkgdir:?}/"
  rm data.tar.xz

  echo "  -> Moving stuff in place..."
  mv "${pkgdir:?}/opt/chromium.org/thorium" "${pkgdir:?}/opt/${pkgname%-bin}"
  unlink "${pkgdir:?}/usr/bin/thorium-browser"
  unlink "${pkgdir:?}/usr/bin/pak"

  sed -E "s@/opt/chromium.org/thorium/@/opt/${pkgname%-bin}/@" \
    -i "${pkgdir:?}/usr/bin/thorium-shell"

  sed -E "s@/opt/chromium.org/thorium/@/opt/thorium-browser/@" \
    -i "${pkgdir:?}/usr/share/gnome-control-center/default-apps/thorium-browser.xml"

  # Launcher
  install -Dm755 "$_pkgname.sh" "${pkgdir:?}/usr/bin/${pkgname%-bin}"
  chmod 4755 "${pkgdir:?}/opt/${pkgname%-bin}/chrome-sandbox"

  case "${_build_sse3::1}" in
    't'|'y'|'1')
      local _type="-sse3"

      sed -E \
        -e "s@thorium-browser@${pkgname%-bin}@" \
        -i "${pkgdir:?}/usr/bin/${pkgname%-bin}"

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

package_thorium-browser-bin() {
  url="https://github.com/Alex313031/Thorium"
  provides=("$_pkgname")
  conflicts=("$_pkgname")

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

  _build_sse3=false _package
}

package_thorium-browser-sse3-bin() {
  url="https://github.com/Alex313031/Thorium-SSE3"
  provides=("$_pkgname-sse3")
  conflicts=("$_pkgname-sse3")

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

  _build_sse3=true _package
}
