# Maintainer:
# Contributor: VienC

# options
if [ ! -z "$_srcinfo" ] ; then
  _autoupdate=false
  _sse3=true
fi

if [ -z "$_pkgver" ] ; then
  : ${_autoupdate:=true}
else
  : ${_autoupdate:=false}
fi

: ${_sse3:=true}
: ${_pkgver:=117.0.5938.157}

# basic info
_pkgname="thorium-browser"
pkgname="$_pkgname-special-bin"
pkgdesc="Chromium fork focused on high performance and security (SSE3 version)"
url="https://github.com/Alex313031/Thorium-SSE3"
pkgver=117.0.5938.157
pkgrel=2
arch=('x86_64')
license=('BSD')

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
    if [ x"$_pkgver" != x"${_pkgver_new:?}" ] ; then
      _pkgver="$_pkgver_new"
      sed -Ei "s@^(\s*: \\\$\{_pkgver):=.*\}\$@\1:=${_pkgver:?}}@" "$startdir/PKGBUILD"
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

_dl_type="SSE3"
_dl_url="https://github.com/Alex313031/Thorium-SSE3/releases/download/M${_pkgver:?}"
_dl_filename="${_pkgname}_${_pkgver:?}_$_dl_type.deb"
noextract+=("$_dl_filename")
source+=("$_dl_url/$_dl_filename")
sha256sums+=('SKIP')

pkgver() {
  printf '%s' \
    "${_pkgver:?}"
}

_package() {
  echo "  -> Extracting the archive..."
  case "${_build_sse3::1}" in
    't'|'y'|'1')
      _dl_type="SSE3"
      _pkg_type="-sse3"
      ;;
  esac

  _dl_filename="${_pkgname}_${_pkgver:?}_$_dl_type.deb"
  bsdtar -xf "$_dl_filename" data.tar.xz
  bsdtar -xf data.tar.xz -C "${pkgdir:?}/"
  rm data.tar.xz

  echo "  -> Moving stuff in place..."
  mv "${pkgdir:?}/opt/chromium.org/thorium" "${pkgdir:?}/opt/$_pkgname$_pkg_type"
  unlink "${pkgdir:?}/usr/bin/thorium-browser"
  unlink "${pkgdir:?}/usr/bin/pak"

  sed -E "s@/opt/chromium.org/thorium/@/opt/$_pkgname$_pkg_type/@" \
    -i "${pkgdir:?}/usr/bin/thorium-shell"

  sed -E "s@/opt/chromium.org/thorium/@/opt/thorium-browser/@" \
    -i "${pkgdir:?}/usr/share/gnome-control-center/default-apps/thorium-browser.xml"

  # Launcher
  install -Dm755 "$_pkgname.sh" "${pkgdir:?}/usr/bin/$_pkgname$_pkg_type"
  chmod 4755 "${pkgdir:?}/opt/$_pkgname$_pkg_type/chrome-sandbox"

  case "${_build_sse3::1}" in
    't'|'y'|'1')
      local _type="-sse3"

      sed -E \
        -e "s@thorium-browser@$_pkgname$_pkg_type@" \
        -i "${pkgdir:?}/usr/bin/$_pkgname$_pkg_type"

      sed -E \
        -e "s@thorium-shell@thorium-shell$_type@" \
        -i "${pkgdir:?}/usr/bin/thorium-shell"

      mv "${pkgdir:?}/usr/bin/thorium-shell" "${pkgdir:?}/usr/bin/thorium-shell$_type"

      sed -E \
        -e "s@thorium-browser@$_pkgname$_pkg_type@" \
        -i "${pkgdir:?}/usr/share/gnome-control-center/default-apps/thorium-browser.xml"

      mv "${pkgdir:?}/usr/share/gnome-control-center/default-apps/thorium-browser.xml" "${pkgdir:?}/usr/share/gnome-control-center/default-apps/$_pkgname$_pkg_type.xml"

      sed -E \
        -e "s@thorium-browser@$_pkgname$_pkg_type@" \
        -i "${pkgdir:?}/usr/share/appdata/thorium-browser.appdata.xml"

      mv "${pkgdir:?}/usr/share/appdata/thorium-browser.appdata.xml" "${pkgdir:?}/usr/share/appdata/$_pkgname$_pkg_type.appdata.xml"

      sed -E \
        -e "s@$_pkgname@$_pkgname$_pkg_type@" \
        -e "s@thorium-shell@thorium-shell$_type@" \
        -i "${pkgdir:?}/usr/share/applications/thorium-browser.desktop"

      mv "${pkgdir:?}/usr/share/applications/thorium-browser.desktop" "${pkgdir:?}/usr/share/applications/$_pkgname$_pkg_type.desktop"

      sed -E \
        -e "s@^Icon=.*\$@Icon=thorium-shell$_type@" \
        -e "s@thorium-shell@thorium-shell$_type@" \
        -e "s@thorium_shell@thorium_shell${_type//-/_}@" \
        -i "${pkgdir:?}/usr/share/applications/thorium-shell.desktop"

      mv "${pkgdir:?}/usr/share/applications/thorium-shell.desktop" "${pkgdir:?}/usr/share/applications/thorium-shell$_type.desktop"

      mv "${pkgdir:?}/usr/share/man/man1/thorium-browser.1.gz" "${pkgdir:?}/usr/share/man/man1/$_pkgname$_pkg_type.1.gz"
      ;;
  esac

  # Icons
  for i in 16 24 32 48 64 128 256; do
    install -Dm644 "${pkgdir:?}/opt/$_pkgname$_pkg_type/product_logo_${i}.png" \
      "${pkgdir:?}/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname$_pkg_type.png"
  done

  install -Dm644 "${pkgdir:?}/opt/$_pkgname$_pkg_type/thorium_shell.png" \
    "${pkgdir:?}/usr/share/icons/hicolor/256x256/apps/thorium-shell$_type.png"

  echo "  -> Removing Debian Cron job, duplicate product logos and menu directory..."
  rm -r -- \
  "${pkgdir:?}/opt/chromium.org" \
    "${pkgdir:?}/etc/cron.daily/" \
    "${pkgdir:?}/usr/share/doc/" \
    "${pkgdir:?}/opt/$_pkgname$_pkg_type/cron/" \
    "${pkgdir:?}/opt/$_pkgname$_pkg_type"/product_logo_*.{png,xpm} \
    "${pkgdir:?}/usr/share/menu/"
}

package() {
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
